<%@ Page Title="" Language="C#" MasterPageFile="~/Gallerion.Master" AutoEventWireup="true" CodeBehind="ManageOrder.aspx.cs" Inherits="BAIT2113_WAD.ManageOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="StyleSheet3.css" rel="stylesheet" />

    <div class="profile-box">
        <div class="profile-detail">

                <asp:Image ID="profilepic" runat="server" class="profile-pic" />

                <asp:Label ID="lblArtistName" runat="server"></asp:Label>
                <asp:Label ID="lblArtistID" runat="server"></asp:Label>
                <asp:Label ID="lbldob" runat="server"></asp:Label>
                <asp:Label ID="lblphone" runat="server"></asp:Label>
                <asp:Label ID="lblemail" runat="server"></asp:Label>
            <asp:HyperLink ID="HyperLink1" runat="server" Target="_blank">watch me</asp:HyperLink>
                <a href="mygallery.aspx" class="profile-btn">My Gallery</a>
                <a href="AddArtwork.aspx" class="profile-btn-active">Add New Artwork</a>
        </div>
        <div class="profile-addartwork">
            <div class="profile-addtitle">Order Management</div>

            <div class="profile-artworkrow">
                <a href="mygallery.aspx" class="profile-btn"> <asp:Label ID="lblpending" runat="server" Text=" "></asp:Label><br /><asp:Label ID="Label2" runat="server" Text="Pending Shipment"></asp:Label></a>
                </div>
            </div>
        </div>

</asp:Content>
