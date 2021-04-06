using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BAIT2113_WAD
{
    public partial class CheckoutBuyNow : System.Web.UI.Page
    {
        //protected void Page_Load(object sender, EventArgs e)
        //{
        //    string artworkID = Session["ArtworkID"].ToString();
        //    //string buyQty = Session["QuantityBuy"].ToString();

        //    string sql2 = "Select * from Artwork where artworkID = @ArtworkID ";
        //    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
        //    SqlCommand cmd = new SqlCommand(sql2, con);
        //    SqlDataReader rdr;
        //    cmd.Parameters.AddWithValue("@ArtworkID", artworkID);
        //    con.Open();
        //    rdr = cmd.ExecuteReader();

        //    while (rdr.Read())
        //    {
        //        Image1.ImageUrl = rdr["image"].ToString();
        //        Label2.Text = rdr["artworkName"].ToString();
        //        Label3.Text = rdr["price"].ToString();
        //    }
        //    Label4.Text = buyQty;
        //    int QuantityBuy = Convert.ToInt32(Label4.Text);
        //    double price = Convert.ToDouble(Label3.Text);
        //    double total = QuantityBuy * price;

        //    Label5.Text = Convert.ToString(total);

        //    con.Close();
        //}

		protected void Page_Load(object sender, EventArgs e)
		{
			if (Session["CustomerID"] != null)
			{
				if (PreviousPage != null)
				{
					/*
					LinkButton senderbtn = (LinkButton)PreviousPage.FindControl("Payment");
					RepeaterItem clickedItem = (RepeaterItem)senderbtn.NamingContainer;

					HiddenField artworkIdHidden = (HiddenField)clickedItem.FindControl("artworkID");
					artworkID = artworkIdHidden.Value;

					Label artworkName = (Label)clickedItem.FindControl("artworkName");
					ArtworkName = artworkName.Text;
					*/

				}
			}
			else
			{
				ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('You must log in as a customer to access this feature.');window.location ='Homepage.aspx';", true);
			}
		}

		protected void TextBox2_TextChanged(object sender, EventArgs e)
		{

		}

		protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
		{
			if (Page.IsValid)
			{
				String num = args.Value;
				if (num.Length != 16)
				{
					CustomValidator1.ErrorMessage = "Invalid Credit card number!";
					args.IsValid = false;
				}
				if (RadioButtonList1.Text == "Visa")
				{
					if (num.First() != '4')
					{
						CustomValidator1.ErrorMessage = "Invalid Credit card number!";
						args.IsValid = false;
					}
				}
				if (RadioButtonList1.Text == "Master")
				{
					if (num.First() != '5')
					{
						CustomValidator1.ErrorMessage = "Invalid Credit card number!";
						args.IsValid = false;
					}
				}
			}
		}
		protected void Pay_OnClick(object sender, System.EventArgs e)
		{
			if (Page.IsValid)
			{
				string artworkID = Session["ArtworkID"].ToString();
				string buyQty = Session["QuantityBuy"].ToString();

				//Insert into order
				SqlConnection Con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True;MultipleActiveResultSets=True;");
				Con.Open();
				SqlCommand InsertOrder = new SqlCommand("INSERT INTO [dbo].[Order] (customerID,status,Logistics,dateOrder) values (@customerID,@status,@logistics,@dateOrder)", Con);
				InsertOrder.Parameters.AddWithValue("@customerID", Session["CustomerID"].ToString());
				InsertOrder.Parameters.AddWithValue("@logistics", RadioButtonList2.SelectedValue);
				InsertOrder.Parameters.AddWithValue("@status", "Pending");
				InsertOrder.Parameters.AddWithValue("@dateOrder", DateTime.Now.ToString("dd-MM-yyyy"));
				InsertOrder.ExecuteNonQuery();
				Con.Close();

				Con.Open();
				SqlCommand cmdgetOrderID = new SqlCommand("SELECT OrderID FROM [dbo].[Order] ORDER BY OrderID DESC", Con);
				int orderID = Convert.ToInt32(cmdgetOrderID.ExecuteScalar());
				Con.Close();

				//Insert into order details
				Con.Open();
				SqlCommand cmdOrderDetails = new SqlCommand("Select * from Artwork where artworkID = @AaartworkID ", Con);
				cmdOrderDetails.Parameters.AddWithValue("@AaartworkID", Session["ArtworkID"].ToString());
				SqlDataReader cart = cmdOrderDetails.ExecuteReader();

				while (cart.Read())
				{

					SqlCommand cmdAddOrderDetails = new SqlCommand("INSERT INTO [dbo].[OrderDetails] (OrderID,quantity,artworkID) values (@OrderID,@quantity,@AartworkID)", Con);
					cmdAddOrderDetails.Parameters.AddWithValue("@OrderID", orderID.ToString());
					cmdAddOrderDetails.Parameters.AddWithValue("@quantity", buyQty);
					cmdAddOrderDetails.Parameters.AddWithValue("@AartworkID", artworkID);
					cmdAddOrderDetails.ExecuteNonQuery();
				}
				Con.Close();


				//Update subtotal
				Con.Open();
				SqlCommand cmdUpdateOrderDetails = new SqlCommand("UPDATE [dbo].[OrderDetails] SET subtotal = quantity * (Select Price from Artwork where [dbo].[Artwork].artworkID = [dbo].[OrderDetails].artworkID) ", Con);
				cmdUpdateOrderDetails.ExecuteNonQuery();
				Con.Close();

				//Update total amount
				Con.Open();
				SqlCommand cmdUpdateOrder = new SqlCommand("UPDATE [dbo].[Order] SET totalAmount = (CAST(subtotal AS DECIMAL(10,2))) From OrderDetails where [dbo].[OrderDetails].OrderID = [dbo].[Order].orderID", Con);
				cmdUpdateOrder.ExecuteNonQuery();
				Con.Close();

				//Reduce stock
				Con.Open();
				SqlCommand cmdGetArtWorkCount = new SqlCommand("SELECT * FROM OrderDetails WHERE OrderID = @OrderID", Con);
				cmdGetArtWorkCount.Parameters.AddWithValue("@OrderID", orderID);
				SqlDataReader rows = cmdOrderDetails.ExecuteReader();
				while (rows.Read())
				{
					SqlCommand ReduceQuantity = new SqlCommand("UPDATE Artwork SET quantity = quantity - (SELECT quantity FROM OrderDetails WHERE OrderID = @OrderID AND artworkID = @ArtworkID) WHERE artworkID = @ArtworkID", Con);
					ReduceQuantity.Parameters.AddWithValue("@OrderID", orderID);
					ReduceQuantity.Parameters.AddWithValue("@ArtworkID", rows["artworkID"].ToString());
					ReduceQuantity.ExecuteNonQuery();
				}
				Con.Close();


				String ID = Session["CustomerID"].ToString();
				Con.Open();
				String name = "Select Name from Customer where customerID = @customerID";
				SqlCommand customerName = new SqlCommand(name, Con);
				customerName.Parameters.AddWithValue("@customerID", ID);
				Con.Close();

				//email
				Con.Open();

				String email = "Select email from Customer where customerID = @customerID";
				SqlCommand getEmail = new SqlCommand(email, Con);
				getEmail.Parameters.AddWithValue("@customerID", Session["CustomerID"].ToString());
				String emailstring = (string)getEmail.ExecuteScalar();
				Con.Close();
				//try
				{
					string Subject = "This is test mail with html web page",
					Body = GetWebPageContent("adad", "adad"),
					ToEmail = emailstring;

					string SMTPUser = "Gallerion2021@gmail.com", SMTPPassword = "Gallerion_2021?";

					MailMessage mail = new MailMessage();
					mail.From = new MailAddress(SMTPUser, "Gallerion");
					mail.To.Add(ToEmail);
					mail.Subject = Subject;
					mail.Body = Body;
					mail.IsBodyHtml = false;
					mail.Priority = MailPriority.Normal;

					SmtpClient smtp = new SmtpClient();
					//if you are using your smtp server, then change your host like “smtp.yourdomain.com”
					smtp.Host = "smtp.gmail.com";
					//chnage your port for your host
					smtp.Port = 587; //or you can also use port# 587
					smtp.Credentials = new System.Net.NetworkCredential(SMTPUser, SMTPPassword);
					//if you are using secure authentication using SSL/TLS then “true” else “false”
					smtp.EnableSsl = true;

					smtp.Send(mail);

					//lblMsg.Text = “Success: Mail sent successfully!”;
					//lblMsg.ForeColor = System.Drawing.Color.Green;
				}
				//catch (SmtpException ex)
				//{
				//	//catched smtp exception
				//	//lblMsg.Text = “SMTP Exception: “ +ex.Message.ToString();
				//	//lblMsg.ForeColor = System.Drawing.Color.Red;
				//}
				//catch (Exception ex)
				//{
				//	//lblMsg.Text = “Error: “ +ex.Message.ToString();
				//	//lblMsg.ForeColor = System.Drawing.Color.Red;
				//}

				ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Thank you for your purchase. The receipt has been sent to your email.');window.location ='Homepage.aspx';", true);
			}
		}
		private string GetWebPageContent(string recipient, string customMsg)
		{
			int count = 1;
			string bodyMsg = "													Receipt														" + System.Environment.NewLine + "---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------" + System.Environment.NewLine;
			SqlConnection Con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True;MultipleActiveResultSets=True;Integrated Security=True");
			Con.Open();
			SqlCommand cmdGetArtWorkCount = new SqlCommand("SELECT OrderDetails.quantity as Qty, OrderDetails.OrderID as OrderId, OrderDetails.subtotal as SubTotal, OrderDetails.artworkID as ArtworkID, Artwork.artworkName as ArtworkName FROM OrderDetails INNER JOIN Artwork ON OrderDetails.artworkID = Artwork.artworkID WHERE OrderDetails.OrderID = (SELECT TOP 1[dbo].[Order].orderID FROM[dbo].[Order] ORDER BY[dbo].[Order].orderID DESC)", Con);
			SqlDataReader rows = cmdGetArtWorkCount.ExecuteReader();
			while (rows.Read())
			{
				string newLine = System.Environment.NewLine + "Item " + count + System.Environment.NewLine + "Artwork Name : " + rows["ArtworkName"] + System.Environment.NewLine + "Quantity          : " + rows["Qty"] + System.Environment.NewLine + "Sub Total         : " + String.Format("${0:0.00}", rows["SubTotal"]) + System.Environment.NewLine;
				bodyMsg += newLine;
				count++;
			}
			Con.Close();

			Con.Open();
			SqlCommand cmdGetTotal = new SqlCommand("SELECT totalAmount as total From [dbo].[Order] where [dbo].[Order].orderID = (SELECT TOP 1[dbo].[Order].orderID FROM[dbo].[Order] ORDER BY[dbo].[Order].orderID DESC)", Con);
			SqlDataReader total = cmdGetTotal.ExecuteReader();
			while (total.Read())
			{
				String total1 = System.Environment.NewLine + "Total               : " + String.Format("${0:0.00}", total["total"]);
				bodyMsg += total1;
			}
			Con.Close();

			bodyMsg += System.Environment.NewLine + "*****************************************************************************End*******************************************************************************************";
			//return bodyMsg;
			return bodyMsg;

		}
	}
}