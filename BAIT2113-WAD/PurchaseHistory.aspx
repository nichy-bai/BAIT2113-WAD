<%@ Page Title="" Language="C#" MasterPageFile="~/Gallerion.Master" AutoEventWireup="true" CodeBehind="PurchaseHistory.aspx.cs" Inherits="BAIT2113_WAD.PurchaseHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
		 <style>
        .image {
            text-align: center;
        }

        table.purchaseHistory {
            margin-left: auto;
            margin-right: auto;
        }
         img.rounded {
            border-radius: 6px !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script runat="server">

    protected void viewMore_Click(object sender, EventArgs e)
    {
        LinkButton InkRowSelection = (LinkButton)sender;
        //get the recipe id from command argument to link button
        string orderID = InkRowSelection.CommandArgument.ToString();
        Session.Add("@OrderID", orderID);
        //Session("artworkID") = ArtworkID;
        Response.Redirect("~/OrderDetails.aspx");
    }
        </script>
	<link href="StyleSheet3.css" rel="stylesheet" />
    <div>
        <asp:PlaceHolder ID="HeaderPlaceHolder" runat ="server" />
    </div>
    <div class="profile-box">
        <div class="profile-detail">

            <asp:Image ID="profilepic" runat="server" class="profile-pic" />

            <span class="profile-detail-label">name</span>
            <asp:Label ID="lblCustomerName" runat="server" CssClass="profile-detail-text"></asp:Label>

            <span class="profile-detail-label">user id</span>
            <asp:Label ID="lblCustomerID" runat="server" CssClass="profile-detail-text"></asp:Label>

            <span class="profile-detail-label">date of birth</span>
            <asp:Label ID="lbldob" runat="server" CssClass="profile-detail-text"></asp:Label>

            <span class="profile-detail-label">phone</span>
            <asp:Label ID="lblphone" runat="server" CssClass="profile-detail-text"></asp:Label>

            <span class="profile-detail-label">email</span>
            <asp:Label ID="lblemail" runat="server" CssClass="profile-detail-text"></asp:Label>

            <span class="profile-detail-label">address</span>
            <asp:Label ID="lbladdress" runat="server" CssClass="profile-detail-text"></asp:Label>

            <a href="Profile.aspx" class="profile-btn">Profile Details</a>
            <a href="Wishlist.aspx" class="profile-btn">Wishlist</a>
            <a href="Cart.aspx" class="profile-btn">Shopping Cart</a>
            <a href="PurchaseHistory.aspx" class="profile-btn-active">Purchase History</a>
        </div>

        <div>
            <div class="profile-addtitle">Purchase History</div>

            <table id="purchaseHistory" style="width: 1000px; margin-left: auto; margin-right: auto; margin-top: 3%">
                <tr style="font-weight: bold;text-align: center">
                    <th>Order Number</th>
                    <th>Total Amount</th>
                    <th>Date Order</th>
                    <th>Date Delivered</th>
                </tr>

                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                    <ItemTemplate>
                        <tr style="border-style: solid none solid none; border-width: thin; font-weight: bold; ">

                               <td style="text-align: center; height: 200px;">
								   <asp:LinkButton ID="LinkButton1" runat="server" OnClick ="viewMore_Click" CommandArgument='<%# Eval("orderID") %>'><%# Eval("orderID")%></asp:LinkButton></td>

                           <td style="text-align: center; height: 200px;"><%# Eval("totalAmount","${0:0.00}")%></td>
                           <td style="text-align: center; height: 200px;"><%# (String.IsNullOrEmpty(Eval("dateOrder").ToString()))
    ? "No Date Available" : Eval("dateOrder", "{0:d}") %></td>
                           <td style ="text-align: center; height: 200px;"><%# (String.IsNullOrEmpty(Eval("dateDelivered").ToString()))
    ? "No Date Available" : Eval("dateDelivered", "{0:d}") %></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT orderID, totalAmount, dateOrder, dateDelivered FROM [Order] WHERE customerId = @customerID">
                    <SelectParameters>
                        <asp:SessionParameter Name="customerID" SessionField="CustomerID" />
                    </SelectParameters>
                </asp:SqlDataSource>

            </table>
        </div>
    </div>

</asp:Content>
