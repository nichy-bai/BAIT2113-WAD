using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Data;
namespace BAIT2113_WAD
{
    public partial class mygallary : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            var ctl = Page.LoadControl("~/User Control/Header.ascx");
            HeaderPlaceHolder.Controls.Add(ctl);

            string ID = Session["ArtistID"].ToString();


            string sql2 = "Select * from Artist where artistID = @ID ";
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
            SqlCommand cmd = new SqlCommand(sql2, con);
            SqlDataReader rdr3;
            cmd.Parameters.AddWithValue("@ID", ID);
            con.Open();
            rdr3 = cmd.ExecuteReader();

            while (rdr3.Read())
            {
                lblArtistID.Text = rdr3["artistID"].ToString();
                lblArtistName.Text = rdr3["name"].ToString();
                lbldob.Text = rdr3["dob"].ToString();
                lblphone.Text = rdr3["phoneNum"].ToString();
                lblemail.Text = rdr3["email"].ToString();
                profilepic.ImageUrl = rdr3["profilePic"].ToString();

            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}