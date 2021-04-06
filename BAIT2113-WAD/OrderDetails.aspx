<%@ Page Title="" Language="C#" MasterPageFile="~/Gallerion.Master" AutoEventWireup="true" CodeBehind="OrderDetails.aspx.cs" Inherits="BAIT2113_WAD.OrderDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<link href="StyleSheet3.css" rel="stylesheet" />

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
            <div class="profile-addtitle">Order Details</div>

            <table id="purchaseHistory" style="width:800px; border:hidden; border-collapse: collapse">
                <tr style="width:100%; background-color:lightgrey;">
                    <th>Artwork</th>
                    <th>Artwork ID</th>
                    <th>Quantity</th>
                    <th>Subtotal</th>
                </tr>

                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                    <ItemTemplate>
                        <tr style="border-bottom: 1px solid black;">
                            <td class="image" style="vertical-align: middle;">
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("image")%>' ImageAlign="Baseline" Width="200px" Height="200px" /></td>
                           <td style="text-align: center; height: 100px;width:200px;"><%# Eval("artworkID")%></td>
                            <td style="text-align: center; height: 100px;width:200px;"><%# Eval("quantity")%></td>
                            <td style ="text-align: center; height: 100px;width:200px;"><%# Eval("subtotal","${0:0.00}")%></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT OrderDetails.artworkID, OrderDetails.quantity, OrderDetails.subtotal, Artwork.image FROM OrderDetails INNER JOIN Artwork ON OrderDetails.artworkID = Artwork.artworkID WHERE (OrderDetails.OrderID = @OrderID)">
                    <SelectParameters>
                        <asp:SessionParameter Name="orderID" SessionField="@OrderID" />
                    </SelectParameters>
                </asp:SqlDataSource>

            </table>
        </div>
    </div>

</asp:Content>
