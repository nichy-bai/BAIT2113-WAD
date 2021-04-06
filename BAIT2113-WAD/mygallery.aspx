<%@ Page Title="" Language="C#" MasterPageFile="~/Gallerion.Master" AutoEventWireup="true" CodeBehind="mygallery.aspx.cs" Inherits="BAIT2113_WAD.mygallary" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="StyleSheet3.css" rel="stylesheet" />
    <div>
        <asp:PlaceHolder ID="HeaderPlaceHolder" runat ="server" />
    </div>
    <div class="profile-box">
        <div class="profile-detail">
            <asp:Image ID="profilepic" runat="server" class="profile-pic" />

            <span class="profile-detail-label">name</span>
            <asp:Label ID="lblArtistName" runat="server" CssClass="profile-detail-text"></asp:Label>

            <span class="profile-detail-label">user id</span>
            <asp:Label ID="lblArtistID" runat="server" CssClass="profile-detail-text"></asp:Label>

            <span class="profile-detail-label">date of birth</span>
                <asp:Label ID="lbldob" runat="server" CssClass="profile-detail-text"></asp:Label>

            <span class="profile-detail-label">phone</span>
            <asp:Label ID="lblphone" runat="server" CssClass="profile-detail-text"></asp:Label>

            <span class="profile-detail-label">email</span>
            <asp:Label ID="lblemail" runat="server" CssClass="profile-detail-text"></asp:Label>

            <a href="ArtistProfile.aspx" class="profile-btn">Artist Profile</a>
            <a href="mygallery.aspx" class="profile-btn-active">My Gallery</a>
            <a href="AddArtwork.aspx" class="profile-btn">Add New Artwork</a>
            <a href="ManageOrder.aspx" class="profile-btn">Manage Order</a>
        </div>
        <div class="profile-table">
            <div class="profile-addtitle">My Gallery</div>

            <div style="padding: 20px; padding-top: 0;">
            <div>Select the category:</div>
            <asp:DropDownList ID="ddlshowctg" runat="server" AutoPostBack="True" Height="32px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                <asp:ListItem>Painting</asp:ListItem>
                <asp:ListItem>Photography</asp:ListItem>
                <asp:ListItem>Design</asp:ListItem>
                <asp:ListItem>Sculpture</asp:ListItem>
                <asp:ListItem>Textile</asp:ListItem>
                <asp:ListItem>Illustration</asp:ListItem>
                </asp:DropDownList>

                <div style="height: 20px;"></div>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Artwork] WHERE ([artistID] = @artistID)">
                    <SelectParameters>
                        <asp:SessionParameter Name="artistID" SessionField="ArtistID" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Artwork] WHERE [artworkID] = @artworkID" InsertCommand="INSERT INTO [Artwork] ([artworkID], [artworkName], [artworkDesc], [quantity], [price], [category], [image]) VALUES (@artworkID, @artworkName, @artworkDesc, @quantity, @price, @category, @image)" SelectCommand="SELECT [artworkID], [artworkName], [artworkDesc], [quantity], [price], [category], [image] FROM [Artwork] WHERE (([category] = @category) AND ([artistID] = @artistID))" UpdateCommand="UPDATE [Artwork] SET [artworkName] = @artworkName, [artworkDesc] = @artworkDesc, [quantity] = @quantity, [price] = @price WHERE [artworkID] = @artworkID">
                    <DeleteParameters>
                        <asp:Parameter Name="artworkID" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="artworkID" Type="String" />
                        <asp:Parameter Name="artworkName" Type="String" />
                        <asp:Parameter Name="artworkDesc" Type="String" />
                        <asp:Parameter Name="quantity" Type="Decimal" />
                        <asp:Parameter Name="price" Type="String" />
                        <asp:Parameter Name="category" Type="String" />
                        <asp:Parameter Name="image" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlshowctg" Name="category" PropertyName="SelectedValue" Type="String" />
                        <asp:SessionParameter Name="artistID" SessionField="ArtistID" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="artworkName" Type="String" />
                        <asp:Parameter Name="artworkDesc" Type="String" />
                        <asp:Parameter Name="quantity" Type="Decimal" />
                        <asp:Parameter Name="price" Type="String" />
                        <asp:Parameter Name="category" Type="String" />
                        <asp:Parameter Name="image" Type="String" />
                        <asp:Parameter Name="artworkID" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>

                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="artworkID" DataSourceID="SqlDataSource2" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" CssClass="profile-gridview">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="artworkID" HeaderText="artwork ID" ReadOnly="True" SortExpression="artworkID" ItemStyle-Width="200px">
<ItemStyle Width="200px"></ItemStyle>
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="artwork Name" SortExpression="artworkName">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("artworkName") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Artwork name is required" ForeColor="Red"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("artworkName") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="200px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="artwork Desc" SortExpression="artworkDesc">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("artworkDesc") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Artwork description is required" ForeColor="Red"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("artworkDesc") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="200px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="quantity" SortExpression="quantity">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("quantity") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="Quantity is required" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox3" ValidationExpression="\d{1,5}" ErrorMessage="Invalid quantity" ForeColor="Red"></asp:RegularExpressionValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("quantity") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="200px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="price" SortExpression="price">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("price") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="Price is required" ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox4" ValidationExpression="^(?!0*\.0+$)\d*(?:\.\d+)?$" ErrorMessage="Invalid price" ForeColor="Red"></asp:RegularExpressionValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("price") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="200px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="category" HeaderText="category" SortExpression="category" ItemStyle-Width="200px" ReadOnly="True" >
<ItemStyle Width="200px"></ItemStyle>
                        </asp:BoundField>
                        <asp:ImageField HeaderText="artwork" SortExpression="image" DataImageURLField="image" ItemStyle-Width="200px" ItemStyle-Height="200px" ControlStyle-Height="200" ControlStyle-Width="200" ReadOnly="True" >
<ControlStyle Height="200px" Width="200px"></ControlStyle>

<ItemStyle Height="200px" Width="200px"></ItemStyle>
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
    </div>
</asp:Content>
