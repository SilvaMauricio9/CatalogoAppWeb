using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CatalogoWeb
{
    public partial class Favoritos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                ArticuloFavorito negocio = new ArticuloFavorito();
                Favorito nuevo = new Favorito();

                Usuario user = (Usuario)Session["trainee"];

                nuevo.IdUser = user.Id;
                nuevo.IdArticulo = user.Id;

                negocio.agregarNuevoFavorito(nuevo);
                int IdUsuario = user.Id;
                Session.Add("listaArticulosFavoritos", negocio.listarIdFavorito(int.Parse(IdUsuario.ToString())));

                repRepetidor.DataSource = Session["listaArticulosFavoritos"];
                repRepetidor.DataBind();
            }


        }
    }
}