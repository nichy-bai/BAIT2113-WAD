<%@ Page Title="" Language="C#" MasterPageFile="~/Gallerion.Master" AutoEventWireup="true" CodeBehind="mygallery.aspx.cs" Inherits="BAIT2113_WAD.mygallary" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="StyleSheet2.css" rel="stylesheet" />
    <div class="profile-box">
        <div class="profile-detail">
            <asp:Image ID="profilepic" runat="server" class="profile-pic" ImageUrl="images/avatar.png"/>
                
                <asp:Label ID="lblArtistName" runat="server"></asp:Label>
                <asp:Label ID="lblArtistID" runat="server"></asp:Label>
                <asp:Label ID="lbldob" runat="server"></asp:Label>
                <asp:Label ID="lblphone" runat="server"></asp:Label>
                <asp:Label ID="lblemail" runat="server"></asp:Label>

                <a href="mygallery.aspx" class="profile-btn-active">My Gallery</a>
                <a href="AddArtwork.aspx" class="profile-btn">Add New Artwork</a>
        </div>
        <div class="profile-table">
            <div>Select the category:</div>
            <asp:DropDownList ID="ddlshowctg" runat="server" AutoPostBack="True" Height="32px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                <asp:ListItem>Painting</asp:ListItem>
                <asp:ListItem>Photography</asp:ListItem>
                <asp:ListItem>Design</asp:ListItem>
                <asp:ListItem>Sculpture</asp:ListItem>
                <asp:ListItem>Textile</asp:ListItem>
                <asp:ListItem>Illustration</asp:ListItem>
                </asp:DropDownList>


                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Artwork] WHERE ([artistID] = @artistID)">
                    <SelectParameters>
                        <asp:SessionParameter Name="artistID" SessionField="ArtistID" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Artwork] WHERE [artworkID] = @artworkID" InsertCommand="INSERT INTO [Artwork] ([artworkID], [artworkName], [artworkDesc], [quantity], [price], [category], [image], [artistID]) VALUES (@artworkID, @artworkName, @artworkDesc, @quantity, @price, @category, @image, @artistID)" SelectCommand="SELECT * FROM [Artwork] WHERE ([category] = @category)" UpdateCommand="UPDATE [Artwork] SET [artworkName] = @artworkName, [artworkDesc] = @artworkDesc, [quantity] = @quantity, [price] = @price, [category] = @category, [image] = @image WHERE ([artworkID] = @artworkID)">
                    <DeleteParameters>
                        <asp:Parameter Name="artworkID" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="artworkID" Type="String" />
                        <asp:Parameter Name="artworkName" Type="String" />
                        <asp:Parameter Name="artworkDesc" Type="String" />
                        <asp:Parameter Name="quantity" Type="Decimal" />
                        <asp:Parameter Name="price" Type="Decimal" />
                        <asp:Parameter Name="category" Type="String" />
                        <asp:Parameter Name="image" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlshowctg" Name="category" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="artworkName" Type="String" />
                        <asp:Parameter Name="artworkDesc" Type="String" />
                        <asp:Parameter Name="quantity" Type="Decimal" />
                        <asp:Parameter Name="price" Type="Decimal" />
                        <asp:Parameter Name="category" Type="String" />
                        <asp:Parameter Name="image" Type="String" />
                        <asp:Parameter Name="artworkID" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="artworkID" DataSourceID="SqlDataSource2" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" CssClass="profile-gridview">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Button" />
                        <asp:BoundField DataField="artworkID" HeaderText="artworkID" ReadOnly="True" SortExpression="artworkID" ItemStyle-Width="200px" >
<ItemStyle Width="200px"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="artworkName" HeaderText="artworkName" SortExpression="artworkName" ItemStyle-Width="200px" >
<ItemStyle Width="200px"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="artworkDesc" HeaderText="artworkDesc" SortExpression="artworkDesc" ItemStyle-Width="200px" >
<ItemStyle Width="200px"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" ItemStyle-Width="200px" >
<ItemStyle Width="200px"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="price" HeaderText="price(RM)" SortExpression="price" ItemStyle-Width="200px" >
<ItemStyle Width="200px"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="category" HeaderText="category" SortExpression="category" ItemStyle-Width="200px">
<ItemStyle Width="200px"></ItemStyle>
                        </asp:BoundField>
                        <asp:ImageField HeaderText="image" SortExpression="image" DataImageURLField="image" ItemStyle-Width="200px" ItemStyle-Height="200px" ControlStyle-Height="200" ControlStyle-Width="200">
<ItemStyle Width="200px"></ItemStyle>
                        </asp:ImageField>
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#242121" />
                </asp:GridView>
                <asp:Repeater ID="Repeater1" runat="server">
                </asp:Repeater>
        </div>
    </div>
</asp:Content>
