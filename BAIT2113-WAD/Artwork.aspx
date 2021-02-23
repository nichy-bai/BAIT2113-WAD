<%@ Page Language="C#" MasterPageFile="~/Gallerion.Master" AutoEventWireup="true" CodeBehind="Artwork.aspx.cs" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void viewMore_Click(object sender, EventArgs e)
    {

    }
</script>






<<<<<<< Updated upstream



=======
>>>>>>> Stashed changes
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Artwork]"></asp:SqlDataSource>
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1"  >
                <ItemTemplate>
                    <div class="gallery-item">
                       <asp:Image ID="Image1" runat="server" ImageURL='<%#Eval("image") %>' />
                        <div class="overlay">
                            <div class="row">
                                <div class="details">
                                    <span><asp:Label ID="Label1" runat="server" Text='<%#Eval("artworkName") %>'></asp:Label></span>
                                </div>
                                <div class="price">$
                                    <asp:Label ID="Label2" runat="server" Text='<%#Eval("price") %>'></asp:Label> </div>
                                
                            </div>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("artworkID") %>' ></asp:Label>
                            <div class="buttons">
                                <asp:Button ID="viewMore" runat="server" OnClick="viewMore_Click" Text="View More" CssClass="view_more" PostBackUrl="~/Order.aspx" CommandArgument='<%# Eval("artworkID") %>' />
                                <asp:HiddenField ID="artworkID" runat="server" Value = '<%# Eval("artworkID") %>' />
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
