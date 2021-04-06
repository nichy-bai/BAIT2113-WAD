using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BAIT2113_WAD
{
    public partial class BuyNow : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["CustomerID"] != null)
            {
                string artworkID = Session["ArtworkID"].ToString();
                string buyQty = Session["QuantityBuy"].ToString();

                string sql2 = "Select * from Artwork where artworkID = @ArtworkID ";
                SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
                SqlCommand cmd = new SqlCommand(sql2, con);
                SqlDataReader rdr;
                cmd.Parameters.AddWithValue("@ArtworkID", artworkID);
                con.Open();
                rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Image1.ImageUrl = rdr["image"].ToString();
                    Label2.Text = rdr["artworkName"].ToString();
                    Label3.Text = rdr["price"].ToString();
                }
                Label4.Text = buyQty;
                int QuantityBuy = Convert.ToInt32(Label4.Text);
                double price = Convert.ToDouble(Label3.Text);
                double total = QuantityBuy * price;

                Label5.Text = Convert.ToString(total);

                con.Close();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('You must log in as a customer to access this feature.');window.location ='Homepage.aspx';", true);
            }

        }

        protected void checkout_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CheckoutBuyNow.aspx");
        }
    }
}