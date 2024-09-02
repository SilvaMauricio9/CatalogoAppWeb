using dominio;
using System;
using System.Collections.Generic;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace negocio
{
    public class UsuarioNegocio
    {
        public bool Logear(Usuario usuario) 
        {
			AccesoDatos datos = new AccesoDatos();
			try
			{
				datos.setearConsulta("Select Id, tipouser from USUARIOS Where usuario = @user AND pass = @pass");
				datos.setearParametro("@user", usuario.User);
				datos.setearParametro("@pass", usuario.Pass);

                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    usuario.Id = (int)datos.Lector["Id"];
                    usuario.TipoUsuario = (int)(datos.Lector["TipoUser"]) == 2 ? TipoUsuario.ADMIN : TipoUsuario.NORMAL;
                    return true;
                }
                return false;
            }
			catch (Exception ex)
			{

                throw ex;
			}
            finally 
            {
                datos.cerrarConexion(); 
            }
        }
    }
}
