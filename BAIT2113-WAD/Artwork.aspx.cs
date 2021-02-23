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
    public partial class Artwork : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //string sql = "select name, artistID from Artist";
            //string sql1 = "Select artworkName from Artwork";
            //SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
            //SqlCommand cmd = new SqlCommand(sql, con);
            //SqlCommand cmd1 = new SqlCommand(sql1, con);

            //SqlDataReader rdr1;
            //SqlDataReader rdr2;
            //con.Open();
            //rdr1 = cmd.ExecuteReader();

            //while (rdr1.Read())
            //{
            //    Label1.Text = rdr1["name"].ToString();

            //}
            //con.Close();

            //con.Open();
            //rdr2 = cmd1.ExecuteReader();
            //while (rdr2.Read())
            //{
            //    Label2.Text = rdr2["artworkName"].ToString();
            //}
            //con.Close();



        }

        protected void viewMore_Click(object sender, System.EventArgs e)
        {
            Button InkRowSelection = (Button)sender;
            //get the recipe id from command argument to link button
            string ArtworkID = InkRowSelection.CommandArgument.ToString();

            Session["artworkID"] = ArtworkID;
            Response.Redirect("Order.aspx");

        }
       /* protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label label12 = (Label)e.Item.FindControl("label1");
                label12.Text = "bird";
                Session["artworkName"] = label12.Text;

            }
        }*/
    }
}