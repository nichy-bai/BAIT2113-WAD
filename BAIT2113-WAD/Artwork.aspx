<%@ Page Language="C#" MasterPageFile="~/Gallerion.Master" AutoEventWireup="true" CodeBehind="Artwork.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

  <div class="gallery_container">
    
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
        <div class="image_container">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT image, artworkName, price FROM Artwork"></asp:SqlDataSource>
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <div class="gallery-item">
                        <img class="gallery-image" src='<%#Eval("image") %>' alt=""/>
                        <div class="overlay">
                            <div class="row">
                                <div class="details">
                                    <span><%#Eval("artworkName") %></span>
                                </div>
                                <div class="price"> $<%#Eval("price") %></div>
                            </div>
                            <div class="buttons">
                                <asp:Button ID="viewMore" runat="server" Text="View More" PostBackUrl="~/Order.aspx" CssClass="view_more" /> 
                                <%--<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />--%>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
	</div>
</div>
	<script src="JavaScript.js"></script>
    </form>
</asp:Content>
