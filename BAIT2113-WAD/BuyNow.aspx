<%@ Page Title="" Language="C#" MasterPageFile="~/Gallerion.Master" AutoEventWireup="true" CodeBehind="BuyNow.aspx.cs" Inherits="BAIT2113_WAD.BuyNow" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="StyleSheet3.css" rel="stylesheet" />
    <div style="padding: 0 50px;">
        <div class="profile-addtitle" style="margin-top: 50px;">Buy Now</div>

        <table style="border: hidden; border-collapse: collapse">
            <tr style="background-color: lightgrey">
                <td style="text-align: center; width: 200px;">Image</td>
                <td style="text-align: center; width: 200px;">Artwork Name</td>
                <td style="text-align: center; width: 200px;">Price</td>
                <td style="text-align: center; width: 200px;">Quantity</td>
                <td style="text-align: center; width: 200px;">Subtotal</td>
            </tr>
            <tr>
                <td style="text-align:center;width: 500px;">
                    <asp:Image ID="Image1" runat="server" Width="200px" /></td>
                <td style="text-align:center;">
                    <asp:Label ID="Label2" runat="server" Text="" Width="200px"></asp:Label></td>
                <td style="text-align:center;">
                    <asp:Label ID="Label3" runat="server" Text="" Width="200px"></asp:Label></td>
                <td style="text-align:center;">
                    <asp:Label ID="Label4" runat="server" Text="" Width="200px"></asp:Label></td>
                <td style="text-align:center;">
                    <asp:Label ID="Label5" runat="server" Text="" Width="200px"></asp:Label></td>
            </tr>
        </table>
        <div style="margin: 100px 25%;">
            <asp:Button ID="checkout" runat="server" Text="Checkout" OnClick="checkout_Click"  CssClass="profile-uploadbtn"/>
        </div>
    </div>
</asp:Content>
