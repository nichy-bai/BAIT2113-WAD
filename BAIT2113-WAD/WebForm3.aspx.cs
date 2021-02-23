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
        protected void Page_Load(object sender, EventArgs e)
        {
            
           // string strCon = ConfigurationManager.ConnectionStrings["WebConfigConString "].ConnectionString;
            //SqlConnection con = new SqlConnection(strCon);
           // SqlCommand cmd = new SqlCommand(sql, con);

            //con.Open();
            //cmd.ExecuteNonQuery();
            //con.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //SqlConnection con = new SqlConnection(@"DataSource=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
            //SqlConnection con = new SqlConnection(strCon);
            //SqlCommand cmd = new SqlCommand(sql, con);
            if (FileUpload1.HasFile)
            {
                string strname = FileUpload1.FileName.ToString();
                string artid = TextBox1.Text;
                string sql = "insert into Artwork(artworkID,image) values (@artworkID,@image)";
                SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
                // SqlConnection con = new SqlConnection(@"DataSource=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
                //string strCon = ConfigurationManager.ConnectionStrings["WebConfigConString "].ConnectionString;
                //SqlConnection con = new SqlConnection(strCon);
                SqlCommand cmd = new SqlCommand(sql, con);
                //FileUpload1.PostedFile.SaveAs(Server.MapPath("~/upload/") + strname);
                // con.Open();
                // SqlCommand cmd = new SqlCommand("insert into upload1 values('" + "','" + strname + "')", con);
                // cmd.ExecuteNonQuery();
                //con.Close();
                cmd.Parameters.AddWithValue("@artworkID", artid);
                cmd.Parameters.AddWithValue("@image", strname);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Label1.Visible = true;
                Label1.Text = "Image Uploaded successfully";
                
            }
            else
            {
                Label1.Visible = true;
                Label1.Text = "Plz upload the image!!!!";
            }
        }
    
    }
}