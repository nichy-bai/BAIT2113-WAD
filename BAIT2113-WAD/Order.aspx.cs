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
            
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(strCon);

            con.Open();
            string strSelect = "SELECT [artworkName] FROM [Artwork] WHERE ([artworkName] = @artworkName)";
            SqlCommand cmdSelect = new SqlCommand(strSelect, con);
            cmdSelect.Parameters.AddWithValue("@artworkName", Session["artworkName"].ToString());
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmdSelect;
            DataTable dt = new DataTable();
            da.Fill(dt);
            artworkName.DataSource = cmdSelect.ExecuteReader();
            artworkName.DataBind();
            con.Close();

            con.Open();
            strSelect = "SELECT [artworkDesc], [quantity], [price], [artistID] FROM [Artwork] WHERE ([artworkDesc] = @artworkDesc);";
            cmdSelect = new SqlCommand(strSelect, con);
            cmdSelect.Parameters.AddWithValue("@artworkDesc", Session["artworkDesc"].ToString());
            da = new SqlDataAdapter();
            da.SelectCommand = cmdSelect;
            dt = new DataTable();
            da.Fill(dt);
            artworkDesc.DataSource = cmdSelect.ExecuteReader();
            artworkDesc.DataBind();
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