using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Net.Mail;

namespace BAIT2113_WAD
{
    public partial class Login : System.Web.UI.Page
    {


        protected void btnLogin_Click(object sender, EventArgs e)
        {
            String CustomerID = txtID.Text;
            String PasswordUser = txtPassword.Text;
            String ArtistID = txtID.Text;
            String PasswordArtist = txtPassword.Text;

            // string sql = "insert into Customer(customerID,name,password,email,phoneNum,dob,street ,city,zipCode,state ) values (@CustomerID,@Name,@Password,@Email,@PhoneNumber,@DOB,@Street,@City,@ZipCode, @State)";
            string sql = "Select count(*) from Customer where customerID = @CustomerID AND password = @PasswordUser ";
            string sql1 = "Select count(*) from Artist where artistID = @ArtistID AND password = @PasswordArtist ";
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlCommand cmd1 = new SqlCommand(sql1, con);

            // SqlCommand cmd1 = new SqlCommand(sql1, con);
            cmd.Parameters.AddWithValue("@CustomerID", CustomerID);
            cmd.Parameters.AddWithValue("@PasswordUser", PasswordUser);
            cmd1.Parameters.AddWithValue("@ArtistID", ArtistID);
            cmd1.Parameters.AddWithValue("@PasswordArtist", PasswordArtist);



            con.Open();
            String output = cmd.ExecuteScalar().ToString();
            String output1 = cmd1.ExecuteScalar().ToString();

            if (output == "1")
            {

                Session["CustomerID"] = txtID.Text;
                Response.Redirect("Artwork.aspx");

            }
            else if (output1 == "1")
            {

                Session["ArtistID"] = txtID.Text;
                Response.Redirect("AddArtwork.aspx");

            }
            else if (output == "0")
            {
                Response.Write("<script> alert('Your username or password is incorrect') </script>");
            }
            else if (output1 == "0")
            {
                Response.Write("<script> alert('Your username or password is incorrect') </script>");
            }
            else
            {
                Response.Write("<script> alert('ggwp') </script>");
            }

            con.Close();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ArtistID"] != null || Session["CustomerID"] != null)
            {
                if (Session["ArtistID"] != null)
                {

                    Response.Redirect("AddArtwork.aspx");
                }
                else
                {
                    Response.Redirect("Artwork.aspx");
                }

            }
        }

        public static string CreateRandomPassword(int PasswordLength)
        {
            string _allowedChars = "0123456789abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ";
            Random randNum = new Random();
            char[] chars = new char[PasswordLength];
            int allowedCharCount = _allowedChars.Length;
            for (int i = 0; i < PasswordLength; i++)
            {
                chars[i] = _allowedChars[(int)((_allowedChars.Length) * randNum.NextDouble())];
            }
            return new string(chars);
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            string id = txtID.Text;
            if (id == "")
            {
                Response.Write("<script> alert('User not exist') </script>");
            }
            else
            {
                string id1 = id.Substring(0, 1);
                if (id1 == "C")
                {
                    String CustomerID = txtID.Text;
                    String newpassword = CreateRandomPassword(8);
                    string email;

                    string sql = "Select email from Customer where customerID = @CustomerID";
                    string sql1 = "Update Customer set password=@newpassword where customerID = @CustomerID";
                    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
                    SqlCommand cmd = new SqlCommand(sql, con);
                    SqlCommand cmd1 = new SqlCommand(sql1, con);
                    SqlDataReader rdr;
                    cmd.Parameters.AddWithValue("@CustomerID", CustomerID);
                    cmd1.Parameters.AddWithValue("@CustomerID", CustomerID);
                    cmd1.Parameters.AddWithValue("@newpassword", newpassword);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    cmd1.ExecuteNonQuery();
                    con.Close();
                    con.Open();
                    rdr = cmd.ExecuteReader();
                    while (rdr.Read())
                    {
                        email = rdr["email"].ToString();
                        String emailSubject = "Gallerion Reset Password Successfully";
                        String emailBody = "Your password of user ID : " + CustomerID + " have successfully reset to " + newpassword + ". Thank You";
                        MailMessage mail = new MailMessage();
                        mail.IsBodyHtml = true;
                        mail.From = new MailAddress("Gallerion2021@gmail.com", "Gallerion");
                        mail.To.Add(new MailAddress(email));
                        mail.Subject = emailSubject;
                        mail.Body = emailBody;
                        SmtpClient smtpClient = new SmtpClient();
                        smtpClient.Send(mail);
                    }
                    con.Close();

                    Response.Write("<script> alert('New temporary password has been sent to your email.') </script>");

                }
                else if (id1 == "A")
                {
                    String ArtistID = txtID.Text;
                    String newpassword = CreateRandomPassword(8);
                    String email;

                    string sql = "Select email from Artist where artistID = @ArtistID";
                    string sql1 = "Update Artist set password=@newpassword where artistID = @ArtistID";
                    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
                    SqlCommand cmd = new SqlCommand(sql, con);
                    SqlCommand cmd1 = new SqlCommand(sql1, con);
                    SqlDataReader rdr;
                    cmd.Parameters.AddWithValue("@ArtistID", ArtistID);
                    cmd1.Parameters.AddWithValue("@ArtistID", ArtistID);
                    cmd1.Parameters.AddWithValue("@newpassword", newpassword);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    cmd1.ExecuteNonQuery();
                    con.Close();
                    con.Open();
                    rdr = cmd.ExecuteReader();
                    while (rdr.Read())
                    {
                        email = rdr["email"].ToString();
                        String emailSubject = "Gallerion Reset Password Successfully";
                        String emailBody = "Your password of Artist ID : " + ArtistID + " have successfully reset to " + newpassword + ". Thank You";
                        MailMessage mail = new MailMessage();
                        mail.IsBodyHtml = true;
                        mail.From = new MailAddress("Gallerion2021@gmail.com", "Gallerion");
                        mail.To.Add(new MailAddress(email));
                        mail.Subject = emailSubject;
                        mail.Body = emailBody;
                        SmtpClient smtpClient = new SmtpClient();
                        smtpClient.Send(mail);
                    }
                    con.Close();

                    Response.Write("<script> alert('New temporary password has been sent to your email.') </script>");

                }
                else
                {
                    Response.Write("<script> alert('User not exist') </script>");
                }
            }
        }
    }
}
