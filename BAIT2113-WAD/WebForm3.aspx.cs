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
    public partial class WebForm3 : System.Web.UI.Page
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
            Session ["CustomerID"] = txtID.Text;
            Session["ArtistID"] = txtID.Text;

            con.Open();
            String output = cmd.ExecuteScalar().ToString();
            String output1 = cmd1.ExecuteScalar().ToString();

            if (output == "1")
            {
                Response.Redirect("Wishlist.aspx");
            }
            else if (output1 == "1")
            {
                Response.Redirect("WebForm4.aspx");
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
    }
}