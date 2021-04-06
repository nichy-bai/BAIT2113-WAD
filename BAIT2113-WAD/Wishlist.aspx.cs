using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace BAIT2113_WAD
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CustomerID"] != null)
            {
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

        protected void Wishlist(object sender, EventArgs e)
        {
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
        }
        protected void Delete_Click(object sender, EventArgs e)
        {
            ImageButton btn = (ImageButton)sender;
            RepeaterItem item = (RepeaterItem)btn.NamingContainer;
            Label artImage = (Label)item.FindControl("artworkID");
            String artID = artImage.Text;

            SqlConnection Con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True;MultipleActiveResultSets=True;");
            Con.Open();
            SqlCommand deleteWishlist = new SqlCommand("DELETE From [dbo].[Wishlist] WHERE [Wishlist].customerID = @customerID AND [Wishlist].artworkID = @ArtworkID ", Con);
            deleteWishlist.Parameters.AddWithValue("@customerID", Session["CustomerID"].ToString());
            deleteWishlist.Parameters.AddWithValue("@ArtworkID", artID);
            deleteWishlist.ExecuteNonQuery();
            Con.Close();

            Response.Redirect("~/Wishlist.aspx");
        }

        protected void Page_Error(object sender, EventArgs e)
        {
            Exception Ex = Server.GetLastError();
            Server.ClearError();
            Response.Redirect("/errors/Error.html");
        }

    }
}