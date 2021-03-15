<%@ Page Title="" Language="C#" MasterPageFile="~/Gallerion.Master" AutoEventWireup="true" CodeBehind="ManageOrder.aspx.cs" Inherits="BAIT2113_WAD.ManageOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="StyleSheet3.css" rel="stylesheet" />

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

            <asp:HyperLink ID="HyperLink1" runat="server" Target="_blank" class="profile-btn">Watch Me</asp:HyperLink>
            <a href="mygallery.aspx" class="profile-btn">My Gallery</a>
            <a href="AddArtwork.aspx" class="profile-btn">Add New Artwork</a>
            <a href="ManageOrder.aspx" class="profile-btn-active">Manage Order</a>
        </div>
        <div class="profile-manageorder">
            <div class="profile-addtitle">Order Management</div>

            <div class="profile-artworkrow">
                <asp:Button ID="Button1" runat="server" Text=" " PostBackUrl="~/ManageOrder.aspx" OnClick="Button1_Click" CssClass="order-manage-btn" />
                <asp:Button ID="Button2" runat="server" Text=" " PostBackUrl="~/ManageOrder.aspx" OnClick="Button2_Click" CssClass="order-manage-btn" />
            </div>


            <div class="profile-ordercol">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Order].orderID, [Order].quantity, [Order].totalAmount, Customer.name, [Order].customerID, Artwork.image, Artwork.artworkName FROM Artist INNER JOIN Artwork ON Artist.artistID = @artistID INNER JOIN [Order] ON Artwork.artworkID = [Order].artworkID INNER JOIN Customer ON [Order].customerID = Customer.customerID WHERE ([Order].status = 'Pending')">
                    <SelectParameters>
                        <asp:SessionParameter Name="artistID" SessionField="ArtistID" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Artwork.artworkName, Artwork.image, [Order].totalAmount, [Order].orderID, [Order].quantity, [Order].customerID, [Order].status, Customer.name FROM Artist INNER JOIN Artwork ON Artist.artistID = @artistID INNER JOIN [Order] ON Artwork.artworkID = [Order].artworkID INNER JOIN Customer ON [Order].customerID = Customer.customerID WHERE ([Order].status = 'Delivered')">
                    <SelectParameters>
                        <asp:SessionParameter Name="artistID" SessionField="ArtistID" />
                    </SelectParameters>
                </asp:SqlDataSource>

                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                    <ItemTemplate>
                        <div class="profile-orderrow">
                            <tr style="border-style: solid none solid none; border-width: thin; font-weight: bold;">
                                <td style="text-align: left; height: 100px;">
                                    <asp:Label ID="lblcustname" runat="server" Text='<%# Eval("name")%>'></asp:Label>
                                </td>
                                <td style="text-align: right; height: 100px;">
                                    <asp:Label ID="lblorderid" runat="server" Text='<%# Eval("orderID")%>'></asp:Label>
                                </td>
                            </tr>
                        </div>
                        <div class="profile-orderrow">
                            <tr style="border-style: solid none solid none; border-width: thin; font-weight: bold;">
                                <td class="image">
                                    <asp:ImageButton ID="Image1" runat="server" ImageUrl='<%# Eval("image")%>' ImageAlign="Baseline" Width="100px" Height="100px" /></td>
                                <td style="text-align: center; height: 200px;"><%# Eval("artworkName")%></td>
                                <td style="text-align: center; height: 200px;"><%# Eval("quantity")%></td>
                                <td style="text-align: center; height: 200px;"><%# Eval("totalAmount")%></td>
                                <td style="text-align: center; height: 200px;">
                                    <asp:ImageButton ID="btnDelete" runat="server" ImageUrl="images/delete.png" ImageAlign="Baseline" Height="50px" Width="50px" />
                                </td>
                            </tr>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

                <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
                    <ItemTemplate>
                        <div class="profile-orderrow">
                            <asp:Label ID="lblcustname" runat="server" Text='<%# Eval("name")%>'></asp:Label>
                            <asp:Label ID="lblorderid" runat="server" Text='<%# Eval("orderID")%>'></asp:Label>
                                <asp:ImageButton ID="Image1" runat="server" ImageUrl='<%# Eval("image")%>' ImageAlign="Baseline" Width="100px" Height="100px" />
                                <div><%# Eval("artworkName")%></div>
                                <div><%# Eval("quantity")%></div>
                                <div><%# Eval("totalAmount")%></div>
                                <div><asp:ImageButton ID="btnDelete" runat="server" ImageUrl="images/delete.png" ImageAlign="Baseline" Height="50px" Width="50px" /></div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
</asp:Content>
