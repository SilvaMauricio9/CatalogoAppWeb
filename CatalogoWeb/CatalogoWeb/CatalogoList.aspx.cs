using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;
using dominio;

namespace CatalogoWeb
{
    public partial class CatalogoList : System.Web.UI.Page
    {
        public bool FiltroAvanzado {  get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (!Seguridad.sesionActiva(Session["trainee"]))
                {
                    Session.Add("error", "Debes iniciar sesion");
                    Response.Redirect("Login.aspx");
                }
            }

            if (!Seguridad.esAdmin(Session["trainee"]))
            {
                Session.Add("error", "Se requiere permisos de Admin para acceder");
                Response.Redirect("Error.aspx");
            }

            FiltroAvanzado = chkAvanzado.Checked;
            if (!IsPostBack)
            {
                ArticuloNegocio negocio = new ArticuloNegocio();
                Session.Add("listaArticulos", negocio.listarConSP());
                dgvCatalogo.DataSource = Session["listaArticulos"];
                dgvCatalogo.DataBind();
            }
      
        }
        protected void dgvCatalogo_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = dgvCatalogo.SelectedDataKey.Value.ToString();
            Response.Redirect("FormularioCatalogo.aspx?id=" + id);
        }

        protected void dgvCatalogo_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvCatalogo.PageIndex = e.NewPageIndex;
            dgvCatalogo.DataBind();
        }

        protected void filtro_TextChanged(object sender, EventArgs e)
        {
            List<Articulo> lista = (List<Articulo>)Session["listaArticulos"];
            List<Articulo> listaFiltrada = lista.FindAll(X => X.Nombre.ToUpper().Contains(txtFiltro.Text.ToUpper()));
            dgvCatalogo.DataSource= listaFiltrada;
            dgvCatalogo.DataBind();
        }

        protected void chkAvanzado_CheckedChanged(object sender, EventArgs e)
        {
            FiltroAvanzado = chkAvanzado.Checked;
            txtFiltro.Enabled = !FiltroAvanzado;
        }

        protected void dllCampo_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlCriterio.Items.Clear();
            if (ddlCampo.SelectedItem.ToString() == "Precio")
            {
                ddlCriterio.Items.Add("Igual a");
                ddlCriterio.Items.Add("Mayor a");
                ddlCriterio.Items.Add("Menor a");
            }
            else
            {
                ddlCriterio.Items.Add("Contiene");
                ddlCriterio.Items.Add("Comienza Con");
                ddlCriterio.Items.Add("Termina Con");
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                ArticuloNegocio negocio = new ArticuloNegocio();
                dgvCatalogo.DataSource = negocio.filtrar(ddlCampo.SelectedItem.ToString(), 
                ddlCriterio.SelectedItem.ToString(), 
                txtFiltroAvanzado.Text); 

                dgvCatalogo.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}