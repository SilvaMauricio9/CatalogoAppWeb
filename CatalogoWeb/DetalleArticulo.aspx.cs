using System;
using System.Collections.Generic;
using System.EnterpriseServices;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace CatalogoWeb
{
    public partial class DetalleArticulo : System.Web.UI.Page
    {
        public bool ConfirmaEliminacion { get; set; }

        //public List<Articulo> ArticuloList = new List<Articulo>();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                CategorioNegocio negocio = new CategorioNegocio();
                List<Categoria> lista = negocio.listar();
                MarcaNegocio negocio1 = new MarcaNegocio();
                List<Marca> listar = negocio1.listar();

                ddlArticulo.DataSource = lista;
                ddlArticulo.DataValueField = "id";
                ddlArticulo.DataTextField = "Descripcion";
                ddlArticulo.DataBind();

                ddlMarca.DataSource = listar;
                ddlMarca.DataValueField = "id";
                ddlMarca.DataTextField = "Descripcion";
                ddlMarca.DataBind();
            }
                string id = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";
            if (id != "" && !IsPostBack)
            {
                ArticuloNegocio articulo = new ArticuloNegocio();
                Articulo seleccionado = articulo.listar(id)[0];
                Session.Add("ArticuloList", seleccionado);

                txtId.Text = seleccionado.Id.ToString();
                txtNombre.Text = seleccionado.Nombre;
                txtNombre.ReadOnly = true;
                txtCodigo.Text = seleccionado.Codigo.ToString();
                txtCodigo.ReadOnly = true;
                txtDescripcion.Text = seleccionado.Descripcion;
                txtDescripcion.ReadOnly = true;
                txtPrecio.Text = seleccionado.Precio.ToString();
                txtPrecio.ReadOnly = true;
                txtUrlImagen.Text = seleccionado.ImagenUrl;
                txtUrlImagen.ReadOnly = true;

                ddlArticulo.SelectedValue = seleccionado.Articulos.Id.ToString();
                ddlArticulo.Enabled = false;
                ddlMarca.SelectedValue = seleccionado.Marcas.Id.ToString();
                ddlMarca.Enabled = false;
                txtUrlImagen_TextChanged(sender, e);


            }

            
        
        }

        protected void btnConfirmaEliminar_Click(object sender, EventArgs e)
        {

        }

        protected void txtUrlImagen_TextChanged(object sender, EventArgs e)
        {
            imgCatalogo.ImageUrl = txtUrlImagen.Text;
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {

        }
    }
}