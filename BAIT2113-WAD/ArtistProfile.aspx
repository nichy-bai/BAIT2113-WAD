<%@ Page Title="" Language="C#" MasterPageFile="~/Gallerion.Master" AutoEventWireup="true" CodeBehind="ArtistProfile.aspx.cs" Inherits="BAIT2113_WAD.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	</asp:Content>
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


            <a href="ArtistProfile.aspx" class="profile-btn-active">Artist Profile</a>
            <a href="mygallery.aspx" class="profile-btn">My Gallery</a>
            <a href="AddArtwork.aspx" class="profile-btn">Add New Artwork</a>
            <a href="ManageOrder.aspx" class="profile-btn">Manage Order</a>
        </div>

        <div>
			<div class="profile-addtitle">Profile Details</div>
			<div>
                    <asp:FileUpload ID="FileUpload1" runat="server" onchange="ImagePreview(this);" Height="50px" />
                    <asp:Image ID="Image1" runat="server" CssClass="img-preview"/>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ValidationGroup="addartwork" runat="server" ControlToValidate="FileUpload1" Display="Dynamic" ErrorMessage="Profile picture is required" ForeColor="Red">*</asp:RequiredFieldValidator>
                </div>
			<div><asp:Label runat="server" Text="Name: "></asp:Label><asp:TextBox ID="Name" runat="server"></asp:TextBox>
				<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Name" Display="Dynamic" ErrorMessage="Name is required" ForeColor="Red">*</asp:RequiredFieldValidator>

			</div>
			<div>
				<asp:Label runat="server" Text="DOB: ">
					<asp:TextBox ID="DOB" runat="server" TextMode="Date"></asp:TextBox>
			</asp:Label></div>
			<div><asp:Label runat="server" Text="Phone: "></asp:Label><asp:TextBox ID="Phone" runat="server"></asp:TextBox>

				<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Phone" ErrorMessage="Phone Number is required." Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator>
			</div>
			<div><asp:Label runat="server" Text="Email: "></asp:Label><asp:TextBox ID="Email" runat="server"></asp:TextBox>
				<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Email" ErrorMessage="Email is required" Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator>
				<asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Email is invalid" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$" ControlToValidate="Email" Display="Dynamic" ForeColor="Red">*</asp:RegularExpressionValidator>
			</div>
			<div><asp:Label runat="server" Text="Street: "></asp:Label><asp:TextBox ID="Street" runat="server"></asp:TextBox>
				<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Street" ErrorMessage="Street is required" Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator>
			</div>
			<div><asp:Label runat="server" Text="City: "></asp:Label><asp:TextBox ID="City" runat="server"></asp:TextBox>
				<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="City" ErrorMessage="City is required" Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator>
			</div>
			<div><asp:Label runat="server" Text="ZipCode: "></asp:Label><asp:TextBox ID="ZipCode" runat="server"></asp:TextBox>
				<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ZipCode" ErrorMessage="Zip code is required" Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator>
				<asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Zip code invalid" ValidationExpression="^[0-9]{5}$" ControlToValidate="ZipCode" Display="Dynamic" ForeColor="Red">*</asp:RegularExpressionValidator>
			</div>
			<div><asp:Label runat="server" Text="State: "></asp:Label><asp:TextBox ID="State" runat="server"></asp:TextBox>
				<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="State" ErrorMessage="State is required" Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator>
			</div>
			<asp:LinkButton ID="UpdateProfile" runat="server" OnClick="UpdateProfile_Click">LinkButton</asp:LinkButton>
	        <asp:ValidationSummary ID="ValidationSummary2" runat="server" DisplayMode="List" ForeColor="Red" />
	</div>
		</div>




</asp:Content>

