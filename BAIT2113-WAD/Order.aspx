<%@ Page Language="C#" MasterPageFile="~/Gallerion.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="BAIT2113_WAD.Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="StyleSheet1.css" />
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous"/>
    <%--<link href='https://fonts.googleapis.com/css?family=Ubuntu+Mono' rel='stylesheet' type='text/css'>--%>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet"/>

    <div class="gallery_container">
	<div class="heading" style="font-family:'Times New Roman', Times, serif">Product Information</div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [artworkDesc], [quantity], [price], [artistID] FROM [Artwork] WHERE ([artworkDesc] = @artworkDesc)">
            <SelectParameters>
                <asp:SessionParameter Name="artworkDesc" SessionField="artworkDesc" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        
       <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [artworkName] FROM [Artwork] WHERE ([artworkName] = @artworkName)">
           <SelectParameters>
               <asp:SessionParameter Name="artworkName" SessionField="artworkName" Type="String" />
           </SelectParameters>
        </asp:SqlDataSource>
        
        <div class="container" id="product-section">
            <div class="row">
                <div class="col-md-6">
                    <div class="row">
                        <div class="col-md-12">
                            <h1>
                                <asp:DetailsView ID="artworkName" runat="server" AutoGenerateRows="False" Height="50px" Width="250px" GridLines="None" style="font-family: 'Roboto'" DataSourceID="SqlDataSource2">
                                    <Fields>
                                        <asp:BoundField DataField="artworkName" HeaderText="artworkName" SortExpression="artworkName" />
                                    </Fields>
                                </asp:DetailsView>
                                 <svg width="2rem" height="2rem" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z"></path></svg>
                            </h1>
                        </div>
                    </div><!-- end row-->
                    <div class="row">
                        <div class="col-md-12">
                            <div class="details_view" style="border: 0px none #FFFFFF; background-color: #FFFFFF; font-family: 'Roboto'; font-size: large; font-weight: normal; font-style: italic; font-variant: normal;">
                                <asp:DetailsView ID="artworkDesc" runat="server" AutoGenerateRows="False" GridLines="None" Height="50px" Width="635px" CssClass="auto-style1" DataSourceID="SqlDataSource1">
                                    <Fields>
                                        <asp:BoundField DataField="artworkDesc" HeaderText="artworkDesc" SortExpression="artworkDesc" />
                                        <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />
                                        <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                                        <asp:BoundField DataField="artistID" HeaderText="artistID" SortExpression="artistID" />
                                    </Fields>
                                </asp:DetailsView>
                            </div>
                        </div>
                    </div><!-- end row -->
                    <%--<div class="row">
                        <div class="col-md-12">
                            <p class="description">
                                Classic film camera. Uses 620 roll film.
   Has a 2&frac14; x 3&frac14; inch image size.
                            </p>
                        </div>
                    </div><!-- end row -->--%>
                    <hr  style="border: 1px solid #000000"/>
                    <div class="row add-to-cart">
                        
                        <div class="col-md-5 product-qty">
                            <%-- <span class="btn btn-default btn-lg btn-qty">
                                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                            </span>--%>
                            <span style="font-family: 'Roboto'; font-size: 22px; font-weight: bold">Quantity:</span>
                            <input class="btn btn-default btn-lg btn-qty" type="number" id="quantity" name="quantity" min="1" max="100" style="padding: 5px" />
                            <%--<span class="btn btn-default btn-lg btn-qty">
                                <span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
                            </span>--%>
                        </div>
                         <div class="col-md-3">
                            <button class="view_more" style=" " onclick ="AddToWish_Click">
                                Add to Cart
                            </button>
                        </div>
                        <div class="col-md-3">
                            <button class="view_more" style=" ">
                                Buy Now</button>
                        </div>
                    </div><!-- end row -->
                </div>

                <div class="col-md-6">
                    <img src="https://onlinegallery.art/images/artworks/img-20200630-wa0006.jpg" alt="" class="image-responsive image-fluid" style="width: 100%; height: auto ; box-shadow: 0.3rem 0.4rem 0.4rem rgba(0, 0, 0, 0.4); border-radius: 0.75rem;"/><asp:HiddenField ID="HiddenField1" runat="server" Visible="False" />
&nbsp;</div>
            </div>
            <!-- end row -->
        </div><!-- end container -->
        
        <br />
        <div class="buttons">
        </div>
    <script src="https://code.jquery.com/jquery-2.2.2.min.js" integrity="sha256-36cp2Co+/62rEAAYHLmRCPIych47CvdM+uTBJwSzWjI=" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
    </div>
</asp:Content>
