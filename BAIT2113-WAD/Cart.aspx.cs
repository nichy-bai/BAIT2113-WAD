﻿using System;
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

        protected void Delete_Click(object sender, EventArgs e)
        {
            string customerID = Session["CustomerID"].ToString();

            string sql = "DELETE FROM Cart WHERE customerID = @CustomerID";
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
            SqlCommand cmd = new SqlCommand(sql, con);

            con.Open();
            cmd.Parameters.AddWithValue("@CustomerID", customerID);
            cmd.ExecuteNonQuery();
            con.Close();

            Response.Redirect("~/Cart.aspx");
        }

        protected void addMoreItems_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Artwork.aspx");
        }
        protected void Page_Error(object sender, EventArgs e)
        {
            Exception Ex = Server.GetLastError();
            Server.ClearError();
            Response.Redirect("/errors/Error.html");
        }
    }
}