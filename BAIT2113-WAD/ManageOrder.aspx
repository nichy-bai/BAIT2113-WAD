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

            <a href="ArtistProfile.aspx" class="profile-btn">Artist Profile</a>
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [OrderDetails].quantity, Customer.name, Artwork.image, Artwork.artworkName, Artwork.artworkID, Customer.customerID, [Order].orderID, [Order].status, [Order].Logistics, [Order].referencesNo, [Order].dateOrder, OrderDetails.subtotal FROM [Order] INNER JOIN Customer ON [Order].customerID = Customer.customerID INNER JOIN OrderDetails ON [Order].orderID = OrderDetails.OrderID INNER JOIN Artist INNER JOIN Artwork ON Artist.artistID = Artwork.artistID ON OrderDetails.artworkID = Artwork.artworkID WHERE ([Order].status = 'Pending') AND (Artwork.artistID = @artistID)" UpdateCommand="UPDATE [Order] SET [referencesNo] = @reference, [status] = 'Shipped Out', [dateDelivered] = @date WHERE [orderID] = @orderID">
                    <SelectParameters>
                        <asp:SessionParameter Name="artistID" SessionField="ArtistID" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="reference" Type="String" />
                        <asp:Parameter Name="date" Type="DateTime" />
                        <asp:Parameter Name="orderID" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Artwork.artworkName, Artwork.image, [OrderDetails].quantity, Customer.name, Customer.customerID, [Order].orderID, [Order].status, [Order].Logistics, [Order].referencesNo, [Order].dateDelivered, OrderDetails.subtotal, Artwork.artworkID FROM [Order] INNER JOIN Customer ON [Order].customerID = Customer.customerID INNER JOIN OrderDetails ON [Order].orderID = OrderDetails.OrderID INNER JOIN Artist INNER JOIN Artwork ON Artist.artistID = Artwork.artistID ON OrderDetails.artworkID = Artwork.artworkID WHERE ([Order].status = 'Shipped Out') AND (Artwork.artistID = @artistID)">
                    <SelectParameters>
                        <asp:SessionParameter Name="artistID" SessionField="ArtistID" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" HorizontalAlign="Center" RepeatColumns="1" CssClass="profile-orderrow" CellPadding="2" CellSpacing="15" ShowFooter="False" ShowHeader="False" OnItemCommand="DataList1_ItemCommand" >
                    <ItemTemplate>
                        <table style="width:100%; border-bottom: none; border-collapse: collapse;">
                            <tr style="width:100%; background-color:lightgrey;">
                                <td style="text-align:left" colspan="6">
                                    <asp:Label ID="lblcus" runat="server" Text='<%# Eval("customerID") +" "+ Eval("name") %>'></asp:Label></td>
                                   <td style="text-align:right" colspan="2"><asp:Label ID="lblord" runat="server" Text="Order ID:"></asp:Label> <asp:Label ID="lblorder" runat="server" Text='<%# Eval("orderID") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr style="width:100%">
                                <td style="width:100px; height:100px">
                                    <asp:Image ID="product" runat="server" ImageUrl='<%# Eval("image") %>' Height="200px" Width="200px"/>
                                </td>
                                <td style="text-align:left; width:200px">
                                    <asp:Label ID="lblartid" runat="server" Text='<%# Eval("artworkID") %>'></asp:Label><p></p>
                                    <asp:Label ID="lblart" runat="server" Text='<%# Eval("artworkName") %>'></asp:Label>
                                </td>
                                <td style="width:50px">
                                    <asp:Label ID="lblqty" runat="server" Text='<%# Eval("quantity") %>'></asp:Label>
                                    <asp:Label ID="Label2" runat="server" Text="x"></asp:Label>
                                </td>
                                <td style="width:50px">
                                    <asp:Label ID="Label3" runat="server" Text="$"></asp:Label>
                                    <asp:Label ID="lblamt" runat="server" Text='<%# Eval("subtotal") %>'></asp:Label>
                                </td>
                                <td style="width:200px">
                                    <asp:Label ID="lblstatus" runat="server" Text='<%# Eval("status") %>'></asp:Label><p>
                                    <asp:Label ID="lblremind" runat="server" Text=""></asp:Label>
                                </td>
                                <td style="width:100px">
                                    <asp:Label ID="lbllgt" runat="server" Text='<%# Eval("Logistics") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtref" runat="server" placeholder="Reference Number"></asp:TextBox><p>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtref" ValidationGroup="ref" ErrorMessage="Reference Number is required" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:Label ID="errref" runat="server" Text="" ForeColor="Red"></asp:Label>
                                    <asp:Button ID="btnsubmit" runat="server" Text="Update" CommandName="reference" ValidationGroup="ref" Width="100px" Height="30px" BackColor="Black" ForeColor="White" BorderStyle="None" />
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
                <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource2" HorizontalAlign="Center" RepeatColumns="1" CssClass="profile-orderrow" CellPadding="2" CellSpacing="15" ShowFooter="False" ShowHeader="False">
                    <ItemTemplate>
                        <table style="width:100%; border-bottom: none; border-collapse: collapse;">
                            <tr style="width:100%; background-color:lightgrey">
                                <td style="text-align:left" colspan="6">
                                    <asp:Label ID="lblcus" runat="server" Text='<%# Eval("customerID") +" "+ Eval("name") %>'></asp:Label></td>
                                   <td style="text-align:right" colspan="2"><asp:Label ID="lblord" runat="server" Text="Order ID:"></asp:Label>  <asp:Label ID="lblorder" runat="server" Text='<%# Eval("orderID") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr style="width:100%">
                                <td style="width:100px; height:100px">
                                    <asp:Image ID="product" runat="server" ImageUrl='<%# Eval("image") %>' Height="200px" Width="200px"/>
                                </td>
                                <td style="text-align:left; width:180px">
                                    <asp:Label ID="lblartid" runat="server" Text='<%# Eval("artworkID") %>'></asp:Label><p></p>
                                    <asp:Label ID="lblart" runat="server" Text='<%# Eval("artworkName") %>'></asp:Label>
                                </td>
                                <td style="width:50px">
                                    <asp:Label ID="lblqty" runat="server" Text='<%# Eval("quantity") %>'></asp:Label>
                                    <asp:Label ID="Label2" runat="server" Text="x"></asp:Label>
                                </td>
                                <td style="width:70px">
                                    <asp:Label ID="Label3" runat="server" Text="$"></asp:Label>
                                    <asp:Label ID="lblamt" runat="server" Text='<%# Eval("subtotal") %>'></asp:Label>
                                </td>
                                <td style="width:200px">
                                    <asp:Label ID="lblstatus" runat="server" Text='<%# Eval("status") %>'></asp:Label>

                                </td>
                                <td>
                                    <asp:Label ID="lbllgt" runat="server" Text='<%# Eval("Logistics") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Labeldel" runat="server" Text='<%# (String.IsNullOrEmpty(Eval("dateDelivered").ToString()))
    ? "No Date Available" : Eval("dateDelivered", "{0:d}") %>'></asp:Label>

                                    </td>
                                <td>
                                    <asp:Label ID="Labelref" runat="server" Text='<%# Eval("referencesNo") %>'></asp:Label>

                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>
    </div>
</asp:Content>

