<%@ Page Title="" Language="C#" MasterPageFile="~/Gallerion.Master" AutoEventWireup="true" CodeBehind="ManageOrder.aspx.cs" Inherits="BAIT2113_WAD.ManageOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Order].orderID, [Order].quantity, [Order].totalAmount, Customer.name, [Order].customerID, Artwork.image, Artwork.artworkName, Artwork.artworkID, [Order].status, [Order].Logistics, [Order].referencesNo, [Order].dateOrder FROM Artist INNER JOIN Artwork ON Artist.artistID = Artwork.artistID INNER JOIN [Order] ON Artwork.artworkID = [Order].artworkID INNER JOIN Customer ON [Order].customerID = Customer.customerID WHERE ([Order].status = 'Pending' AND Artwork.artistID = @artistID)" UpdateCommand="UPDATE [Order] SET [referencesNo] = @reference, [status] = 'Shipped Out', [dateDelivered] = @date WHERE [orderID] = @orderID">
                    <SelectParameters>
                        <asp:SessionParameter Name="artistID" SessionField="ArtistID" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="reference" Type="String" />
                        <asp:Parameter Name="date" Type="DateTime" />
                        <asp:Parameter Name="orderID" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Artwork.artworkName, Artwork.image, [Order].totalAmount, [Order].orderID, [Order].quantity, [Order].customerID, [Order].status, Customer.name, [Order].Logistics, [Order].referencesNo, [Order].dateDelivered, [Order].artworkID, Customer.customerID AS Expr1 FROM Artist INNER JOIN Artwork ON Artist.artistID = Artwork.artistID INNER JOIN [Order] ON Artwork.artworkID = [Order].artworkID INNER JOIN Customer ON [Order].customerID = Customer.customerID WHERE ([Order].status = 'Shipped Out' AND Artwork.artistID = @artistID)">
                    <SelectParameters>
                        <asp:SessionParameter Name="artistID" SessionField="ArtistID" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" HorizontalAlign="Center" RepeatColumns="1" CssClass="profile-orderrow" CellPadding="2" CellSpacing="15" ShowFooter="False" ShowHeader="False" OnItemCommand="DataList1_ItemCommand"  >
                    <ItemTemplate>
                        <table style="width:100%; border:solid">
                            <tr style="width:100%; background-color:lightgrey">
                                <td style="text-align:left" colspan="6">
                                    <asp:Label ID="lblcus" runat="server" Text='<%# Eval("customerID") +" "+ Eval("name") %>'></asp:Label></td>
                                   <td style="text-align:right"> <asp:Label ID="lblorder" runat="server" Text='<%# Eval("orderID") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr style="width:100%">
                                <td style="width:100px; height:100px">
                                    <asp:Image ID="product" runat="server" ImageUrl='<%# Eval("image") %>' Height="100px" Width="100px"/>
                                </td>
                                <td style="text-align:left; width:200px">
                                    <asp:Label ID="lblartid" runat="server" Text='<%# Eval("artworkID") %>'></asp:Label><p></p>
                                    <asp:Label ID="lblart" runat="server" Text='<%# Eval("artworkName") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblqty" runat="server" Text='<%# Eval("quantity") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblamt" runat="server" Text='<%# Eval("totalAmount") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblstatus" runat="server" Text='<%# Eval("status") %>'></asp:Label><p>
                                    <asp:Label ID="lblremind" runat="server" Text=""></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lbllgt" runat="server" Text='<%# Eval("Logistics") %>'></asp:Label>
                                </td>
                                <td>
                                <asp:TextBox ID="txtref" runat="server"></asp:TextBox><p>
                           <asp:Label ID="errref" runat="server" Text="" ForeColor="Red"></asp:Label>
                                    </td>
                                <td>
                                    <asp:Button ID="btnsubmit" runat="server" Text="Button" CommandName="reference" />
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" CssClass="profile-orderrow" GridLines="None">
                    <Columns>
                        <asp:TemplateField HeaderText="Customer">
                            <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval("customerID")%>'></asp:Label><p>
                            <asp:Label runat="server" Text='<%# Eval("name")%>'></asp:Label>
                            </ItemTemplate>
                            </asp:TemplateField>
                        <asp:TemplateField HeaderText="Artwork">
                            <ItemTemplate>
                                <table>
                                    <tr>
                                        <td>
                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("image")%>' Height="100px" Width="100px" /></td>
                                   <td> <asp:Label ID="Label1" runat="server" Text='<%# "Order ID:" + Eval("orderID")%>'></asp:Label><p>
                                       <asp:Label runat="server" Text='<%# "Artwork ID:" + Eval("artworkID")%>'></asp:Label><p>
                            <asp:Label runat="server" Text='<%# Eval("artworkName")%>'></asp:Label></td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                            </asp:TemplateField>
                        <asp:BoundField DataField="quantity" HeaderText="Qty" SortExpression="quantity" ItemStyle-Width="100px"/>
                        <asp:BoundField DataField="totalAmount" HeaderText="totalAmount" SortExpression="totalAmount" ItemStyle-Width="100px"/>
                        <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" ItemStyle-Width="200px"/>
                        <asp:BoundField DataField="Logistics" HeaderText="Logistics" SortExpression="Logistics" ItemStyle-Width="200px"/>
                        <asp:BoundField DataField="referencesNo" HeaderText="referencesNo" SortExpression="referencesNo" ItemStyle-Width="200px"/>
                        <asp:BoundField DataField="dateDelivered" HeaderText="dateDelivered" SortExpression="dateDelivered" ItemStyle-Width="200px"/>

                        </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>

