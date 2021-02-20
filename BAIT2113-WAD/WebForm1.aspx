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
    <div class="side_menu">
        <div class="side_menu_title">Category</div>






    </div>
	<div class="gallery">
        
		<div class="gallery-item">
			<img class="gallery-image" src="https://images.unsplash.com/photo-1488190211105-8b0e65b80b4e?w=500&h=500&fit=crop" alt="person writing in a notebook beside by an iPad, laptop, printed photos, spectacles, and a cup of coffee on a saucer"/>
            <div class="overlay">
                <div class="row">
                    <div class="details">
                        <span>Headphone</span>
                        <p>Premium headphone</p>
                    </div>
                    <div class="price">$30</div>
                </div>
                <div class="buttons">
                    <button>Buy Now</button>
                    <button class="cart-btn">Add to Cart</button>
                </div>
            </div>
		</div>

		<div class="gallery-item">
			<img class="gallery-image" src="https://images.unsplash.com/photo-1515260268569-9271009adfdb?w=500&h=500&fit=crop" alt="sunset behind San Francisco city skyline"/>
			<div class="overlay">
                <div class="row">
                    <div class="details">
                        <span>Headphone</span>
                        <p>Premium headphone</p>
                    </div>
                    <div class="price">$30</div>
                </div>
                <div class="buttons">
                    <button>Buy Now</button>
                    <button class="cart-btn">Add to Cart</button>
                </div>
            </div>
		</div>

		<div class="gallery-item">
			<img class="gallery-image" src="https://images.unsplash.com/photo-1506045412240-22980140a405?w=500&h=500&fit=crop" alt="people holding umbrellas on a busy street at night lit by street lights and illuminated signs in Tokyo, Japan"/>
		    <div class="overlay">
                <div class="row">
                    <div class="details">
                        <span>Headphone</span>
                        <p>Premium headphone</p>
                    </div>
                    <div class="price">$30</div>
                </div>
                <div class="buttons">
                    <button>Buy Now</button>
                    <button class="cart-btn">Add to Cart</button>
                </div>
            </div>
		</div>

		<div class="gallery-item">
			<img class="gallery-image" src="https://images.unsplash.com/photo-1514041181368-bca62cceffcd?w=500&h=500&fit=crop" alt="car interior from central back seat position showing driver and blurred view through windscreen of a busy road at night"/>
		    <div class="overlay">
                <div class="row">
                    <div class="details">
                        <span>Headphone</span>
                        <p>Premium headphone</p>
                    </div>
                    <div class="price">$30</div>
                </div>
                <div class="buttons">
                    <button>Buy Now</button>
                    <button class="cart-btn">Add to Cart</button>
                </div>
            </div>
        </div>

		<div class="gallery-item">
			<img class="gallery-image" src="https://images.unsplash.com/photo-1445810694374-0a94739e4a03?w=500&h=500&fit=crop" alt="back view of woman wearing a backpack and beanie waiting to cross the road on a busy street at night in New York City, USA"/>
		    <div class="overlay">
                <div class="row">
                    <div class="details">
                        <span>Headphone</span>
                        <p>Premium headphone</p>
                    </div>
                    <div class="price">$30</div>
                </div>
                <div class="buttons">
                    <button>Buy Now</button>
                    <button class="cart-btn">Add to Cart</button>
                </div>
            </div>
        </div>

		<div class="gallery-item">
			<img class="gallery-image" src="https://images.unsplash.com/photo-1486334803289-1623f249dd1e?w=500&h=500&fit=crop" alt="man wearing a black jacket, white shirt, blue jeans, and brown boots, playing a white electric guitar while sitting on an amp"/>
            <div class="overlay">
                <div class="row">
                    <div class="details">
                        <span>Headphone</span>
                        <p>Premium headphone</p>
                    </div>
                    <div class="price">$30</div>
                </div>
                <div class="buttons">
                    <button>Buy Now</button>
                    <button class="cart-btn">Add to Cart</button>
                </div>
            </div>
        </div>


	</div>

</div>
	<script src="JavaScript.js"></script>
    </form>
</body>
</html>
