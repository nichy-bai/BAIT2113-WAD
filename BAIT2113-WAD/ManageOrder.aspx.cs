using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;

namespace BAIT2113_WAD
{
    public partial class ManageOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string ID = Session["ArtistID"].ToString();
            string sql = "Select count(*) from Order o where o.status = 'Pending' ";
            string sql2 = "Select * from Artist where artistID = @ID ";
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
            SqlCommand cmd = new SqlCommand(sql2, con);
            SqlCommand cmd1 = new SqlCommand(sql, con);
            SqlDataReader rdr;
            cmd.Parameters.AddWithValue("@ID", ID);
            con.Open();
            rdr = cmd.ExecuteReader();
            
            while (rdr.Read())
            {
                lblArtistID.Text = rdr["artistID"].ToString();
                lblArtistName.Text = rdr["name"].ToString();
                lbldob.Text = rdr["dob"].ToString();
                lblphone.Text = rdr["phoneNum"].ToString();
                lblemail.Text = rdr["email"].ToString();
                HyperLink1.NavigateUrl = rdr["video"].ToString();
                profilepic.ImageUrl = rdr["profilePic"].ToString();
                
            }
            con.Close();
            con.Open();
            
                int c = Convert.ToInt32(cmd1.ExecuteScalar());
                lblpending.Text = c.ToString();
           
            con.Close();
        }
    }
}