using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace BAIT2113_WAD
{
    public partial class Order : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            {
                

                String strOrderCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection orderCon = new SqlConnection(strOrderCon);
                orderCon.Open();
                String strSelectItem = "SELECT image FROM Artwork WHERE (Artwork.artworkID = @artworkID);";
                SqlCommand cmdSelectItem = new SqlCommand(strSelectItem, orderCon);
                cmdSelectItem.Parameters.AddWithValue("@ArtworkID", Session["artworkID"].ToString());
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmdSelectItem;
                DataTable dt = new DataTable();
                da.Fill(dt);
                DetailsView1.DataSource = cmdSelectItem.ExecuteReader();
                DetailsView1.DataBind();
                orderCon.Close();
            }

           

            //try
            //{
            //    Response.Write(string.Format("My name is {0} and email address is {1}}",
            //                                  Context.Items["imageURL"].ToString(),
            //                                  Context.Items["artworkName"].ToString()));
            //}
            //catch (NullReferenceException ex)
            //{
            //    Response.Write(ex.Message);
            //}
            //string artworkName = Session["artworkName"].ToString();
        }
        protected void AddToWish_Click(object sender, EventArgs e)
        {
            /*if (Session["userID"] != null)
            {
                String strOrderCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection orderCon = new SqlConnection(strOrderCon);
                orderCon.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO Wishlist (UserID, ArtworkID) VALUES ('" + Session["userID"].ToString() + "','" + HiddenField1.Value + "')");
                cmd.ExecuteNonQuery();
                orderCon.Close();
            }
            else
            {
                Response.Redirect("~/Login.aspx");
            }*/
        }
    }
}