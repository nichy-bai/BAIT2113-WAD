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
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "deleteButton")
            {
                string artworkID = ((Label)e.Item.FindControl("artworkID")).Text;
                string customerID = Session["CustomerID"].ToString();

                string sql = "DELETE FROM Cart WHERE customerID = @CustomerID AND artworkID = @ArtworkID";
                SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
                SqlCommand cmd = new SqlCommand(sql, con);

                con.Open();
                cmd.Parameters.AddWithValue("@ArtworkID", artworkID);
                cmd.Parameters.AddWithValue("@CustomerID", customerID);
                cmd.ExecuteNonQuery();
                con.Close();

                Response.Redirect("~/Cart.aspx");
            }
        }
    }
}