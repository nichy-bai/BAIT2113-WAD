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
    public partial class AddArtwork : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            var ctl = Page.LoadControl("~/User Control/Header.ascx");
            HeaderPlaceHolder.Controls.Add(ctl);

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
                lblArtistName.Text = rdr["name"].ToString();
                lbldob.Text = rdr["dob"].ToString();
                lblphone.Text = rdr["phoneNum"].ToString();
                lblemail.Text = rdr["email"].ToString();
                profilepic.ImageUrl = rdr["profilePic"].ToString();
            }

        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            string cgy = ddlCategory.SelectedItem.Text;



            string sql = "Select Top(1) artworkID from Artwork Where category = @cgy order by [artworkID] DESC";
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader rdr1;
            cmd.Parameters.AddWithValue("@cgy", cgy);
            con.Open();
            rdr1 = cmd.ExecuteReader();

            while (rdr1.Read())
            {
                lblArtistID.Text = rdr1["artworkID"].ToString();
                Session["lblart"] = lblArtistID.Text;
            }
            con.Close();
            string lblart = Session["lblart"].ToString();
            string lblart1 = lblart.Substring(2, 4);
            int d = Convert.ToInt32(lblart1);
            d++;
            //textBox2.Text = data.GetValue(0).ToString();
            //int c = Convert.ToInt32(cmd.ExecuteScalar());

            //SqlDataReader rdr1;
            //con.Open();
            //rdr5 = cmd.ExecuteScalar();
            //while (rdr1.Read())
            //{
            //a = rdr1.GetString(rdr1.GetOrdinal("artworkID"));
            //int c = Convert.ToInt32(cmd.ExecuteScalar());
            //c++;
            //b = a.Substring(6,2);
            //c = b + 1;
            if (cgy == "Painting")
            {
                lblArtworkID.Text = "PT000" + d.ToString();
            }
            else if (cgy == "Photography")
            {
                lblArtworkID.Text = "PG000" + d.ToString();
            }
            else if (cgy == "Design")
            {
                lblArtworkID.Text = "DG000" + d.ToString();
            }
            else if (cgy == "Sculpture")
            {
                lblArtworkID.Text = "SP000" + d.ToString();
            }
            else if (cgy == "Textile")
            {
                lblArtworkID.Text = "TT000" + d.ToString();
            }
            else if (cgy == "Illustration")
            {
                lblArtworkID.Text = "IT000" + d.ToString();
            }


            con.Close();

        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                string uploadpic = "~/images/" + FileUpload1.FileName.ToString();
                FileUpload1.SaveAs(Server.MapPath("images//" + FileUpload1.FileName));
                //string uploadpic1 = Path.Combine(Server.MapPath("image"), FileUpload1.FileName);
                //string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                //FileUpload1.PostedFile.SaveAs(Server.MapPath("image/") + fileName);
                //FileUpload1.SaveAs(uploadpic1);
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
                lblmsg.ForeColor = System.Drawing.Color.Green;
                lblmsg.Text = "Artwork Uploaded successfully.";
            }
        }
    }
}