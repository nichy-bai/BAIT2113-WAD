<%@ Page Language="C#" MasterPageFile="~/Gallerion.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="BAIT2113_WAD.Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="styleArtwork.css" />
    <%--<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous" />
    <link href='https://fonts.googleapis.com/css?family=Ubuntu+Mono' rel='stylesheet' type='text/css'>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet" />--%>

    <div class="order-body-col">
        <div class="order-title">Product Information</div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT artworkName FROM Artwork WHERE (artworkID = @artworkID)">
            <SelectParameters>
                <asp:SessionParameter Name="artworkID" SessionField="artworkID" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Artwork.artworkDesc, Artwork.quantity, Artwork.price, Artist.name FROM Artwork INNER JOIN Artist ON Artwork.artistID = Artist.artistID WHERE (Artwork.artworkID = @artworkID)">
            <SelectParameters>
                <asp:SessionParameter Name="artworkID" SessionField="artworkID" />
            </SelectParameters>
        </asp:SqlDataSource>

        <div id="product-section">
            <div class="order-body-row">
                <div class="order-detail-col">
                    <div class="order-detail-row" style="border-bottom: solid 2px black; width: 100%;">
                        <div class="order-detail-title">
                            <asp:DetailsView ID="artworkName" runat="server" AutoGenerateRows="False" GridLines="None" DataSourceID="SqlDataSource1">
                                <Fields>
                                    <asp:BoundField DataField="artworkName" SortExpression="artworkName" />
                                </Fields>
                            </asp:DetailsView>
                        </div>
                        <div>
                            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="AddToWishlist_Click"><svg class="order-fav-btn" width="2.5rem" height="2.5rem" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z"></path></svg></asp:LinkButton>
                        </div>
                    </div>
                    <hr />
                    <div class="order-details-view">
                        <asp:DetailsView ID="orderDetails" runat="server" AutoGenerateRows="False" GridLines="None" Height="100%" Width="100%" DataSourceID="SqlDataSource2">
                            <Fields>
                                <asp:BoundField DataField="artworkDesc" HeaderText="Description &nbsp;&nbsp;&nbsp;" SortExpression="artworkDesc" />
                                <asp:BoundField DataField="name" HeaderText="Artist" SortExpression="name" />
                                <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" />
                                <asp:BoundField DataField="quantity" HeaderText="Stock" SortExpression="quantity" />
                            </Fields>
                        </asp:DetailsView>
                    </div>
                    <div class="order-detail-row">
                        <div class="">
                            <span style="font-family: 'Roboto'; font-size: 18px; margin-right: 10px;">Quantity:</span>
                            <asp:Button ID="btnMinusClick" runat="server" Text="-" class="" OnClick="btnMinus_Click" Width="45px" Height="45px" CssClass="order-qty-btn" />
                            <asp:TextBox ID="txtQuantity" runat="server" class="" Text="0" Width="60px" Height="45px" CssClass="order-qty-box"></asp:TextBox>
                            <asp:Button ID="btnAddClick" runat="server" Text="+" class="" OnClick="btnAdd_Click"  Width="45px" Height="45px" CssClass="order-qty-btn" />
                        </div>
                    </div>
                    <div class="order-detail-row">
                        <div class="">
                            <asp:Button ID="Button5" runat="server" Text="Add to Cart" OnClick="btnAddToCart_Click" class="view_more" CssClass="order-add-btn" />
                        </div>
                        <div class="">
                            <asp:Button ID="Button6" runat="server" Text="Buy Now" class="view_more" CssClass="order-buy-btn" OnClick="buyNow_Click" />

                        </div>
                    </div>
                    <div>
                        <asp:Label ID="errLabel" runat="server" Text=""></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="The quantity text field cannot be blank." ControlToValidate="txtQuantity">*The quantity text field cannot be blank.</asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="order-image">
                    <asp:Repeater ID="Repeater1" DataSourceID="SqlDataSource3" runat="server">
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("image") %>' CssClass="gallery-image" />
                        </ItemTemplate>
                    </asp:Repeater>
                    &nbsp;
                </div>
            </div>
            <!-- end row -->
        </div>
        <!-- end container -->

        <br />
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT image FROM Artwork WHERE( artworkID= @artworkID)">
            <SelectParameters>
                <asp:SessionParameter Name="artworkID" SessionField="artworkID" />
            </SelectParameters>
        </asp:SqlDataSource>
        <div class="buttons">
        </div>
        <script src="https://code.jquery.com/jquery-2.2.2.min.js" integrity="sha256-36cp2Co+/62rEAAYHLmRCPIych47CvdM+uTBJwSzWjI=" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
    </div>
</asp:Content>
