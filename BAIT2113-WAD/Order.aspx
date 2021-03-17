<%@ Page Language="C#" MasterPageFile="~/Gallerion.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="BAIT2113_WAD.Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="StyleSheet1.css" />
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous" />
    <%--<link href='https://fonts.googleapis.com/css?family=Ubuntu+Mono' rel='stylesheet' type='text/css'>--%>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet" />

    <div class="gallery_container">
        <div class="heading" style="font-family: 'Times New Roman', Times, serif">Product Information</div>
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

        <div class="container" id="product-section">
            <div class="row">
                <div class="col-md-6">
                    <div class="row">
                        <div class="col-md-12">
                            <h1>
                                <asp:DetailsView ID="artworkName" runat="server" AutoGenerateRows="False" Height="50px" Width="250px" GridLines="None" Style="font-family: 'Roboto'" DataSourceID="SqlDataSource1">
                                    <Fields>
                                        <asp:BoundField DataField="artworkName" SortExpression="artworkName" />
                                    </Fields>
                                </asp:DetailsView>
                                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click"><svg width="2rem" height="2rem" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z"></path></svg></asp:LinkButton>
                            </h1>
                        </div>
                    </div>
                    <!-- end row-->
                    <div class="row">
                        <div class="col-md-12">
                            <div class="details_view" style="border: 0px none #FFFFFF; background-color: #FFFFFF; font-family: 'Roboto'; font-size: large; font-weight: normal; font-style: italic; font-variant: normal;">
                                <asp:DetailsView ID="orderDetails" runat="server" AutoGenerateRows="False" GridLines="None" Height="50px" Width="635px" CssClass="auto-style1" DataSourceID="SqlDataSource2">
                                    <Fields>
                                        <asp:BoundField DataField="artworkDesc" HeaderText="artworkDesc" SortExpression="artworkDesc" />
                                        <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />
                                        <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                                        <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                                    </Fields>
                                </asp:DetailsView>
                            </div>
                        </div>
                    </div>
                    <!-- end row -->
                    <%--<div class="row">
                        <div class="col-md-12">
                            <p class="description">
                                Classic film camera. Uses 620 roll film.
   Has a 2&frac14; x 3&frac14; inch image size.
                            </p>
                        </div>
                    </div><!-- end row -->--%>
                    <hr style="border: 1px solid #000000" />
                    <div class="row add-to-cart">

                        <div class="col-md-5 product-qty">
                            <%-- <span class="btn btn-default btn-lg btn-qty">
                                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                            </span>--%>
                            <span style="font-family: 'Roboto'; font-size: 22px; font-weight: bold">Quantity:</span>
                            <%--<input class="btn btn-default btn-lg btn-qty" type="number" id="quantity" name="quantity" min="1" max="100" style="padding: 5px" />--%>
                            <%--<span class="btn btn-default btn-lg btn-qty">
                                <span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
                            </span>--%>
                            <asp:Button ID="btnMinusClick" runat="server" Text="-" class="btn btn-default btn-lg btn-qty" OnClick="btnMinusClick_Click"/>
                            <asp:TextBox ID="txtQuantity" runat="server" class="btn btn-default btn-lg btn-qty"></asp:TextBox>
                            <asp:Button ID="btnAddClick" runat="server" Text="+" class="btn btn-default btn-lg btn-qty" OnClick="btnAddClick_Click"/>
                        </div>
                        <div class="col-md-3">
                            <%--<button class="view_more" style="">
                                Add to Cart
                            </button>--%>
                            <asp:Button ID="Button2" runat="server" Text="Add to Cart" OnClick="Button1_Click" class="view_more" style="margin-left: 50px"/>
                        </div>
                        <div class="col-md-3">
                            <%--<button class="view_more" style="">
                                Buy Now</button>--%>

                            <asp:Button ID="Button3" runat="server" Text="Buy Now" class="view_more" style="margin-left: 50px" />

                        </div>
                    </div>
                    <!-- end row -->
                </div>

                <div class="col-md-6">
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
