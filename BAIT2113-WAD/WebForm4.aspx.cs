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
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string ID = Session["ArtistID"].ToString();

            string sql2 = "Select * from Artist where artistID = @ID ";
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
            SqlCommand cmd = new SqlCommand(sql2, con);
            SqlDataReader rdr;
            cmd.Parameters.AddWithValue("@ID", ID);
            con.Open();
            rdr = cmd.ExecuteReader();

            while (rdr.Read())
            {

                lblArtistID.Text = rdr["artistID"].ToString();
                lblArtistName.Text = rdr["artistName"].ToString();
                lbldob.Text = rdr["dob"].ToString();
                lblphone.Text = rdr["phoneNum"].ToString();
                lblemail.Text = rdr["email"].ToString();

            }
           
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            string cgy = ddlCategory.SelectedItem.Text;
            string a, b, c;
            string sql = "Select Top 1 artworkID from Artwork order by artworkID DESC ";
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
            SqlCommand cmd = new SqlCommand(sql, con);
           
            SqlDataReader rdr1;
            con.Open();
            rdr1 = cmd.ExecuteReader();
            while (rdr1.Read())
            {
                a = rdr1.GetString(rdr1.GetOrdinal("artworkID"));
                b = a.Substring(6,2);
                c = b + 1;
                if (cgy == "Painting")
                {
                    lblArtworkID.Text = "PT00000" + c;
                }
                else if (cgy == "Photography")
                {
                    lblArtworkID.Text = "PG00000" + c;
                }
                else if (cgy == "Design")
                {
                    lblArtworkID.Text = "DG00000" + c;
                }
                else if (cgy == "Sculpture")
                {
                    lblArtworkID.Text = "SP00000" + c;
                }
                else if (cgy == "Textile")
                {
                    lblArtworkID.Text = "TT00000" + c;
                }
                else if (cgy == "Illustration")
                {
                    lblArtworkID.Text = "IT00000" + c;
                }
                
            }
                con.Close();

        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                string uploadpic = FileUpload1.FileName.ToString();
                
                string ID = Session["ArtistID"].ToString();
                string cgy = ddlCategory.SelectedItem.Text;
                string artid = lblArtworkID.Text;
                string artworkname = txtArtworkName.Text;
                string desc = taDescription.Value;
                int qty = Convert.ToInt32(txtQuantity.Text);
                double prc = Convert.ToDouble(txtPrice.Text);
                string sql1 = "insert into Artwork(artworkID,image,artworkName,artworkDesc,quantity,price,category,artistID) values (@artworkID,@image,@artworkName,@artworkDesc,@quantity,@price,@category,@artistID)";
                SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
                SqlCommand cmd = new SqlCommand(sql1, con);
                cmd.Parameters.AddWithValue("@artworkID", artid);
                cmd.Parameters.AddWithValue("@image", uploadpic);
                cmd.Parameters.AddWithValue("@artworkName", artworkname);
                cmd.Parameters.AddWithValue("@artworkDesc", desc);
                cmd.Parameters.AddWithValue("@quantity", qty);
                cmd.Parameters.AddWithValue("@price", prc);
                cmd.Parameters.AddWithValue("@category", cgy);
                cmd.Parameters.AddWithValue("@artistID", ID);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                lblmsg.Visible = true;
                lblmsg.Text = "Artwork Uploaded successfully";

            }
            else
            {
                lblmsg.Visible = true;
                lblmsg.Text = "Please upload the image!!!!";
            }
        
        }
    }
}