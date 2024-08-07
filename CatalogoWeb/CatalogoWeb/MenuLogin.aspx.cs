using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CatalogoWeb
{

    public partial class MenuLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] == null)
            {
                Session.Add("Error", "Debes loguearte para ingresar");
                Response.Redirect("Error.aspx", false);
            }

        }

        protected void btnPagina1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void btnPagina2_Click(object sender, EventArgs e)
        {
            Response.Redirect("LoginAdmin.aspx");
        }
    }
} 