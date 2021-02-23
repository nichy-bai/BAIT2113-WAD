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

            
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(strCon);

            con.Open();
            string strSelect = "SELECT Artwork.ArtworkName FROM Artwork WHERE (Artwork.artworkID = @artworkID);";
            SqlCommand cmdSelect = new SqlCommand(strSelect, con);
            cmdSelect.Parameters.AddWithValue("@artworkID", Session["artworkID"].ToString());
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmdSelect;
            DataTable dt = new DataTable();
            da.Fill(dt);
            artworkName.DataSource = cmdSelect.ExecuteReader();
            artworkName.DataBind();
            con.Close();

            con.Open();
            strSelect = "SELECT Artist.name, Artwork.quantity, Artwork.artworkName, Artwork.artworkDesc, Artwork.price, Artwork.artworkID FROM Artist CROSS JOIN Artwork WHERE (Artwork.artworkID = @artworkID);";
            cmdSelect = new SqlCommand(strSelect, con);
            cmdSelect.Parameters.AddWithValue("@artworkID", Session["artworkID"].ToString());
            da = new SqlDataAdapter();
            da.SelectCommand = cmdSelect;
            dt = new DataTable();
            da.Fill(dt);
            orderDetails.DataSource = cmdSelect.ExecuteReader();
            orderDetails.DataBind();
            con.Close();


            //String temp = " ";
            //if (!IsPostBack)
            //{
            //    try
            //    {
            //        temp = Context.Items["ArtworkID"].ToString();
            //    }
            //    catch (NullReferenceException ex)
            //    {
            //        Response.Write(ex.Message);
            //    }
            //}
            //else
            //{
            //    temp = Session["artworkID"].ToString();
            //}

            //Session["artworkID"] = temp;
            //HiddenField1.Value = temp;

            /*String strOrderCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection orderCon = new SqlConnection(strOrderCon);
            orderCon.Open();
            strSelectItem = "SELECT Image FROM Artwork WHERE (Artork.ArtworkID = @ArtworkID);";
            cmdSelectItem = new SqlCommand(strSelectItem, orderCon);
            cmdSelectItem.Parameters.AddWithValue("@ArtworkID", temp);
            da = new SqlDataAdapter():
            da.SelectCommand = cmdSelectItem;
            dt = new DataTable();
            da.Fill(dt);
            imageRepeater.DataSource = cmdSelectItem.ExecuteReader();
            imageRepeater.DataBind();
            orderCon.Close();*/


        }
        //protected void AddToWish_Click(object sender, EventArgs e)
        //{
        //    /*if (Session["userID"] != null)
        //    {
        //        String strOrderCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        //        SqlConnection orderCon = new SqlConnection(strOrderCon);
        //        orderCon.Open();
        //        SqlCommand cmd = new SqlCommand("INSERT INTO Wishlist (UserID, ArtworkID) VALUES ('" + Session["userID"].ToString() + "','" + HiddenField1.Value + "')");
        //        cmd.ExecuteNonQuery();
        //        orderCon.Close();
        //    }
        //    else
        //    {
        //        Response.Redirect("~/Login.aspx");
        //    }*/
        //}
    }
}