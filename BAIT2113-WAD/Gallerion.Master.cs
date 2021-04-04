using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BAIT2113_WAD
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (Session["ArtistID"] != null || Session["CustomerID"] != null)
            {
                dropbtn2.Text = "Logout";
            }
            else
            {
                dropbtn2.Text = "Login";
            }

        }

        protected void dropbtn2_Click(object sender, EventArgs e)
        {
            
            if (dropbtn2.Text == "Logout")
            {
                Session.Abandon();
                Response.Redirect("Homepage.aspx");
            }
            if (dropbtn2.Text == "Login")
            {
                Response.Redirect("Login.aspx");
            }
            
        }
    }
}