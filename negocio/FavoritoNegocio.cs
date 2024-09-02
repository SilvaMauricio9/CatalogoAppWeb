using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using negocio;
using dominio;

namespace negocio
{
    public class ArticuloFavorito
    {
        public List<int> listarIdFavorito(int IdUser)
        {
           
            List<int> lista = new List<int>();
            AccesoDatos datos = new AccesoDatos();
            
            try
            {
                datos.setearConsulta("Select IdArticulo from FAVORITOS where IdUser = @idUser");
                datos.setearParametro("@idUser", IdUser);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    int aux = (int)datos.Lector["idArticulo"];
                    lista.Add(aux);
                }
                datos.cerrarConexion();
                return lista;
                
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public void agregarNuevoFavorito(Favorito nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("insert into FAVORITOS (IdUser, IdArticulo) OUTPUT INSERTED.ID VALUES (@idUser, @idArticulo)");
                datos.setearParametro("@idUser", nuevo.IdUser);
                datos.setearParametro("@idArticulo", nuevo.IdArticulo);
                datos.ejecutarAccion();

                if (datos.Lector.Read())
                {
                    int cantidad = Convert.ToInt32(datos.Lector[0]);
                    if (cantidad > 0)
                    {
                        datos.cerrarConexion();
                        return;
                    }
                }
                datos.cerrarConexion();

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public void eliminarFavorito(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            datos.setearConsulta("DELETE FROM FAVORITOS WHERE IdArticulo = @idArticulo");
            datos.setearParametro("@idArticulo", id);
            datos.ejecutarAccion();
        }
    }
}
