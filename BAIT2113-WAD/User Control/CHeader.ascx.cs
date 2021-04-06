using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BAIT2113_WAD.User_Control
{
    public partial class CHeader : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = DateTime.Now.ToShortDateString();
            Label2.Text = DateTime.Now.ToLongTimeString();
        }
    }
}