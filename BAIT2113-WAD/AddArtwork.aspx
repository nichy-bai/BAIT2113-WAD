﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Gallerion.Master" AutoEventWireup="true" CodeBehind="AddArtwork.aspx.cs" Inherits="BAIT2113_WAD.AddArtwork" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="http://code.jquery.com/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function ImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=Image1.ClientID%>').prop('src', e.target.result)
                        .width(300)
                        .height("auto");
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
    <link href="StyleSheet3.css" rel="stylesheet" />
    <div>
        <asp:PlaceHolder ID="HeaderPlaceHolder" runat ="server" />
    </div>
    <div class="profile-box">
        <div class="profile-detail">

               <asp:Image ID="profilepic" runat="server" class="profile-pic" />

            <span class="profile-detail-label">name</span>
            <asp:Label ID="lblArtistName" runat="server" CssClass="profile-detail-text"></asp:Label>

            <span class="profile-detail-label">user id</span>
            <asp:Label ID="lblArtistID" runat="server" CssClass="profile-detail-text"></asp:Label>

            <span class="profile-detail-label">date of birth</span>
                <asp:Label ID="lbldob" runat="server" CssClass="profile-detail-text"></asp:Label>

            <span class="profile-detail-label">phone</span>
            <asp:Label ID="lblphone" runat="server" CssClass="profile-detail-text"></asp:Label>

            <span class="profile-detail-label">email</span>
            <asp:Label ID="lblemail" runat="server" CssClass="profile-detail-text"></asp:Label>

            <a href="ArtistProfile.aspx" class="profile-btn">Artist Profile</a>
            <a href="mygallery.aspx" class="profile-btn">My Gallery</a>
            <a href="AddArtwork.aspx" class="profile-btn-active">Add New Artwork</a>
            <a href="ManageOrder.aspx" class="profile-btn">Manage Order</a>
        </div>
        <div class="profile-addartwork">
            <div class="profile-addtitle">Add New Artwork</div>

            <div class="profile-artworkrow">
                <div class="profile-addquestion">Artwork Name</div>
                <asp:TextBox ID="txtArtworkName" runat="server" Width="250px" ValidationGroup="addartwork"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="addartwork" runat="server" Display="Dynamic" ErrorMessage="Artwork Name is required" ControlToValidate="txtArtworkName" ForeColor="Red">*</asp:RequiredFieldValidator>
            </div>

            <div class="profile-artworkrow">
                <div class="profile-addquestion">Category</div>
                <asp:DropDownList ID="ddlCategory" runat="server" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" AutoPostBack="True" Height="28px" ValidationGroup="addartwork">
                    <asp:ListItem>Select One</asp:ListItem>
                    <asp:ListItem>Painting</asp:ListItem>
                    <asp:ListItem>Photography</asp:ListItem>
                    <asp:ListItem>Design</asp:ListItem>
                    <asp:ListItem>Sculpture</asp:ListItem>
                    <asp:ListItem>Textile</asp:ListItem>
                    <asp:ListItem>Illustration</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="addartwork" ControlToValidate="ddlCategory" Display="Dynamic" ErrorMessage="Please select the category" ForeColor="Red" InitialValue="Select One">*</asp:RequiredFieldValidator>
            </div>

            <div class="profile-artworkrow">
                <div class="profile-addquestion">Artwork ID</div>
                <asp:Label ID="lblArtworkID" runat="server"></asp:Label>
            </div>

            <div class="profile-artworkrow">
                <div class="profile-addquestion">Quantity</div>
                <asp:TextBox ID="txtQuantity" runat="server" Width="250px" ValidationGroup="addartwork"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="addartwork" runat="server" ControlToValidate="txtQuantity" Display="Dynamic" ErrorMessage="The quantity must insert" ForeColor="Red">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtQuantity" Display="Dynamic" ErrorMessage="Must be a number" ForeColor="Red" ValidationGroup="addartwork" ValidationExpression="\d{1,5}">*</asp:RegularExpressionValidator>
            </div>

            <div class="profile-artworkrow">
                <div class="profile-addquestion">Price($)</div>
                <asp:TextBox ID="txtPrice" runat="server" Width="250px" ValidationGroup="addartwork"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="addartwork" runat="server" ControlToValidate="txtPrice" Display="Dynamic" ErrorMessage="The price must insert" ForeColor="Red">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtPrice" Display="Dynamic" ErrorMessage="Must be a number" ForeColor="Red" ValidationGroup="addartwork" ValidationExpression="^(?!0*\.0+$)\d*(?:\.\d+)?$">*</asp:RegularExpressionValidator>
            </div>

            <div class="profile-artworkrow">
                <div class="profile-addquestion">Artwork</div>
                <div class="img-upload">
                    <asp:FileUpload ID="FileUpload1" runat="server" onchange="ImagePreview(this);" Height="50px" />
                    <asp:Image ID="Image1" runat="server" CssClass="img-preview"/>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="addartwork" runat="server" ControlToValidate="FileUpload1" Display="Dynamic" ErrorMessage="Please insert the artwork picture" ForeColor="Red">*</asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="profile-artworkrow">
                <div class="profile-addquestion">Description</div>
                <textarea id="taDescription" class="auto-style6" name="taDescription" runat="server"  rows="2" cols="33"></textarea>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="addartwork" runat="server" ControlToValidate="taDescription" Display="Dynamic" ErrorMessage="Description field is required" ForeColor="Red">*</asp:RequiredFieldValidator>
            </div>

            <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" CssClass="profile-uploadbtn" ValidationGroup="addartwork" />
                <br />
                <asp:ValidationSummary ID="ValidationSummary2" runat="server" DisplayMode="List" ForeColor="Red" ValidationGroup="addartwork" />
                <br />

            <asp:Label ID="lblmsg" runat="server" CssClass="upload-msg"></asp:Label>
        </div>
    </div>


</asp:Content>



