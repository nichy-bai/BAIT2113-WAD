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
            


        }

        protected void AddToWishlist_Click(object sender, EventArgs e)
        {
            //Button InkRowSelection = (Button)sender;
            ////get the recipe id from command argument to link button
            //string ArtworkID = InkRowSelection.CommandArgument.ToString();
            //Session.Add("artworkID", ArtworkID);

            if (Session["CustomerID"] != null)
            {
                string sql = "Select Top(1) WishNo from Wishlist ORDER BY WishNo DESC";
                SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
                SqlCommand cmd = new SqlCommand(sql, con);
                con.Open();
                int wishNo = Convert.ToInt32(cmd.ExecuteScalar());
                wishNo++;
                con.Close();

                string artworkID = Session["ArtworkID"].ToString();
                string customerID = Session["CustomerID"].ToString();

                string sql3 = "INSERT INTO Wishlist(WishNo,artworkID,customerID) VALUES (@wishNo,@artworkID,@customerID)";
                string sql4 = "SELECT artworkID, customerID FROM Wishlist WHERE customerID = @CustomerID";
               
                SqlCommand cmd3 = new SqlCommand(sql3, con);
                SqlCommand cmd4 = new SqlCommand(sql4, con);

                SqlDataReader rdr;

                con.Open();
                cmd4.Parameters.AddWithValue("@CustomerID", customerID);
                rdr = cmd4.ExecuteReader();


                while (rdr.Read())
                {
                    Session["ArtworkkkkkID"] = rdr["artworkID"].ToString();
                    Session["CustomerrrrID"] = rdr["customerID"].ToString();
                }
                con.Close();

                if (Session["ArtworkID"].Equals(Session["ArtworkkkkkID"]))
                {
                    //Response.Write("<script> alert('This artwork is already in your wishlist.') </script>");
                    errLabel.Text = "This artwork is already in your wishlist.";
                }
                else
                {
                    cmd3.Parameters.AddWithValue("@wishNo", wishNo);
                    cmd3.Parameters.AddWithValue("@artworkID", artworkID);
                    cmd3.Parameters.AddWithValue("@customerID", customerID);
                    con.Open();
                    cmd3.ExecuteNonQuery();
                    con.Close();
                    errLabel.Text = "This item has added to your wishlist successfully.";
                    //Response.Write("<script> alert('This item has added to your wishlist successfully.') </script>");
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }



            //if (Session["ArtworkID"].Equals("false"))
            //{
            //    String con = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            //    SqlConnection cnn = new SqlConnection(con);
            //    cnn.Open();
            //    String strWishlist = "INSERT INTO [dbo].[Wishlist] VALUES (@customerID, @artworkID)";
            //    SqlCommand addToWishlist = new SqlCommand(strWishlist, cnn);
            //    addToWishlist.Parameters.AddWithValue("@customerID", Session["CustomerID"].ToString());
            //    addToWishlist.Parameters.AddWithValue("@artworkID", Session["ArtworkID"].ToString());

            //    addToWishlist.ExecuteNonQuery();

            //    cnn.Close();
            //}
            //else
            //{
              
            //   Response.Write("<script> alert('This artwork is already in your wishlist :D') </script>");
                
            //}
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            if (Session["CustomerID"] != null)
            {

                int a = Convert.ToInt32(txtQuantity.Text);

                string artworkID = Session["ArtworkID"].ToString();

                string sql = "Select * from Cart where artworkID = @AartworkID";
                string sql1 = "Select * from Artwork where artworkID = @ID ";
                
                SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");

                SqlCommand cmd = new SqlCommand(sql, con);
                SqlCommand cmd1 = new SqlCommand(sql1, con);
                SqlDataReader rdr0,rdr;

                cmd.Parameters.AddWithValue("@AartworkID", artworkID);
                cmd1.Parameters.AddWithValue("@ID", artworkID);

                con.Open();
                rdr0 = cmd.ExecuteReader();

                while (rdr0.Read())
                {
                    Session["CartQty"] = rdr0["quantity"].ToString();
                }
                con.Close();

                int cartqty = Convert.ToInt32(Session["CartQty"]);
                int totalQty = a + cartqty;
                con.Open();
                rdr = cmd1.ExecuteReader();

                while (rdr.Read())
                {
                    Session["quantity"] = rdr["quantity"].ToString();
                    Session["Image"] = rdr["image"].ToString();
                    Session["ArtworkName"] = rdr["artworkName"].ToString();
                    Session["Price"] = rdr["price"].ToString();

                }
                con.Close();

                int StoreQty = Convert.ToInt32(Session["quantity"]);

                if (a > 0 && totalQty <= StoreQty)
                {

                    string customerID = Session["CustomerID"].ToString();

                    string sql2 = "SELECT Top(1) No FROM Cart ORDER BY No DESC";
                    string sql3 = "INSERT INTO Cart(No,artworkID,image,artworkName,price,customerID,quantity) VALUES (@No,@artworkID, @image,@artworkName,@price,@customerID,@quantity)";
                    string sql4 = "SELECT artworkID FROM Cart WHERE customerID = @CustomerID";
                    string sql5 = "Update Cart SET quantity = quantity + " + txtQuantity.Text + " WHERE artworkID = @ArtworkID AND customerID = @CustomerID";
                    
                    SqlCommand cmd2 = new SqlCommand(sql2, con);
                    SqlCommand cmd3 = new SqlCommand(sql3, con);
                    SqlCommand cmd4 = new SqlCommand(sql4, con);
                    SqlCommand cmd5 = new SqlCommand(sql5, con);
                    SqlDataReader rdr1;
                    

                    con.Open();

                    cmd4.Parameters.AddWithValue("@CustomerID", customerID);
                    rdr1 = cmd4.ExecuteReader();
                    while (rdr1.Read())
                    {
                        Session["AddArtworkID"] = rdr1["artworkID"].ToString();
                    }
                    con.Close();

                    con.Open();
                    int cartNo = Convert.ToInt32(cmd2.ExecuteScalar());
                    cartNo++;
                    Session["CartNo"] = cartNo;
                    con.Close();
                    string image = Session["Image"].ToString();
                    string artworkName = Session["ArtworkName"].ToString();
                    string price = Session["Price"].ToString();
                    string CartNo = Session["CartNo"].ToString();
                    string quantity = txtQuantity.Text;

                    //string CartExisted = Session["AddArtworkID"].ToString();
                    if (Session["ArtworkID"].Equals(Session["AddArtworkID"]))
                    {
                        cmd5.Parameters.AddWithValue("@ArtworkID", artworkID);
                        cmd5.Parameters.AddWithValue("@CustomerID", customerID);
                        con.Open();
                        cmd5.ExecuteNonQuery();
                        con.Close();
                    }
                    else
                    {
                        cmd3.Parameters.AddWithValue("@artworkID", artworkID);
                        cmd3.Parameters.AddWithValue("@customerID", customerID);
                        cmd3.Parameters.AddWithValue("@image", image);
                        cmd3.Parameters.AddWithValue("@artworkName", artworkName);
                        cmd3.Parameters.AddWithValue("@price", price);
                        cmd3.Parameters.AddWithValue("@No", CartNo);
                        cmd3.Parameters.AddWithValue("@quantity", quantity);
                        con.Open();
                        cmd3.ExecuteNonQuery();
                        con.Close();
                        errLabel.Visible = false;

                    }
                    Response.Redirect("~/Cart.aspx");
                }
                else if(a == 0)
                {
                    errLabel.Text = "Cannot add 0 item(s) to cart!";
                    errLabel.Visible = true;
                }
                else if(totalQty > StoreQty)
                {
                    errLabel.Text = "Cannot add items more than available item stock in store!";
                    errLabel.Visible = true;
                }
                //else if (a == 0)
                //{
                //    errLabel.Text = "Cannot add 0 item(s) to cart!";
                //    errLabel.Visible = true;
                //}

                //else if(totalQty == StoreQty)
                //{
                //    errLabel.Visible = true;
                //    errLabel.Text = "Cannot add items more than available item stock in store!";
                //}
            }
            else
            {
                Response.Redirect("Login.aspx");
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
                    errLabel.Text = "Maximum quantity reached!";
                    errLabel.Visible = true;
                }
            }
            con.Close();


        }

        protected void buyNow_Click(object sender, EventArgs e)
        {
            if (Session["CustomerID"] != null)
            {
                Session["QuantityBuy"] = txtQuantity.Text;
                //Response.Redirect("Checkout.aspx");
                //here put ur add to cart code
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
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