using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace BAIT2113_WAD
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["CustomerID"] != null)
            {
                var ctl = Page.LoadControl("~/User Control/CHeader.ascx");
                HeaderPlaceHolder.Controls.Add(ctl);

                string ID = Session["CustomerID"].ToString();

                string sql2 = "Select * from Customer where customerID = @ID ";
                SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
                SqlCommand cmd = new SqlCommand(sql2, con);
                SqlDataReader rdr;
                cmd.Parameters.AddWithValue("@ID", ID);
                con.Open();
                rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    lblCustomerID.Text = rdr["customerID"].ToString();
                    lblCustomerName.Text = rdr["name"].ToString();
                    lbldob.Text = rdr["dob"].ToString();
                    lblphone.Text = rdr["phoneNum"].ToString();
                    lblemail.Text = rdr["email"].ToString();
                    profilepic.ImageUrl = rdr["profilePic"].ToString();
                    lbladdress.Text = rdr["street"].ToString() + ", " + rdr["city"].ToString() + ", " + rdr["zipCode"].ToString() + ", " + rdr["state"].ToString();
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('You must log in as a customer to access this feature.');window.location ='Homepage.aspx';", true);
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
            String opassword = OPassword.Text;
            String password = Password.Text;

            String ID = Session["CustomerID"].ToString();

            SqlConnection UpdateCon = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
            string uploadpic = "~/images/" + FileUpload1.FileName.ToString();
            FileUpload1.SaveAs(Server.MapPath("images//" + FileUpload1.FileName));

            String sql = "SELECT password FROM Customer WHERE customerID = @customerID";
            SqlCommand cmd1 = new SqlCommand(sql, UpdateCon);
            cmd1.Parameters.AddWithValue("@customerID", ID);

            UpdateCon.Open();
            String oldPassword = cmd1.ExecuteScalar().ToString();
            UpdateCon.Close();

            if (opassword == oldPassword)
            {
                UpdateCon.Open();
                SqlDataReader rdr;
                rdr = cmd1.ExecuteReader();
                while (rdr.Read())
                {
                    oldPassword = rdr["password"].ToString();
                }
                UpdateCon.Close();

                SqlCommand cmd = new SqlCommand(string.Format("Update [Customer] SET name = '{0}',Email = '{1}', phoneNum = '{2}', dob = '{3}', street = '{4}', city = '{5}', state = '{6}', zipCode = '{7}',profilePic = '{8}',password = '{9}' WHERE customerID = @ID", name, email, PhoneNo, dob, street, city, state, Zipcode, uploadpic, password), UpdateCon);
                cmd.Parameters.AddWithValue("@ID", ID);
                UpdateCon.Open();
                cmd.ExecuteNonQuery();
                UpdateCon.Close();
                Response.Redirect("~/Profile.aspx");

                lblopass.ForeColor = System.Drawing.Color.Green;
                lblopass.Text = "Old password not match.";
            }
            else
            {
                lblopass.ForeColor = System.Drawing.Color.Red;
                lblopass.Text = "Old password not match.";
            }

        }

        protected void Page_Error(object sender, EventArgs e)
        {
            Exception Ex = Server.GetLastError();
            Server.ClearError();
            Response.Redirect("/errors/Error.html");
        }
    }
}