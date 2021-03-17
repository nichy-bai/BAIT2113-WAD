<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddToCart.aspx.cs" Inherits="BAIT2113_WAD.Checkout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="StyleSheet1.css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="artworkID" HeaderText="artworkID" SortExpression="artworkID" />
                <asp:ImageField HeaderText="image" SortExpression="image" DataImageURLField="image" ItemStyle-Width="200px" ItemStyle-Height="200px" ControlStyle-Height="200" ControlStyle-Width="200" />
                <asp:BoundField DataField="artworkName" HeaderText="artworkName" SortExpression="artworkName" />
                <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />
                <asp:BoundField DataField="subtotal" HeaderText="subtotal" SortExpression="subtotal" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [artworkID], [image], [artworkName], [price], [quantity], [subtotal] FROM [Cart] WHERE ([customerID] = @customerID)">
            <SelectParameters>
                <asp:SessionParameter Name="customerID" SessionField="CustomerID" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        
    </form>
</body>
</html>
