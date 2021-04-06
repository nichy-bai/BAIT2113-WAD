<%@ Page Title="" Language="C#" MasterPageFile="~/Gallerion.Master" AutoEventWireup="true" CodeBehind="Receipt.aspx.cs" Inherits="BAIT2113_WAD.Receipt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	 <table id="Receipt" style="width: 1000px; margin-top: 3%;" >

		 <asp:Label ID="Name" runat="server" Text=""></asp:Label>
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                    <ItemTemplate>
                        <tr style="border-style: solid none solid none; border-width: thin; font-weight: bold;border : thin ">
                            <td style="text-align: center; height: 200px;">
								<asp:Label ID="Label5" runat="server" ><%# Eval("artworkID")%></asp:Label></td>
                            <td style="text-align: center; height: 200px;">
								<asp:Label ID="Label1" runat="server" ><%# Eval("artworkName")%></asp:Label></td>
							<td style="text-align: center; height: 200px;">
								<asp:Label ID="Label3" runat="server" ><%# Eval("quantity")%></asp:Label></td>
							<td style="text-align: center; height: 200px;">
								<asp:Label ID="Label4" runat="server" ><%# Eval("subtotal")%></asp:Label></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>

            </table>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT OrderDetails.quantity, OrderDetails.OrderID, OrderDetails.subtotal, OrderDetails.artworkID, Artwork.artworkName FROM OrderDetails INNER JOIN Artwork ON OrderDetails.artworkID = Artwork.artworkID WHERE OrderDetails.OrderID = (SELECT TOP 1 [dbo].[Order].orderID FROM [dbo].[Order] ORDER BY [dbo].[Order].orderID DESC) "></asp:SqlDataSource>
</asp:Content>
