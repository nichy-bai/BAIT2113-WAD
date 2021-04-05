using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BAIT2113_WAD
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var ctl = Page.LoadControl("~/User Control/Header.ascx");
            HeaderPlaceHolder.Controls.Add(ctl);

            var customer = Session["ArtistID"];

            string ID = string.Empty;

            if (customer != null)
                ID = Session["ArtistID"].ToString();

            if (!string.IsNullOrEmpty(ID))
            {
                string sql2 = "Select * from Artist where ArtistID = @ID ";
                SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
                SqlCommand cmd = new SqlCommand(sql2, con);
                SqlDataReader rdr;
                cmd.Parameters.AddWithValue("@ID", ID);
                con.Open();
                rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    lblArtistID.Text = rdr["ArtistID"].ToString();
                    lblArtistName.Text = rdr["name"].ToString();
                    lbldob.Text = rdr["dob"].ToString();
                    lblphone.Text = rdr["phoneNum"].ToString();
                    lblemail.Text = rdr["email"].ToString();
                    profilepic.ImageUrl = rdr["profilePic"].ToString();
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }

        }

        protected void UpdateProfile_Click(object sender, EventArgs e)
        {

            String name = Name.Text;
            String email = Email.Text;
            String PhoneNo = Phone.Text;
            String dob = DOB.Text;
            String street = Street.Text;
            String city = City.Text;
            String state = State.Text;
            String Zipcode = ZipCode.Text;
            String ID = Session["ArtistID"].ToString();

            SqlConnection UpdateCon = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
            string uploadpic = "~/images/" + FileUpload1.FileName.ToString();
            FileUpload1.SaveAs(Server.MapPath("images//" + FileUpload1.FileName));

            SqlCommand cmd = new SqlCommand(string.Format("Update [Artist] SET name = '{0}',Email = '{1}', phoneNum = '{2}', dob = '{3}', street = '{4}', city = '{5}', state = '{6}', zipCode = '{7}',profilePic = '{8}' WHERE artistID = @ID", name, email, PhoneNo, dob, street, city, state, Zipcode, uploadpic), UpdateCon);
            cmd.Parameters.AddWithValue("@ID", ID);
            UpdateCon.Open();
            cmd.ExecuteNonQuery();
            UpdateCon.Close();
            Response.Redirect("~/ArtistProfile.aspx");
        }
    }
}