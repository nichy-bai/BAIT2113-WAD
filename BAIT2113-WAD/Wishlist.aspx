<%@ Page Title="" Language="C#" MasterPageFile="~/Gallerion.Master" AutoEventWireup="true" CodeBehind="Wishlist.aspx.cs" Inherits="BAIT2113_WAD.WebForm4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
		<style>
        .image {
            text-align: center;
        }

        table.wishlist {
            margin-left: auto;
            margin-right: auto;
        }
         img.rounded {
            border-radius: 6px !important;
        }
    </style>
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
            <a href="Wishlist.aspx" class="profile-btn-active">Wishlist</a>
            <a href="Cart.aspx" class="profile-btn">Shopping Cart</a>
            <a href="PurchaseHistory.aspx" class="profile-btn">Purchase History</a>
        </div>


        <div>
            <div class="profile-addtitle">Wishlist</div>

            <table id="wishlist" style="width: 1000px; margin-left: auto; margin-right: auto; margin-top: 3%">

                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                    <ItemTemplate>
                        <tr style="border-style: solid none solid none; border-width: thin; font-weight: bold; ">
                            <td style="text-align: center; height: 200px;">
								<asp:Label ID="artworkID" runat="server" Text='<%# Eval("artworkID")%>'></asp:Label></td>
                            <td class="image">
                                <asp:ImageButton ID="Image1" runat="server" ImageUrl='<%# Eval("image")%>' ImageAlign="Baseline" Width="100px" Height="100px" /></td>
                            <td style="text-align: center; height: 200px;"><%# Eval("artworkName")%></td>
                            <td style="text-align: center; height: 200px;">
                                <asp:ImageButton ID="btnDelete" runat="server" Imageurl ="images/delete.png"  OnClick ="Delete_Click" ImageAlign="Baseline" Height="50px" Width="50px" />
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Artwork.artworkID,Artwork.image, Artwork.artworkName FROM Wishlist INNER JOIN Artwork ON Wishlist.artworkID = Artwork.artworkID WHERE(Wishlist.customerID=@customerID)">
                <SelectParameters>
                    <asp:SessionParameter Name="customerID" SessionField="customerID" />
                </SelectParameters>
            </asp:SqlDataSource>
        	<asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
        </div>
    </div>

</asp:Content>

