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
    public partial class Receipt : System.Web.UI.Page
    {
		protected void Page_Load(object sender, EventArgs e)
		{
			SqlConnection Con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True;MultipleActiveResultSets=True;");
			String ID = Session["CustomerID"].ToString();
			Con.Open();
			String name = "Select Name from Customer where customerID = @customerID";
			SqlCommand customerName = new SqlCommand(name, Con);
			customerName.Parameters.AddWithValue("@customerID", ID);
			Name.Text = customerName.ExecuteScalar().ToString();
			Con.Close();

			//email
			Con.Open();

			String email = "Select email from Customer where customerID = @customerID";
			SqlCommand getEmail = new SqlCommand(email, Con);
			getEmail.Parameters.AddWithValue("@customerID", Session["CustomerID"].ToString());
			String emailstring = (string)getEmail.ExecuteScalar();
			Con.Close();
			try
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
				mail.IsBodyHtml = true;
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
			catch (SmtpException ex)
			{
				//catched smtp exception
				//lblMsg.Text = “SMTP Exception: “ +ex.Message.ToString();
				//lblMsg.ForeColor = System.Drawing.Color.Red;
			}
			catch (Exception ex)
			{
				//lblMsg.Text = “Error: “ +ex.Message.ToString();
				//lblMsg.ForeColor = System.Drawing.Color.Red;
			}
		}

		private string GetWebPageContent(string recipient, string customMsg)
		{
			string bodyMsg = string.Empty;
			SqlConnection Con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True;MultipleActiveResultSets=True;");
			Con.Open();
			SqlCommand cmdGetArtWorkCount = new SqlCommand("SELECT OrderDetails.quantity as Qty, OrderDetails.OrderID as OrderId, OrderDetails.subtotal as SubTotal, OrderDetails.artworkID as ArtworkID, Artwork.artworkName as ArtworkName FROM OrderDetails INNER JOIN Artwork ON OrderDetails.artworkID = Artwork.artworkID WHERE OrderDetails.OrderID = (SELECT TOP 1[dbo].[Order].orderID FROM[dbo].[Order] ORDER BY[dbo].[Order].orderID DESC)", Con);
			SqlDataReader rows = cmdGetArtWorkCount.ExecuteReader();
			while (rows.Read())
			{
				string newLine = "Artwork Name : " + rows["ArtworkName"] + System.Environment.NewLine + "Quantity: " + rows["Qty"] + System.Environment.NewLine + "Sub Total: " + rows["SubTotal"] + System.Environment.NewLine;
				bodyMsg += newLine;
			}

			//StreamReader objStreamReader = new StreamReader(Server.MapPath("~/receipt.aspx"));
			////read html template file
			//string bodyMsg = objStreamReader.ReadToEnd();
			////replace the dynamic string at run-time
			//bodyMsg = bodyMsg.Replace("##recipient##", recipient);
			//bodyMsg = bodyMsg.Replace("##somecustommessage##", customMsg);
			//return bodyMsg;
			return bodyMsg;
		}
	}
}