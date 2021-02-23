<%@ Page Title="" Language="C#" MasterPageFile="~/Gallerion.Master" AutoEventWireup="true" CodeBehind="Wishlist.aspx.cs" Inherits="BAIT2113_WAD.WebForm4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css" integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX" crossorigin="anonymous">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons">
    <link rel="stylesgeet" href="https://rawgit.com/creativetimofficial/material-kit/master/assets/css/material-kit.css">
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
     <div class="image mr-3" style="margin-top:10%">
                        <img src="https://i.imgur.com/ZSkeqnd.jpg" class="rounded-circle" width="100" />
         <p style="font-size: 20px">Anna Watson</p>
         </div>
    

    <p style="margin-left:20%;margin-top:5%; font-size: 58px; font-family: 'Blackadder ITC';">Wishlist</p>
    <table id="wishlist" style="width: 70%; margin-left: auto; margin-right: auto; margin-top: 3%">
        
        
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <tr style="border-style: solid none solid none; border-width: thin; font-weight: bold; ">
                    <td class="image">
                        <asp:ImageButton ID="Image1" runat="server" ImageUrl='<%# Eval("image")%>' ImageAlign="Baseline" Width="100px" Height="100px" /></td>
                    <td style="text-align: center; height: 200px;"><%# Eval("artworkName")%></td>
                    <td style="text-align: center; height: 200px;">
                        <asp:ImageButton ID="order" runat="server" Imageurl ="~/cart.png" ImageAlign="Baseline" Height="100px" Width="100px" />
                    </td>
                    <td style="text-align: center; height: 200px;">
                        <asp:ImageButton ID="btnDelete" runat="server" Imageurl ="~/delete.png" ImageAlign="Baseline" Height="100px" Width="100px" />
                    </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
    </table>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Artwork.artworkName, Artwork.price, Artwork.image FROM Artwork INNER JOIN WishArt ON Artwork.artworkID = WishArt.artworkID INNER JOIN Wishlist ON WishArt.wishlistID = Wishlist.wishlistID INNER JOIN Customer ON Wishlist.customerID = Customer.customerID"></asp:SqlDataSource>
    
</asp:Content>

