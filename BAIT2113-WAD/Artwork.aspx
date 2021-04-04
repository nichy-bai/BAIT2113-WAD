<%@ Page Language="C#" MasterPageFile="~/Gallerion.Master" AutoEventWireup="true" CodeBehind="Artwork.aspx.cs" %>

<script runat="server">

    protected void viewMore_Click(object sender, EventArgs e)
    {
        Button InkRowSelection = (Button)sender;
        //get the recipe id from command argument to link button
        string artworkID = InkRowSelection.CommandArgument.ToString();
        Session.Add("ArtworkID", artworkID);
        //Session("artworkID") = ArtworkID;
        Response.Redirect("~/Order.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Button1.ForeColor = System.Drawing.Color.White;
        Button1.BackColor = System.Drawing.Color.Black;
        Button2.ForeColor = System.Drawing.Color.Black;
        Button2.BackColor = System.Drawing.Color.White;
        Button3.ForeColor = System.Drawing.Color.Black;
        Button3.BackColor = System.Drawing.Color.White;
        Button4.ForeColor = System.Drawing.Color.Black;
        Button4.BackColor = System.Drawing.Color.White;
        Button5.ForeColor = System.Drawing.Color.Black;
        Button5.BackColor = System.Drawing.Color.White;
        Button6.ForeColor = System.Drawing.Color.Black;
        Button6.BackColor = System.Drawing.Color.White;
        this.Repeater1.Visible = true;
        this.Repeater2.Visible = false;
        this.Repeater3.Visible = false;
        this.Repeater4.Visible = false;
        this.Repeater5.Visible = false;
        this.Repeater6.Visible = false;
        this.Repeater1.DataBind();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Button1.ForeColor = System.Drawing.Color.Black;
        Button1.BackColor = System.Drawing.Color.White;
        Button2.ForeColor = System.Drawing.Color.White;
        Button2.BackColor = System.Drawing.Color.Black;
        Button3.ForeColor = System.Drawing.Color.Black;
        Button3.BackColor = System.Drawing.Color.White;
        Button4.ForeColor = System.Drawing.Color.Black;
        Button4.BackColor = System.Drawing.Color.White;
        Button5.ForeColor = System.Drawing.Color.Black;
        Button5.BackColor = System.Drawing.Color.White;
        Button6.ForeColor = System.Drawing.Color.Black;
        Button6.BackColor = System.Drawing.Color.White;
        this.Repeater1.Visible = false;
        this.Repeater2.Visible = true;
        this.Repeater3.Visible = false;
        this.Repeater4.Visible = false;
        this.Repeater5.Visible = false;
        this.Repeater6.Visible = false;
        this.Repeater2.DataBind();
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Button1.ForeColor = System.Drawing.Color.Black;
        Button1.BackColor = System.Drawing.Color.White;
        Button2.ForeColor = System.Drawing.Color.Black;
        Button2.BackColor = System.Drawing.Color.White;
        Button3.ForeColor = System.Drawing.Color.White;
        Button3.BackColor = System.Drawing.Color.Black;
        Button4.ForeColor = System.Drawing.Color.Black;
        Button4.BackColor = System.Drawing.Color.White;
        Button5.ForeColor = System.Drawing.Color.Black;
        Button5.BackColor = System.Drawing.Color.White;
        Button6.ForeColor = System.Drawing.Color.Black;
        Button6.BackColor = System.Drawing.Color.White;
        this.Repeater1.Visible = true;
        this.Repeater2.Visible = false;
        this.Repeater3.Visible = true;
        this.Repeater4.Visible = false;
        this.Repeater5.Visible = false;
        this.Repeater6.Visible = false;
        this.Repeater3.DataBind();
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        Button1.ForeColor = System.Drawing.Color.Black;
        Button1.BackColor = System.Drawing.Color.White;
        Button2.ForeColor = System.Drawing.Color.Black;
        Button2.BackColor = System.Drawing.Color.White;
        Button3.ForeColor = System.Drawing.Color.Black;
        Button3.BackColor = System.Drawing.Color.White;
        Button4.ForeColor = System.Drawing.Color.White;
        Button4.BackColor = System.Drawing.Color.Black;
        Button5.ForeColor = System.Drawing.Color.Black;
        Button5.BackColor = System.Drawing.Color.White;
        Button6.ForeColor = System.Drawing.Color.Black;
        Button6.BackColor = System.Drawing.Color.White;
        this.Repeater1.Visible = false;
        this.Repeater2.Visible = false;
        this.Repeater3.Visible = false;
        this.Repeater4.Visible = true;
        this.Repeater5.Visible = false;
        this.Repeater6.Visible = false;
        this.Repeater4.DataBind();
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        Button1.ForeColor = System.Drawing.Color.Black;
        Button1.BackColor = System.Drawing.Color.White;
        Button2.ForeColor = System.Drawing.Color.Black;
        Button2.BackColor = System.Drawing.Color.White;
        Button3.ForeColor = System.Drawing.Color.Black;
        Button3.BackColor = System.Drawing.Color.White;
        Button4.ForeColor = System.Drawing.Color.Black;
        Button4.BackColor = System.Drawing.Color.White;
        Button5.ForeColor = System.Drawing.Color.White;
        Button5.BackColor = System.Drawing.Color.Black;
        Button6.ForeColor = System.Drawing.Color.Black;
        Button6.BackColor = System.Drawing.Color.White;
        this.Repeater1.Visible = false;
        this.Repeater2.Visible = false;
        this.Repeater3.Visible = false;
        this.Repeater4.Visible = false;
        this.Repeater5.Visible = true;
        this.Repeater6.Visible = false;
        this.Repeater5.DataBind();
    }

    protected void Button6_Click(object sender, EventArgs e)
    {
        Button1.ForeColor = System.Drawing.Color.Black;
        Button1.BackColor = System.Drawing.Color.White;
        Button2.ForeColor = System.Drawing.Color.Black;
        Button2.BackColor = System.Drawing.Color.White;
        Button3.ForeColor = System.Drawing.Color.Black;
        Button3.BackColor = System.Drawing.Color.White;
        Button4.ForeColor = System.Drawing.Color.Black;
        Button4.BackColor = System.Drawing.Color.White;
        Button5.ForeColor = System.Drawing.Color.Black;
        Button5.BackColor = System.Drawing.Color.White;
        Button6.ForeColor = System.Drawing.Color.White;
        Button6.BackColor = System.Drawing.Color.Black;
        this.Repeater1.Visible = false;
        this.Repeater2.Visible = false;
        this.Repeater3.Visible = false;
        this.Repeater4.Visible = false;
        this.Repeater5.Visible = false;
        this.Repeater6.Visible = true;
        this.Repeater6.DataBind();
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
                        <li class="category_item"><asp:Button ID="Button1" runat="server" Text="Painting" OnClick="Button1_Click" class="view_more" /></li>
                        <li class="category_item"><asp:Button ID="Button2" runat="server" Text="Photography" OnClick="Button2_Click" class="view_more" /></li>
                        <li class="category_item"><asp:Button ID="Button3" runat="server" Text="Design" OnClick="Button3_Click"  class="view_more"/></li>
                        <li class="category_item"><asp:Button ID="Button4" runat="server" Text="Sculpture" OnClick="Button4_Click" class="view_more" /></li>
                        <li class="category_item"><asp:Button ID="Button5" runat="server" Text="Textile" OnClick="Button5_Click" class="view_more" /></li>
                        <li class="category_item"><asp:Button ID="Button6" runat="server" Text="Illustration" OnClick="Button6_Click" class="view_more"/></li>

                    </ul>
                </div>
                <hr />
            </div>
        </div>
        <div class="image_container">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT artworkID, artworkName, artworkDesc, quantity, price, category, image, artistID FROM Artwork WHERE (category = 'Painting')"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT artworkID, artworkName, artworkDesc, quantity, price, category, image, artistID FROM Artwork WHERE (category = 'Photography')"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT artworkID, artworkName, artworkDesc, quantity, price, category, image, artistID FROM Artwork WHERE (category = 'Design')"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT artworkID, artworkName, artworkDesc, quantity, price, category, image, artistID FROM Artwork WHERE (category = 'Sculpture')"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT artworkID, artworkName, artworkDesc, quantity, price, category, image, artistID FROM Artwork WHERE (category = 'Textile')"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT artworkID, artworkName, artworkDesc, quantity, price, category, image, artistID FROM Artwork WHERE (category = 'Illustration')"></asp:SqlDataSource>
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

            <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
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

            <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource3">
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

            <asp:Repeater ID="Repeater4" runat="server" DataSourceID="SqlDataSource4">
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

            <asp:Repeater ID="Repeater5" runat="server" DataSourceID="SqlDataSource5">
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

            <asp:Repeater ID="Repeater6" runat="server" DataSourceID="SqlDataSource6">
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
