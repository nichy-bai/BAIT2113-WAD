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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void email()
        {
            String emailSubject = "Gallerion Member";
            String emailBody = "Congratulation! You have successfully register as Gallerion member.";

            //SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);

            //smtpClient.Credentials = new System.Net.NetworkCredential("Gallerion2021@gmail.com", "Gallerion_2021?");
            //smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
            MailMessage mail = new MailMessage();
            mail.IsBodyHtml = true;
            mail.From = new MailAddress("Gallerion2021@gmail.com", "Gallerion");
            mail.To.Add(new MailAddress(txtemail.Text));
            mail.Subject = emailSubject;
            mail.Body = emailBody;
            SmtpClient smtpClient = new SmtpClient();
            smtpClient.Send(mail);
        }
        protected void btn1_Click(object sender, EventArgs e)
        {
            String ID = txtid.Text;
            String Name = txtname.Text;
            String Password = txtpassword.Text;
            String Email = txtemail.Text;
            String PhoneNumber = txtphone.Text;
            String Dob = txtdob.Text;
            String Street = txtstreet.Text;
            String City = txtcity.Text;
            String ZipCode = txtzip.Text;
            String State = txtstate.Text;



           if (radiobtn1.Checked == true)
            {
               string sql = "insert into Artist(artistID,name,email,dob, password,phoneNum) values (@ArtistID,@Name,@Email,@DOB,@Password,@PhoneNumber)";
               SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
               SqlCommand cmd = new SqlCommand(sql, con);


                  con.Open();
                  cmd.Parameters.AddWithValue("@ArtistID", ID);
                  cmd.Parameters.AddWithValue("@Name", Name);
                  cmd.Parameters.AddWithValue("@Password", Password);
                  cmd.Parameters.AddWithValue("@Email", Email);
                  cmd.Parameters.AddWithValue("@PhoneNumber ", PhoneNumber);
                  cmd.Parameters.AddWithValue("@DOB", Dob);
                  cmd.ExecuteNonQuery();
                  con.Close();

                email();
                Response.Redirect("Login.aspx");


            }
            else if (radiobtn2.Checked == true)
            {
                 string sql1 = "insert into Customer(customerID,name,password,email,phoneNum,dob,street,city,zipCode,state ) values (@CustomerID,@Name,@Password,@Email,@PhoneNumber,@DOB,@Street,@City,@ZipCode, @State)";;
                 SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
                 SqlCommand cmd1 = new SqlCommand(sql1, con);
                 con.Open();
                 cmd1.Parameters.AddWithValue("@CustomerID", ID);
                 cmd1.Parameters.AddWithValue("@Name", Name);
                 cmd1.Parameters.AddWithValue("@Password", Password);
                 cmd1.Parameters.AddWithValue("@Email", Email);
                 cmd1.Parameters.AddWithValue("@PhoneNumber ", PhoneNumber);
                 cmd1.Parameters.AddWithValue("@DOB", Dob);
                 cmd1.Parameters.AddWithValue("@Street", Street);
                 cmd1.Parameters.AddWithValue("@City", City);
                 cmd1.Parameters.AddWithValue("@ZipCode", ZipCode);
                 cmd1.Parameters.AddWithValue("@State ", State);


                    cmd1.ExecuteNonQuery();
                    con.Close();
                Response.Redirect("Login.aspx");

            }

            else
            {
                lblwarning.Text = "Please select your role";
            }

        }

        protected void btn2_Click(object sender, EventArgs e)
        {
            txtid.Text = String.Empty;
            txtname.Text = String.Empty;
            txtpassword.Text = String.Empty;
            txtdob.Text = String.Empty;
            txtemail.Text = String.Empty;
            txtphone.Text = String.Empty;
            txtstreet.Text = String.Empty;
            txtcity.Text = String.Empty;
            txtzip.Text = String.Empty;
            txtstate.Text = String.Empty;
            radiobtn1.Checked = false;
            radiobtn2.Checked = false;
            checkBox1.Checked = false;
            txt4.Text = String.Empty;

        }

        protected void txtzip_TextChanged(object sender, EventArgs e)
        {

        }
    }
}