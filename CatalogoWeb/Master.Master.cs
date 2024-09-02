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
    public partial class Master : System.Web.UI.MasterPage
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            
            imgAvatar.ImageUrl = "https://www.thematicland.com/wp-content/uploads/2021/08/202-2022264_usuario-annimo-usuario-annimo-user-icon-png-transparent.png";

            if (Page is Default)
            {
                if (Seguridad.sesionActiva(Session["trainee"]))
                {
                    Trainee user = (Trainee)Session["Trainee"];
                    lblUser.Text = user.Email;

                    if (!string.IsNullOrEmpty(user.ImagenPerfil))
                    {
                        imgAvatar.ImageUrl = "~/Images/" + user.ImagenPerfil + "?v=" + DateTime.Now.Ticks.ToString();
                       
                    }
                }
            }

            if (!( Page is Login || Page is Registro || Page is Default || Page is Error || Page is DetalleArticulo /*|| Page is CatalogoList*/ ))
            {
               
                if (!Seguridad.sesionActiva(Session["trainee"]))
                {
                   
                    Response.Redirect("Login.aspx", false);

                }
                else
                {
                    Trainee user = (Trainee)Session["Trainee"];
                    lblUser.Text = user.Email;
                    if (!(string.IsNullOrEmpty(user.ImagenPerfil)))
                    {
                        imgAvatar.ImageUrl = "~/Images/" + user.ImagenPerfil + "?v=" + DateTime.Now.Ticks.ToString(); 

                    }
                }
            }

        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }
    }
}