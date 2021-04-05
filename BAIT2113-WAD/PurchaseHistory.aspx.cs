using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BAIT2113_WAD
{
    public partial class PurchaseHistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CustomerID"] != null)
            {

            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(),"alert", "alert('You must log in as a customer to access this feature.');window.location ='Homepage.aspx';", true);
                
            }
        }
    }
}