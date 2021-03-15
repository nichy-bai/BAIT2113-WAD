<%@ Page Title="" Language="C#" MasterPageFile="~/Gallerion.Master" AutoEventWireup="true" CodeBehind="AddArtwork.aspx.cs" Inherits="BAIT2113_WAD.AddArtwork" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="http://code.jquery.com/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function ImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=Image1.ClientID%>').prop('src', e.target.result)
                        .width(100)
                        .height(100);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
    <link href="StyleSheet3.css" rel="stylesheet" />

    <div class="profile-box">
        <div class="profile-detail">

                <asp:Image ID="profilepic" runat="server" class="profile-pic" />

                <asp:Label ID="lblArtistName" runat="server"></asp:Label>
                <asp:Label ID="lblArtistID" runat="server"></asp:Label>
                <asp:Label ID="lbldob" runat="server"></asp:Label>
                <asp:Label ID="lblphone" runat="server"></asp:Label>
                <asp:Label ID="lblemail" runat="server"></asp:Label>
            <asp:HyperLink ID="HyperLink1" runat="server" Target="_blank" class="profile-btn">watch me</asp:HyperLink>
                <a href="mygallery.aspx" class="profile-btn">My Gallery</a>
                <a href="AddArtwork.aspx" class="profile-btn-active">Add New Artwork</a>
            <a href="ManageOrder.aspx" class="profile-btn-active">Manage Order</a>
        </div>
        <div class="profile-addartwork">
            <div class="profile-addtitle">Add New Artwork</div>

            <div class="profile-artworkrow">
                <div class="profile-addquestion">Artwork Name</div>
                <asp:TextBox ID="txtArtworkName" runat="server" Width="220px"></asp:TextBox>
            </div>

            <div class="profile-artworkrow">
                <div class="profile-addquestion">Category</div>
                <asp:DropDownList ID="ddlCategory" runat="server" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" AutoPostBack="True" Height="28px">
                    <asp:ListItem>Painting</asp:ListItem>
                    <asp:ListItem>Photography</asp:ListItem>
                    <asp:ListItem>Design</asp:ListItem>
                    <asp:ListItem>Sculpture</asp:ListItem>
                    <asp:ListItem>Textile</asp:ListItem>
                    <asp:ListItem>Illustration</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="profile-artworkrow">
                <div class="profile-addquestion">Artwork ID</div>
                <asp:Label ID="lblArtworkID" runat="server"></asp:Label>
            </div>

            <div class="profile-artworkrow">
                <div class="profile-addquestion">Quantity</div>
                <asp:TextBox ID="txtQuantity" runat="server" Width="220px"></asp:TextBox>
            </div>

            <div class="profile-artworkrow">
                <div class="profile-addquestion">Price</div>
                <asp:TextBox ID="txtPrice" runat="server" Width="220px"></asp:TextBox>
            </div>

            <div class="profile-artworkrow">
                <div class="profile-addquestion">Artwork</div>
                <asp:FileUpload ID="FileUpload1" runat="server" onchange="ImagePreview(this);" />
                <asp:Image ID="Image1" runat="server" />
            </div>

            <div class="profile-artworkrow">
                <div class="profile-addquestion">Description</div>
                <textarea id="taDescription" class="auto-style6" name="taDescription" runat="server"></textarea>
            </div>

            <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" CssClass="profile-uploadbtn" />
                <br />
                <br />
                <asp:Label ID="lblmsg" runat="server"></asp:Label>
        </div>
    </div>


</asp:Content>


