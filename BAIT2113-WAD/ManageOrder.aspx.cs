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

            //var ctl = Page.LoadControl("~/User Control/Header.ascx");
            //HeaderPlaceHolder.Controls.Add(ctl);

            string ID = Session["ArtistID"].ToString();
            string sql = "Select COUNT(*) from [Order] WHERE status = 'Pending' ";
            string sql3 = "Select COUNT(*) from [Order] WHERE status = 'Shipped Out' ";
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
                profilepic.ImageUrl = rdr["profilePic"].ToString();

            }
            con.Close();
            con.Open();

            int c = Convert.ToInt32(cmd1.ExecuteScalar());
            Button1.Text = "Pending Shipment (" + c.ToString() + ")";

            con.Close();
            con.Open();

            int d = Convert.ToInt32(cmd2.ExecuteScalar());
            Button2.Text = "Shipped Out (" + d.ToString() + ")";

            con.Close();

            if (!IsPostBack)
            {
                this.SqlDataSource1.SelectCommand = null;
                this.DataList1.Visible = false;
                this.SqlDataSource2.SelectCommand = null;
                this.GridView2.Visible = false;
            }

        }

        //private void Btnsubmit_Click(object sender, EventArgs e)
        //{

        //    SqlDataSource1.UpdateParameters["reference"].DefaultValue = GridView1.
        //}

        protected void Button1_Click(object sender, EventArgs e)
        {
            Button1.ForeColor = System.Drawing.Color.Red;
            Button1.BackColor = System.Drawing.Color.Black;
            Button2.ForeColor = System.Drawing.Color.Black;
            Button2.BackColor = System.Drawing.Color.White;
            this.DataList1.Visible = true;
            this.GridView2.Visible = false;
            this.DataList1.DataBind();
            int count = DataList1.Items.Count;
            for (int i = 0; i < count; i++)
            {
                Label lbl = DataList1.Items[i].FindControl("lblremind") as Label;
                Label lbl1 = DataList1.Items[i].FindControl("lblartid") as Label;
                Label lbl2 = DataList1.Items[i].FindControl("lblorder") as Label;
                string lblText = lbl.Text;
                string lblText1 = lbl1.Text;
                string lblText2 = lbl2.Text;

                string sql4 = "Select [order].dateOrder from [Order] INNER JOIN OrderDetails ON [Order].orderID = OrderDetails.orderID where [Order].orderID = @orderID AND OrderDetails.artworkID = @artworkID";
                SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
                SqlCommand cmd4 = new SqlCommand(sql4, con);
                SqlDataReader rdr1;
                cmd4.Parameters.AddWithValue("@orderID", lblText2);
                cmd4.Parameters.AddWithValue("@artworkID", lblText1);
                con.Open();
                rdr1 = cmd4.ExecuteReader();

                while (rdr1.Read())
                {
                    string orderdate = rdr1["dateOrder"].ToString();
                    DateTime ordate = Convert.ToDateTime(orderdate);
                    DateTime odate = ordate.AddDays(7);
                    lbl.Text = "To prevent delay shipments, please arrange the shipment before " + odate.ToShortDateString();
                    //Session["odate"] = odate.ToShortDateString();
                }
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Button1.ForeColor = System.Drawing.Color.Black;
            Button1.BackColor = System.Drawing.Color.White;
            Button2.ForeColor = System.Drawing.Color.Chartreuse;
            Button2.BackColor = System.Drawing.Color.Black;
            this.DataList1.Visible = false;
            this.GridView2.Visible = true;
            this.GridView2.DataBind();
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {


            if (e.CommandName == "reference")
            {
                string reference = ((TextBox)e.Item.FindControl("txtref")).Text;
                string orderid = ((Label)e.Item.FindControl("lblorder")).Text;
                string artid = ((Label)e.Item.FindControl("lblartid")).Text;
                string logistic = ((Label)e.Item.FindControl("lbllgt")).Text;

                ((Label)e.Item.FindControl("errref")).Visible = false;

                if (logistic == "PosLaju")
                {
                    if (reference.Substring(0, 2) == "PL")
                    {
                        string sql1 = "Update o set o.referencesNo = @reference, o.status = 'Shipped out', o.dateDelivered = '" + DateTime.Today + "' FROM [Order] o INNER JOIN OrderDetails d ON o.orderID = d.orderID where o.orderID = @orderID AND d.artworkID = @artworkID";
                        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
                        SqlCommand cmd = new SqlCommand(sql1, con);
                        cmd.Parameters.AddWithValue("@reference", reference);
                        cmd.Parameters.AddWithValue("@orderID", orderid);
                        cmd.Parameters.AddWithValue("@artworkID", artid);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                        ((Label)e.Item.FindControl("errref")).Visible = false;
                        this.DataList1.Visible = true;
                        this.GridView2.Visible = false;
                        this.DataList1.DataBind();

                    }
                    else
                    {
                        ((Label)e.Item.FindControl("errref")).Visible = true;
                        ((Label)e.Item.FindControl("errref")).Text = "Please confirm the reference number is match with the logistic";
                    }

                }
                if (logistic == "J&T Express")
                {
                    if (reference.Substring(0, 2) == "JT")
                    {
                        string sql1 = "Update o set o.referencesNo = @reference, o.status = 'Shipped out', o.dateDelivered = '" + DateTime.Today + "' FROM [Order] o INNER JOIN OrderDetails d ON o.orderID = d.orderID where o.orderID = @orderID AND d.artworkID = @artworkID";
                        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
                        SqlCommand cmd = new SqlCommand(sql1, con);
                        cmd.Parameters.AddWithValue("@reference", reference);
                        cmd.Parameters.AddWithValue("@orderID", orderid);
                        cmd.Parameters.AddWithValue("@artworkID", artid);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                        ((Label)e.Item.FindControl("errref")).Visible = false;
                        this.DataList1.Visible = true;
                        this.GridView2.Visible = false;
                        this.DataList1.DataBind();

                    }
                    else
                    {
                        ((Label)e.Item.FindControl("errref")).Visible = true;
                        ((Label)e.Item.FindControl("errref")).Text = "Please confirm the reference number is match with the logistic";
                    }
                }
            }

        }

        //protected void GridView1_RowCommand(Object sender, GridViewCommandEventArgs e)
        //{
        //    if (e.CommandName == "references")
        //    {
        //        GridViewRow row = (GridViewRow)(((Control)e.CommandSource).NamingContainer);
        //       string reference = (row.FindControl("txtref") as TextBox).Text;
        //        string orderid = (row.FindControl("orderID") as Label).Text;
        //        string logistic = (row.FindControl("logistic") as Label).Text;
        //        string artworkid = (row.FindControl("artworkID") as Label).Text;
        //        DateTime ship = DateTime.Today;

        //        if (logistic == "PosLaju")
        //        {
        //            if (reference.Substring(0, 2) != "PL")
        //            {
        //                (row.FindControl("errref") as Label).Visible = true;
        //                (row.FindControl("errref") as Label).Text = "Please confirm the reference number is match with the logistic";

        //            }
        //            else
        //            {
        //                string sql1 = "Update [Order] set referencesNo = @reference, status = 'Shipped out', dateDelivered = now() where orderID = @orderID AND artworkID = @artworkID";
        //                SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
        //                SqlCommand cmd = new SqlCommand(sql1, con);
        //                cmd.Parameters.AddWithValue("@reference", reference);
        //                cmd.Parameters.AddWithValue("@orderID", orderid);
        //                cmd.Parameters.AddWithValue("@artworkID", artworkid);
        //                con.Open();
        //                cmd.ExecuteNonQuery();
        //                con.Close();
        //                //SqlDataSource1.UpdateParameters["reference"].DefaultValue = (row.FindControl("txtref") as TextBox).Text;
        //                //SqlDataSource1.UpdateParameters["date"].DefaultValue = ship.ToShortDateString();
        //                //SqlDataSource1.UpdateParameters["orderID"].DefaultValue = (row.FindControl("orderID") as Label).Text;
        //                (row.FindControl("errref") as Label).Visible = false;
        //            }
        //        }
        //        if (logistic == "J&T Express")
        //        {
        //            if (reference.Substring(0, 2) != "JT")
        //            {
        //                (row.FindControl("errref") as Label).Visible = true;
        //                (row.FindControl("errref") as Label).Text = "Please confirm the reference number is match with the logistic";

        //            }
        //            else
        //            {
        //                string sql1 = "Update [Order] set referencesNo = @reference, status = 'Shipped out', dateDelivered = '" + DateTime.Today + "' where orderID = @orderID AND artworkID = @artworkID";
        //                SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True");
        //                SqlCommand cmd = new SqlCommand(sql1, con);
        //                con.Open();
        //                cmd.Parameters.AddWithValue("@reference", reference);
        //                cmd.Parameters.AddWithValue("@orderID", orderid);
        //                cmd.Parameters.AddWithValue("@artworkID", artworkid);
        //                cmd.ExecuteScalar();
        //                con.Close();
        //                //SqlDataSource1.UpdateParameters["reference"].DefaultValue = (row.FindControl("txtref") as TextBox).Text;
        //                //SqlDataSource1.UpdateParameters["date"].DefaultValue = ship.ToShortDateString();
        //                //SqlDataSource1.UpdateParameters["orderID"].DefaultValue = (row.FindControl("orderID") as Label).Text;
        //                (row.FindControl("errref") as Label).Visible = false;
        //            }
        //        }
        //    }
        //}


    }
}