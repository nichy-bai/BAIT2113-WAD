using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BAIT2113_WAD
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*string sql2 = "Select SUM(Subtotal) from Cart where CustomerID = @ID";
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
            SqlCommand cmd = new SqlCommand(sql2, con);
            SqlDataReader rdr;
            cmd.Parameters.AddWithValue("@ID", ID);
            con.Open();
            rdr = cmd.ExecuteReader();

            lblTotal.Text = sql2;*/

            //string sql2 = "Select * from Cart where CustomerID = @ID ";
            SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True"); //connect to the database here
            conn.Open();
            //SqlCommand cmd = new SqlCommand(sql2, conn);
            //cmd.Parameters.AddWithValue("@ID", ID);
            String ID = Session["CustomerID"].ToString();
            SqlDataAdapter sda = new SqlDataAdapter(string.Format("Select SUM(subtotal) from Cart where CustomerID = '{0}'", ID), conn);
            conn.Close();
            DataTable dt = new DataTable();
            sda.Fill(dt);
            lblTotal.Text = String.Format("$ {0:0.00}", (dt.Rows[0][0].ToString()));
        }

        protected void Payment_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Payment.aspx");
        }
    }
}