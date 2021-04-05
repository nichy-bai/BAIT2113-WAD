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
        protected void Page_Error(object sender, EventArgs e)
        {
            Exception Ex = Server.GetLastError();
            Server.ClearError();
            Response.Redirect("Error.html");
        }
    }
}
