using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Sistemas
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["correo"] != null && Session["contraseña"] != null)
            {

            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }
    }
}