<%@ Page Language="C#" MasterPageFile="~/Gallerion.Master" AutoEventWireup="true" CodeBehind="Artwork.aspx.cs" %>

<script runat="server">

    protected void viewMore_Click(object sender, EventArgs e)
    {
        Button InkRowSelection = (Button)sender;
        //get the recipe id from command argument to link button
        string ArtworkID = InkRowSelection.CommandArgument.ToString();
        Session.Add("artworkID", ArtworkID);
        //Session("artworkID") = ArtworkID;
        Response.Redirect("~/Order.aspx");
    }
</script>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="styleArtwork.css" rel="stylesheet" />

  <div class="gallery_container">

	<div class="heading">Art Gallery </div>
    <div class="cart-nav"><a href="AddToCart.aspx">
            <div class="icon">
                <svg width="2rem" height="2rem" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z"></path></svg>

            </div>
            <%--<div class="item-count">0</div>--%>
    </a></div>

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
        <div class="image_container">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM Artwork"></asp:SqlDataSource>
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <div class="gallery-item">
                       <asp:Image ID="Image1" runat="server" ImageURL='<%#Eval("image") %>' CssClass="gallery-image" />
                        <div class="overlay">
                            <div class="row">
                                <div class="details">
                                    <span><%#Eval("artworkName") %></span>
                                </div>
                                <div class="price"> $ <%#Eval("price") %></div>
                            </div>
                            <div class="buttons">
                                <asp:Button ID="viewMore" runat="server" Text="View More" CssClass="view_more" OnClick="viewMore_Click" CommandArgument='<%# Eval("artworkID") %>'/>
                                <%--<asp:Button ID="Button1" runat="server" Text="Button" />--%>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
	</div>
</div>
	<script src="JavaScript.js"></script>
</asp:Content>
