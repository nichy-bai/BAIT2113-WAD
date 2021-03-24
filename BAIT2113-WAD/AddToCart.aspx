<%@ Page Title="" Language="C#" MasterPageFile="~/Gallerion.Master" AutoEventWireup="true" CodeBehind="AddToCart.aspx.cs" %>
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

            <a href="Profile.aspx" class="profile-btn">Profile Details</a>
            <a href="Wishlist.aspx" class="profile-btn">Wishlist</a>
            <a href="AddToCart.aspx" class="profile-btn-active">Shopping Cart</a>
            <a href="PurchaseHistory.aspx" class="profile-btn">Purchase History</a>
        </div>

        <div>
            <div class="profile-addtitle">Shopping Cart</div>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="No">
                <Columns>
                    <%--<asp:BoundField DataField="No" HeaderText="No" SortExpression="No" ReadOnly="True" />--%>
                    <asp:CommandField ShowDeleteButton="True" />
                    <asp:BoundField DataField="artworkID" HeaderText="artworkID" SortExpression="artworkID" />
                    <asp:ImageField HeaderText="image" SortExpression="image" DataImageURLField="image" ItemStyle-Width="200px" ItemStyle-Height="200px" ControlStyle-Height="200" ControlStyle-Width="200" >
<ControlStyle Height="200px" Width="200px"></ControlStyle>

<ItemStyle Height="200px" Width="200px"></ItemStyle>
                    </asp:ImageField>
                    <asp:BoundField DataField="artworkName" HeaderText="artworkName" SortExpression="artworkName" />
                    <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                    <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />
                    <asp:BoundField DataField="subtotal" HeaderText="subtotal" SortExpression="subtotal" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [No], [artworkID], [image], [artworkName], [price], [quantity], [subtotal] FROM [Cart]" DeleteCommand="DELETE FROM [Cart] WHERE [No] = @No" InsertCommand="INSERT INTO [Cart] ([No], [artworkID], [image], [artworkName], [price], [quantity], [subtotal]) VALUES (@No, @artworkID, @image, @artworkName, @price, @quantity, @subtotal)" UpdateCommand="UPDATE [Cart] SET [artworkID] = @artworkID, [image] = @image, [artworkName] = @artworkName, [price] = @price, [quantity] = @quantity, [subtotal] = @subtotal WHERE [No] = @No">
                <DeleteParameters>
                    <asp:Parameter Name="No" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="No" Type="Int32" />
                    <asp:Parameter Name="artworkID" Type="String" />
                    <asp:Parameter Name="image" Type="String" />
                    <asp:Parameter Name="artworkName" Type="String" />
                    <asp:Parameter Name="price" Type="String" />
                    <asp:Parameter Name="quantity" Type="Decimal" />
                    <asp:Parameter Name="subtotal" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="artworkID" Type="String" />
                    <asp:Parameter Name="image" Type="String" />
                    <asp:Parameter Name="artworkName" Type="String" />
                    <asp:Parameter Name="price" Type="String" />
                    <asp:Parameter Name="quantity" Type="Decimal" />
                    <asp:Parameter Name="subtotal" Type="String" />
                    <asp:Parameter Name="No" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>

    </div>
</asp:Content>
