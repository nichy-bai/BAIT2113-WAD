using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace BAIT2113_WAD
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["ArtistID"] != null || Session["CustomerID"] != null)
            {
                dropbtn2.Text = "Logout";
            }
            else
            {
                dropbtn2.Text = "Login";
            }

        }

        protected void dropbtn2_Click(object sender, EventArgs e)
        {

            if (dropbtn2.Text == "Logout")
            {
                Session.Abandon();
                Response.Redirect("Homepage.aspx");
            }
            if (dropbtn2.Text == "Login")
            {
                Response.Redirect("Login.aspx");
            }

        }
        protected void newsletter_button_Click(object sender, EventArgs e)
        {
            newsletter_msg.Visible = true;
            newsletter_msg.Text = "Subscribed Successfully";

            //Display success message.
            string message = "Your details have been saved successfully.";
            string script = "window.onload = function(){ alert('";
            script += message;
            script += "')};";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "SuccessMessage", script, true);

            String emailSubject = "Gallerion Newsletter";
            String emailBody = "Congratulation! You have successfully subscribed to Gallerion newsletter.";
            MailMessage mail = new MailMessage();
            mail.IsBodyHtml = true;
            mail.From = new MailAddress("Gallerion2021@gmail.com", "Gallerion");
            mail.To.Add(new MailAddress(newsletter_email.Text));
            mail.Subject = emailSubject;
            mail.Body = emailBody;
            SmtpClient smtpClient = new SmtpClient();
            smtpClient.Send(mail);

            newsletter_email.Text = "";
        }

        
    }
}