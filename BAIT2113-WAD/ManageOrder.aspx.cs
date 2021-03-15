﻿using System;
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
            string sql = "Select COUNT(*) from [Order] WHERE status = 'Pending' ";
            string sql3 = "Select COUNT(*) from [Order] WHERE status = 'Delivered' ";
            string sql2 = "Select * from Artist where artistID = @ID ";
            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
            SqlCommand cmd = new SqlCommand(sql2, con);
            SqlCommand cmd1 = new SqlCommand(sql, con);
            SqlCommand cmd2 = new SqlCommand(sql3, con);
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
            Button1.Text = "Pending Shipment (" + c.ToString() + ")";

            con.Close();
            con.Open();

            int d = Convert.ToInt32(cmd2.ExecuteScalar());
            Button2.Text = "Delivered (" + d.ToString() + ")";

            con.Close();

            if (!IsPostBack)
            {
                this.SqlDataSource1.SelectCommand = null;
                this.Repeater1.Visible = false;
                this.SqlDataSource2.SelectCommand = null;
                this.Repeater2.Visible = false;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Button1.ForeColor = System.Drawing.Color.Red;
            Button1.BackColor = System.Drawing.Color.Black;
            Button2.ForeColor = System.Drawing.Color.Black;
            Button2.BackColor = System.Drawing.Color.White;
            this.Repeater1.Visible = true;
            this.Repeater2.Visible = false;
            this.Repeater1.DataBind();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Button1.ForeColor = System.Drawing.Color.Black;
            Button1.BackColor = System.Drawing.Color.White;
            Button2.ForeColor = System.Drawing.Color.Chartreuse;
            Button2.BackColor = System.Drawing.Color.Black;
            this.Repeater1.Visible = false;
            this.Repeater2.Visible = true;
            this.Repeater2.DataBind();
        }
    }
}