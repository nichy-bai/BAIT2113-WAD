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
            //string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            //SqlConnection con = new SqlConnection(strCon);

            //SqlCommand cmd = new SqlCommand("SELECT Artwork.quantity", con);
            //con.Open();
            //Session["quantity"] = cmd.ExecuteScalar();
            //con.Close();
            //SqlConnection con = new SqlConnection(strCon);

            //con.Open();
            //string strSelect = "SELECT Artwork.ArtworkName FROM Artwork WHERE (Artwork.ArtworkID = @ArtworkID);";
            //SqlCommand cmdSelect = new SqlCommand(strSelect, con);
            //cmdSelect.Parameters.AddWithValue("@ArtworkID", Session["artwworkID"].ToString());
            //SqlDataAdapter da = new SqlDataAdapter();
            //da.SelectCommand = cmdSelect;
            //DataTable dt = new DataTable();
            //da.Fill(dt);
            //artworkName.DataSource = cmdSelect.ExecuteReader();
            //artworkName.DataBind();
            //con.Close();

            //con.Open();
            //strSelect = "SELECT Artist.name, Artwork.quantity, Artwork.artworkName, Artwork.artworkDesc, Artwork.price, Artwork.artworkID FROM Artist CROSS JOIN Artwork WHERE (Artwork.artworkID = @artworkID);";
            //cmdSelect = new SqlCommand(strSelect, con);
            //cmdSelect.Parameters.AddWithValue("@artworkID", Session["artworkID"].ToString());
            //da = new SqlDataAdapter();
            //da.SelectCommand = cmdSelect;
            //dt = new DataTable();
            //da.Fill(dt);
            //orderDetails.DataSource = cmdSelect.ExecuteReader();
            //orderDetails.DataBind();
            //con.Close();


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

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            //Button InkRowSelection = (Button)sender;
            ////get the recipe id from command argument to link button
            //string ArtworkID = InkRowSelection.CommandArgument.ToString();
            //Session.Add("artworkID", ArtworkID);

            String con = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection cnn = new SqlConnection(con);
            cnn.Open();
            String strWishlist = "INSERT INTO [dbo].[Wishlist] VALUES (@customerID, @artworkID)";
            SqlCommand addToWishlist = new SqlCommand(strWishlist, cnn);
            addToWishlist.Parameters.AddWithValue("@customerID", Session["CustomerID"].ToString());
            addToWishlist.Parameters.AddWithValue("@artworkID", Session["ArtworkID"].ToString());

            addToWishlist.ExecuteNonQuery();

            cnn.Close();
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            //int c;
            //string ID = Session["CustomerID"].ToString();
            //string artwork = Session["ArtworkID"].ToString();
            //string cgy = ddlCategory.SelectedItem.Text;
            //string artid = lblArtworkID.Text;
            //string artworkname = txtArtworkName.Text;
            //string desc = taDescription.Value;
            //int qty = Convert.ToInt32(txtQuantity.Text);
            //double prc = Convert.ToDouble(txtPrice.Text);
            //string sql2 = "SELECT COUNT(*) FROM Cart";
            //string sql1 = "insert into Cart(artworkID,image,artworkName,price) SELECT artworkID, image, artworkName, price FROM Artwork LEFT JOIN Cart ON Cart.artworkID = @artworkID WHERE customerID = @customerID ";
            //SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
            //SqlCommand cmd = new SqlCommand(sql1, con);
            //SqlCommand cmd2 = new SqlCommand(sql2, con);
            //con.Open();
            //c = Convert.ToInt32(cmd2.ExecuteScalar());
            //c++;
            //con.Close();
            //cmd.Parameters.AddWithValue("@No", c);
            //cmd.Parameters.AddWithValue("@artworkID", artwork);
            //cmd.Parameters.AddWithValue("@customerID", ID);
            //con.Open();
            //cmd.ExecuteNonQuery();
            //con.Close();


            //cmd.Parameters.AddWithValue("@image", image);
            //cmd.Parameters.AddWithValue("@artworkName", artworkname);
            //cmd.Parameters.AddWithValue("@quantity", qty);
            //cmd.Parameters.AddWithValue("@price", prc);
            //cmd.Parameters.AddWithValue("@subtotal", subtotal);
            //Response.Redirect("~/Checkout.aspx");

            int a = Convert.ToInt32(txtQuantity.Text);

            if (a > 0)
            {



                string artworkID = Session["ArtworkID"].ToString();
                string customerID = Session["CustomerID"].ToString();

                string sql1 = "Select * from Artwork where artworkID = @ID ";
                string sql2 = "SELECT COUNT(*) FROM Cart";
                string sql3 = "INSERT INTO Cart(No,artworkID,image,artworkName,price,customerID,quantity) VALUES (@No,@ID, @image,@artworkName,@price,@customerID,@quantity)";
                SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
                SqlCommand cmd = new SqlCommand(sql1, con);
                SqlCommand cmd2 = new SqlCommand(sql2, con);
                SqlCommand cmd3 = new SqlCommand(sql3, con);
                SqlDataReader rdr;
                cmd.Parameters.AddWithValue("@ID", artworkID);
                
                con.Open();
                rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Session["a"] = rdr["image"].ToString();
                    Session["b"] = rdr["artworkName"].ToString();
                    Session["d"] = rdr["price"].ToString();
                }
                con.Close();
                con.Open();
                int c = Convert.ToInt32(cmd2.ExecuteScalar());
                c++;
                Session["e"] = c;
                con.Close();
                string image = Session["a"].ToString();
                string artworkName = Session["b"].ToString();
                string price = Session["d"].ToString();
                string f = Session["e"].ToString();
                string quantity = txtQuantity.Text;
                cmd3.Parameters.AddWithValue("@ID", artworkID);
                cmd3.Parameters.AddWithValue("@customerID", customerID);
                cmd3.Parameters.AddWithValue("@image", image);
                cmd3.Parameters.AddWithValue("@artworkName", artworkName);
                cmd3.Parameters.AddWithValue("@price", price);
                cmd3.Parameters.AddWithValue("@No", f);
                cmd3.Parameters.AddWithValue("@quantity", quantity);
                con.Open();
                cmd3.ExecuteNonQuery();
                con.Close();
                errLabel.Visible = false;

            }
            else
            {
                errLabel.Text = "Cannot add 0 item(s) to cart!";
                errLabel.Visible = true;
            }

        }

        protected void btnMinus_Click(object sender, EventArgs e)
        {
            
            int a = Convert.ToInt32(txtQuantity.Text);

            if (a > 0)
            {
                a--;
                txtQuantity.Text = Convert.ToString(a);
                errLabel.Visible = false;
            }
            else
            {
                errLabel.Visible = false;
            }
        }


        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string artworkID = Session["ArtworkID"].ToString();
            string sql1 = "Select * from Artwork where artworkID = @ID ";
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
            SqlCommand cmd = new SqlCommand(sql1, con);

            SqlDataReader rdr1;
            cmd.Parameters.AddWithValue("@ID", artworkID);
            con.Open();
            rdr1 = cmd.ExecuteReader();

            while (rdr1.Read())
            {
                string v_quantity = rdr1["quantity"].ToString();
                
                int a = Convert.ToInt32(txtQuantity.Text);
                int maxQty = Convert.ToInt32(v_quantity);
                if (a < maxQty)
                {
                    errLabel.Visible = false;
                    a++;
                    txtQuantity.Text = Convert.ToString(a);
                    
                }
                else
                {
                    errLabel.Text = "Maximum stock is reached!";
                    errLabel.Visible = true;
                }
            }
            con.Close();

            
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