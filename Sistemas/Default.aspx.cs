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
            string cadena = "Data Source=desktop-nhq9k8k;Initial Catalog=sistemas;Integrated Security=True";
            SqlConnection conexion = new SqlConnection(cadena);

            string correo = email.Text;

            string query = "select contraseña from usuarios where correo = @correo";

            SqlCommand comand = new SqlCommand(query, conexion);
            comand.Parameters.AddWithValue("@correo",Convert.ToString(email.Text));

            conexion.Open();
            if (comand.ExecuteScalar() != null)
            {
                string pass = comand.ExecuteScalar().ToString();
                if (password.Text == pass)
                {
                    string querystr = "Update usuarios set estado = 'activo' where correo = @correo";
                    SqlCommand query2 = new SqlCommand(querystr, conexion);
                    query2.Parameters.AddWithValue("@correo", Convert.ToString(email.Text));
                    query2.ExecuteNonQuery();
                    Session["correo"] = email.Text;
                    Session["contraseña"] = password.Text;
                    Response.Redirect("Index.aspx");
                }
                else
                {
                    Literal1.Text = "<script language='javascript'>M.toast({html: 'La contraseña es incorrecta', classes: 'rounded'});</script>";
                }
            }
            else
            {
                Literal1.Text = "<script language='javascript'>M.toast({html: 'El correo no existe', classes: 'rounded'});</script>";
            }
            
            conexion.Close();

        }
    }
}