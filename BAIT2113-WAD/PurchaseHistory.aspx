<%@ Page Title="" Language="C#" MasterPageFile="~/Gallerion.Master" AutoEventWireup="true" CodeBehind="PurchaseHistory.aspx.cs" Inherits="BAIT2113_WAD.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script src="https://kit.fontawesome.com/yourcode.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css" integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX" crossorigin="anonymous">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons">
    <link rel="stylesgeet" href="https://rawgit.com/creativetimofficial/material-kit/master/assets/css/material-kit.css">
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
    

    <p style="margin-left:20%;margin-top:5%; font-size: 58px; font-family: 'Blackadder ITC';">Purchase History</p>
    <table id="purchaseHistory" style="width: 70%; margin-left: auto; margin-right: auto; margin-top: 3%">
        <tr style="font-weight: bold;text-align: center">
            <th>Order Number</th>
            <th></th>
            <th></th>
            <th>Subtotal</th>
        </tr>
        
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <tr style="border-style: solid none solid none; border-width: thin; font-weight: bold; ">
                    
                       <td style="text-align: center; height: 200px;"><%# Eval("orderID")%></td>
                    
                    <td class="image">
                        <asp:ImageButton ID="Image1" runat="server" ImageUrl='<%# Eval("image")%>' ImageAlign="Baseline" Width="100px" Height="100px" /></td>
                    <td style="text-align: center; height: 200px;"><%# Eval("artworkName")%></td>
                    <td style ="text-align: center; height: 200px;"><%# Eval("subtotal")%></td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Order].orderID, Artwork.image, Artwork.artworkName, [Order].subtotal FROM Artwork INNER JOIN [Order] ON Artwork.artworkID = [Order].artworkID WHERE ([Order].customerID = @customerID)">
            <SelectParameters>
                <asp:SessionParameter Name="customerID" SessionField="CustomerID" />
            </SelectParameters>
        </asp:SqlDataSource>
        
    </table>
    </asp:Content>
