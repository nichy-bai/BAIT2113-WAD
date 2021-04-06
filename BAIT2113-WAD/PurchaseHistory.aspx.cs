using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace BAIT2113_WAD
{
    public partial class PurchaseHistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CustomerID"] != null)
            {
                var ctl = Page.LoadControl("~/User Control/CHeader.ascx");
                HeaderPlaceHolder.Controls.Add(ctl);

                string ID = Session["CustomerID"].ToString();

                string sql2 = "Select * from Customer where customerID = @ID ";
                SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
                SqlCommand cmd = new SqlCommand(sql2, con);
                SqlDataReader rdr;
                cmd.Parameters.AddWithValue("@ID", ID);
                con.Open();
                rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    lblCustomerID.Text = rdr["customerID"].ToString();
                    lblCustomerName.Text = rdr["name"].ToString();
                    lbldob.Text = rdr["dob"].ToString();
                    lblphone.Text = rdr["phoneNum"].ToString();
                    lblemail.Text = rdr["email"].ToString();
                    profilepic.ImageUrl = rdr["profilePic"].ToString();
                    lbladdress.Text = rdr["street"].ToString() + ", " + rdr["city"].ToString() + ", " + rdr["zipCode"].ToString() + ", " + rdr["state"].ToString();
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('You must log in as a customer to access this feature.');window.location ='Homepage.aspx';", true);

            }
        }

        protected void Page_Error(object sender, EventArgs e)
        {
            Exception Ex = Server.GetLastError();
            Server.ClearError();
            Response.Redirect("/errors/Error.html");
        }

    }
}
