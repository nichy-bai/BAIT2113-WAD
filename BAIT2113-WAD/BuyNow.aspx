<%@ Page Title="" Language="C#" MasterPageFile="~/Gallerion.Master" AutoEventWireup="true" CodeBehind="BuyNow.aspx.cs" Inherits="BAIT2113_WAD.BuyNow" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div class="profile-addtitle">Check Out</div>

        <table style="width: 100%; border: hidden; border-collapse: collapse">
            <tr style="width: 100%; background-color: lightgrey">
                <td style="text-align: center; width: 200px;">Image</td>
                <td style="text-align: center; width: 150px;">Artwork Name</td>
                <td style="text-align: center; width: 150px;">Price</td>
                <td style="text-align: center; width: 150px;">Quantity</td>
                <td style="text-align: center; width: 150px;">Subtotal</td>
            </tr>
            <tr>
                <td>
                    <asp:Image ID="Image1" runat="server" /></td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text=""></asp:Label></td>
                <td>
                    <asp:Label ID="Label3" runat="server" Text=""></asp:Label></td>
                <td>
                    <asp:Label ID="Label4" runat="server" Text=""></asp:Label></td>
                <td>
                    <asp:Label ID="Label5" runat="server" Text=""></asp:Label></td>
            </tr>
        </table>
        <asp:Button ID="checkout" runat="server" Text="Checkout" OnClick="checkout_Click" />
    </div>
</asp:Content>
