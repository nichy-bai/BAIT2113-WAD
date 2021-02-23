using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace BAIT2113_WAD
{
    public partial class Order : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            {
                String temp = " ";
                if (!IsPostBack)
                {
                    try
                    {
                        temp = Context.Items["ArtworkID"].ToString();
                    }
                    catch (NullReferenceException ex)
                    {
                        Response.Write(ex.Message);
                    }
                }
                else
                {
                    temp = Session["artworkID"].ToString();
                }

                Session["artworkID"] = temp;
                HiddenField1.Value = temp;

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