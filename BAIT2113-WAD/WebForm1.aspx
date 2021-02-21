<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="BAIT2113_WAD.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta charset="UTF-8"/>
    <title></title>
    <link rel="stylesheet" href="StyleSheet1.css" />
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
    <form id="form1" runat="server">
  <div class="container">
    
	<div class="heading">Art Gallery </div>
    <div class="cart-nav">
            <div class="icon">
                <i class="fas fa-shopping-cart"></i>
                <span>Cart</span>
            </div>
            <div class="item-count">0</div>
    </div>
    
	<div class="gallery">
        <div class="side_menu">
            <div class="side_menu_content">
                <hr />
                <div class="side_menu_title">Category</div>
                <div>
                    <ul class="category">
                        <li class="category_item"><a href="#">Painting</a></li>
                        <li class="category_item"><a href="#">Photography</a></li>
                        <li class="category_item"><a href="#">Design</a></li>
                        <li class="category_item"><a href="#">Sculpture</a></li>
                        <li class="category_item"><a href="#">Textile</a></li>
                        <li class="category_item"><a href="#">Illustration</a></li>
                    </ul>
                </div>
                <hr />
            </div>
        </div>
        <div class="gallery_container">
            <div class="gallery-item">
                <img class="gallery-image" src="https://onlinegallery.art/images/artworks/img-20200630-wa0006.jpg" alt="" />
                <div class="overlay">
                    <div class="row">
                        <div class="details">
                            <span>Wooden Vajra</span>
                            <p><b>Artist</b> - Nir Karmazin</p>
                        </div>
                        <div class="price">RM 1,938</div>
                    </div>
                    <div class="buttons">
                        <asp:Button ID="buyNow" runat="server" Text="Button" />
                        <asp:Button ID="addToCart" runat="server" Text="Button" />
                        <%--<button>Buy Now</button>
                        <button class="cart-btn">Add to Cart</button>--%>
                    </div>
                </div>
            </div>

           <%-- <div class="gallery-item">
                <img class="gallery-image" src="https://onlinegallery.art/images/artworks/john-ryland-bw-16-1000x.jpg" alt="" />
                <div class="overlay">
                    <div class="row">
                        <div class="details">
                            <span>John Rylands 03</span>
                            <p><b>Artist</b> - Oscar de Wit</p>
                        </div>
                        <div class="price">RM 5,628</div>
                    </div>
                    <div class="buttons">
                        <button>Buy Now</button>
                        <button class="cart-btn">Add to Cart</button>
                    </div>
                </div>
            </div>

            <div class="gallery-item">
                <img class="gallery-image" src="https://onlinegallery.art/images/artworks/50126c0a-4c69-4f40-ae1b-f91f88eda0ce.jpeg" alt="" />
                <div class="overlay">
                    <div class="row">
                        <div class="details">
                            <span>Nipple #7</span>
                            <p><b>Artist</b> - Ruben van der Meer</p>
                        </div>
                        <div class="price">RM 465</div>
                    </div>
                    <div class="buttons">
                        <button>Buy Now</button>
                        <button class="cart-btn">Add to Cart</button>
                    </div>
                </div>
            </div>

            <div class="gallery-item">
                <img class="gallery-image" src="https://images.unsplash.com/photo-1506045412240-22980140a405?w=500&h=500&fit=crop" alt="" />
                <div class="overlay">
                    <div class="row">
                        <div class="details">
                            <span>Japan Night Street</span>
                            <p><b>Artist</b> - Akamine Kazuo</p>
                        </div>
                        <div class="price">RM 369</div>
                    </div>
                    <div class="buttons">
                        <button>Buy Now</button>
                        <button class="cart-btn">Add to Cart</button>
                    </div>
                </div>
            </div>

            <div class="gallery-item">
                <img class="gallery-image" src="https://onlinegallery.art/images/artworks/missing-remains-2017.jpg" alt="" />
                <div class="overlay">
                    <div class="row">
                        <div class="details">
                            <span>Missing remains 2017</span>
                            <p><b>Artist</b> - Jak Beemsterboer</p>
                        </div>
                        <div class="price">RM 1,246</div>
                    </div>
                    <div class="buttons">
                        <button>Buy Now</button>
                        <button class="cart-btn">Add to Cart</button>
                    </div>
                </div>
            </div>

            <div class="gallery-item">
                <img class="gallery-image" src="https://onlinegallery.art/images/artworks/b3cd878f-a575-49ec-84bc-0c0504ce1f07.jpeg" alt="" />
                <div class="overlay">
                    <div class="row">
                        <div class="details">
                            <span>African Male Lion</span>
                            <p><b>Artist</b> - Matthew Tyree</p>
                        </div>
                        <div class="price">RM 10,097</div>
                    </div>
                    <div class="buttons">
                        <button>Buy Now</button>
                        <button class="cart-btn">Add to Cart</button>
                    </div>
                </div>
            </div>--%>
        </div>

	</div>

</div>
	<script src="JavaScript.js"></script>
    </form>
</body>
</html>
