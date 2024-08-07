using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using System.EnterpriseServices;
using System.Configuration;

namespace CatalogoWeb
{
    public partial class Default : System.Web.UI.Page
    {
        public List<Articulo> ListaArticulos { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            ArticuloNegocio negocio = new ArticuloNegocio();
            ListaArticulos = negocio.listarConSP();

            if (!IsPostBack)
            {
                repRepetidor.DataSource = ListaArticulos;
                repRepetidor.DataBind();

            }

        }
        protected void btnDetalle_Click(object sender, EventArgs e)
        {
            string valor = ((Button)sender).CommandArgument[0].ToString();
            Response.Redirect("DetalleArticulo.aspx" + valor);
        }

        protected void btnFavorito_Click1(object sender, EventArgs e)
        {


            if (!Seguridad.sesionActiva(Session["trainee"]))
            {
                Session.Add("error", "Debes iniciar sesion");
                Response.Redirect("Login.aspx");
            }
            else
            {
                ArticuloFavorito negocio = new ArticuloFavorito();
                Favorito nuevo = new Favorito();

                Button btn = (Button)sender;
                string id = btn.CommandArgument;

                nuevo.IdArticulo = int.Parse(id);
                Trainee user = (Trainee)Session["trainee"];
                nuevo.IdUser = user.Id;

                negocio.agregarNuevoFavorito(nuevo);
            }



        }
    }
}