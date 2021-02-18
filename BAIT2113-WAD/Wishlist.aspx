<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wishlist.aspx.cs" Inherits="BAIT2113_WAD.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

<style>

html {
  background-image: url('background_image.png');
  background-repeat: no-repeat;
  background-size: 100% 100%;
  background-attachment: fixed;
}

.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  max-width: 300px;
  text-align: center;
  margin:auto;
  font-family: arial;
  background-color:whitesmoke;
}

.price {
  color: grey;
  font-size: 22px;
}

.card button {
  border: none;
  outline: 0;
  padding: 12px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
  font-size: 18px;
}

.card button:hover {
  opacity: 0.7;
}


</style>
</head>
<body>

    <form id="form1" runat="server">

<div style="margin-top:10%;display:flex">
<div class="card" style="margin-left:5%">
  <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/image01.jpg" />
  <h1>Tailored Jeans
    </h1>
  <p class="price">$19.99</p>
  <p>Some text about the jeans. Super slim and comfy lorem ipsum lorem jeansum. Lorem jeamsun denim lorem jeansum.</p>
  <p><button>Add to Cart</button></p>
</div>

<div class="card">
  <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/image01.jpg" />
  <h1>Tailored Jeans
    </h1>
  <p class="price">$19.99</p>
  <p>Some text about the jeans. Super slim and comfy lorem ipsum lorem jeansum. Lorem jeamsun denim lorem jeansum.</p>
  <p><button>Add to Cart</button></p>
</div>

    <div class="card">
  <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/image01.jpg" />
  <h1>Tailored Jeans
    </h1>
  <p class="price">$19.99</p>
  <p>Some text about the jeans. Super slim and comfy lorem ipsum lorem jeansum. Lorem jeamsun denim lorem jeansum.</p>
  <p><button>Add to Cart</button></p>
</div>

     <div class="card">
  <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/image01.jpg" />
  <h1>Tailored Jeans
    </h1>
  <p class="price">$19.99</p>
  <p>Some text about the jeans. Super slim and comfy lorem ipsum lorem jeansum. Lorem jeamsun denim lorem jeansum.</p>
  <p><button>Add to Cart</button></p>
</div>
    </div>
    <div style="margin-top:10%;display:flex">
<div class="card" style="margin-left:5%">
  <asp:ImageButton ID="ImageButton5" runat="server" ImageUrl="~/image01.jpg" />
  <h1>Tailored Jeans
    </h1>
  <p class="price">$19.99</p>
  <p>Some text about the jeans. Super slim and comfy lorem ipsum lorem jeansum. Lorem jeamsun denim lorem jeansum.</p>
  <p><button>Add to Cart</button></p>
</div>

<div class="card">
  <asp:ImageButton ID="ImageButton6" runat="server" ImageUrl="~/image01.jpg" />
  <h1>Tailored Jeans
    </h1>
  <p class="price">$19.99</p>
  <p>Some text about the jeans. Super slim and comfy lorem ipsum lorem jeansum. Lorem jeamsun denim lorem jeansum.</p>
  <p><button>Add to Cart</button></p>
</div>

    <div class="card">
  <asp:ImageButton ID="ImageButton7" runat="server" ImageUrl="~/image01.jpg" />
  <h1>Tailored Jeans
    </h1>
  <p class="price">$19.99</p>
  <p>Some text about the jeans. Super slim and comfy lorem ipsum lorem jeansum. Lorem jeamsun denim lorem jeansum.</p>
  <p><button>Add to Cart</button></p>
</div>

     <div class="card">
  <asp:ImageButton ID="ImageButton8" runat="server" ImageUrl="~/image01.jpg" />
  <h1>Tailored Jeans
    </h1>
  <p class="price">$19.99</p>
  <p>Some text about the jeans. Super slim and comfy lorem ipsum lorem jeansum. Lorem jeamsun denim lorem jeansum.</p>
  <p><button>Add to Cart</button></p>
</div>
    </div>

  <div style="margin-top:10%;display:flex">
<div class="card" style="margin-left:5%">
  <asp:ImageButton ID="ImageButton9" runat="server" ImageUrl="~/image01.jpg" />
  <h1>Tailored Jeans
    </h1>
  <p class="price">$19.99</p>
  <p>Some text about the jeans. Super slim and comfy lorem ipsum lorem jeansum. Lorem jeamsun denim lorem jeansum.</p>
  <p><button>Add to Cart</button></p>
</div>

<div class="card">
  <asp:ImageButton ID="ImageButton10" runat="server" ImageUrl="~/image01.jpg" />
  <h1>Tailored Jeans
    </h1>
  <p class="price">$19.99</p>
  <p>Some text about the jeans. Super slim and comfy lorem ipsum lorem jeansum. Lorem jeamsun denim lorem jeansum.</p>
  <p><button>Add to Cart</button></p>
</div>

    <div class="card">
  <asp:ImageButton ID="ImageButton11" runat="server" ImageUrl="~/image01.jpg" />
  <h1>Tailored Jeans
    </h1>
  <p class="price">$19.99</p>
  <p>Some text about the jeans. Super slim and comfy lorem ipsum lorem jeansum. Lorem jeamsun denim lorem jeansum.</p>
  <p><button>Add to Cart</button></p>
</div>

     <div class="card">
  <asp:ImageButton ID="ImageButton12" runat="server" ImageUrl="~/image01.jpg" />
  <h1>Tailored Jeans
    </h1>
  <p class="price">$19.99</p>
  <p>Some text about the jeans. Super slim and comfy lorem ipsum lorem jeansum. Lorem jeamsun denim lorem jeansum.</p>
  <p><button>Add to Cart</button></p>
</div>
    </div>
    </form>
</body>
</html>
