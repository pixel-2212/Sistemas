using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Sistemas
{
    public partial class Default1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /* Se realiza validacion de la sesion a traves del correo y la contraseña, los cuales
             se generan al momento de acceder al sistema, si la sesion esta activa, se redirige
             al usuario a la pagina principal del sistema*/
            if (Session["correo"] != null && Session["contraseña"] != null)
            {
                Response.Redirect("Index.aspx");
            }
            else
            {
                
            }
        }

        protected void Login_Click(object sender, EventArgs e)
        {
            /* Se establece la conexion a la base de datos */
            string cadena = "Data Source=desktop-nhq9k8k;Initial Catalog=sistemas;Integrated Security=True";
            SqlConnection conexion = new SqlConnection(cadena);

            string correo = email.Text;
            /* Se hace la consulta para verficar que el correo exsita */
            string query = "select contraseña from usuarios where correo = @correo";

            SqlCommand comand = new SqlCommand(query, conexion);
            comand.Parameters.AddWithValue("@correo",Convert.ToString(email.Text));

            conexion.Open();
            /* Aca se verifica si el correo existe */
            if (comand.ExecuteScalar() != null)
            {
                /* Si el correo existe se realiza a comparar la contraseña ingresada
                   con la que se encuentra en la base de datos */
                string pass = comand.ExecuteScalar().ToString();
                if (password.Text == pass)
                {
                    // Si la contraseña es identica se cambia el estado del usuario a "activo"
                    string querystr = "Update usuarios set estado = 'activo' where correo = @correo";
                    SqlCommand query2 = new SqlCommand(querystr, conexion);
                    query2.Parameters.AddWithValue("@correo", Convert.ToString(email.Text));
                    query2.ExecuteNonQuery();
                    // Se crea la sesion del usuario a traves del correo y la contraseña
                    Session["correo"] = email.Text;
                    Session["contraseña"] = password.Text;
                    // Se redirige al usuario a la pagina principal del sistema
                    Response.Redirect("Index.aspx");
                }
                else
                {
                    /* Si la contraseña es in correcta aparece un mensaje en la ventana del usuario
                     * informando que la contraseña que ingreso es incorrecta*/
                    Literal1.Text = "<script language='javascript'>M.toast({html: 'La contraseña es incorrecta', classes: 'rounded'});</script>";
                }
            }
            else
            {
                /* Si el correo no existe, aparece un mensaje en la ventana del usuario
                 * informando que el correo no existe */
                Literal1.Text = "<script language='javascript'>M.toast({html: 'El correo no existe', classes: 'rounded'});</script>";
            }
            
            conexion.Close();

        }
    }
}