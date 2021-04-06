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

        <div class="profile-addartwork">
			<div class="profile-addtitle">Profile Details</div>

			<div class="profile-artworkrow">
                <div class="profile-addquestion">Profile Picture</div>
				<div class="img-upload">
					<asp:FileUpload ID="FileUpload1" runat="server" onchange="ImagePreview(this);" Height="50px" />
					<asp:Image ID="Image1" runat="server" CssClass="img-preview"/>
					<asp:RequiredFieldValidator ID="RequiredFieldValidator8" ValidationGroup="editprofile" runat="server" ControlToValidate="FileUpload1" Display="Dynamic" ErrorMessage="Profile picture is required" ForeColor="Red">*</asp:RequiredFieldValidator>
				</div>
            </div>
			<div class="profile-artworkrow">
                <div class="profile-addquestion">Full Name</div>
				<asp:TextBox ID="Name" runat="server" Width="250px"></asp:TextBox>
				<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Name" Display="Dynamic" ErrorMessage="Name is required" ForeColor="Red" ValidationGroup="editprofile">*</asp:RequiredFieldValidator>
			</div>
			<div class="profile-artworkrow">
                <div class="profile-addquestion">Date of Birth</div>
				<asp:TextBox ID="DOB" runat="server" TextMode="Date" Width="250px"></asp:TextBox>
			</div>
			<div class="profile-artworkrow">
                <div class="profile-addquestion">Phone Number</div>
				<asp:TextBox ID="Phone" runat="server" Width="250px"></asp:TextBox>
				<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Phone" ErrorMessage="Phone Number is required." Display="Dynamic" ForeColor="Red" ValidationGroup="editprofile">*</asp:RequiredFieldValidator>
			</div>
			<div class="profile-artworkrow">
                <div class="profile-addquestion">Email</div>
				<asp:TextBox ID="Email" runat="server" Width="250px"></asp:TextBox>
				<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Email" ErrorMessage="Email is required" Display="Dynamic" ForeColor="Red" ValidationGroup="editprofile">*</asp:RequiredFieldValidator>
				<asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Email is invalid" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$" ControlToValidate="Email" Display="Dynamic" ForeColor="Red" ValidationGroup="editprofile">*</asp:RegularExpressionValidator>
			</div>
			<div class="profile-artworkrow">
                <div class="profile-addquestion">Street</div>
				<asp:TextBox ID="Street" runat="server" Width="250px"></asp:TextBox>
				<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Street" ErrorMessage="Street is required" Display="Dynamic" ForeColor="Red" ValidationGroup="editprofile">*</asp:RequiredFieldValidator>
			</div>
			<div class="profile-artworkrow">
                <div class="profile-addquestion">City</div>
				<asp:TextBox ID="City" runat="server" Width="250px"></asp:TextBox>
				<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="City" ErrorMessage="City is required" Display="Dynamic" ForeColor="Red" ValidationGroup="editprofile">*</asp:RequiredFieldValidator>
			</div>
			<div class="profile-artworkrow">
                <div class="profile-addquestion">Zip Code</div>
				<asp:TextBox ID="ZipCode" runat="server" Width="250px"></asp:TextBox>
				<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ZipCode" ErrorMessage="Zip code is required" Display="Dynamic" ForeColor="Red" ValidationGroup="editprofile">*</asp:RequiredFieldValidator>
				<asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Zip code invalid" ValidationExpression="^[0-9]{5}$" ControlToValidate="ZipCode" Display="Dynamic" ForeColor="Red" ValidationGroup="editprofile">*</asp:RegularExpressionValidator>
			</div>
			<div class="profile-artworkrow">
                <div class="profile-addquestion">State</div>
				<asp:TextBox ID="State" runat="server" Width="250px"></asp:TextBox>
				<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="State" ErrorMessage="State is required" Display="Dynamic" ForeColor="Red" ValidationGroup="editprofile">*</asp:RequiredFieldValidator>
			</div>
			<div class="profile-artworkrow">
                <div class="profile-addquestion">Old Password</div>
				<asp:TextBox ID="OPassword" runat="server" TextMode="Password" Width="250px"></asp:TextBox>
				<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="OPassword" ErrorMessage="Old Password is required" Display="Dynamic" ForeColor="Red" ValidationGroup="editprofile">*</asp:RequiredFieldValidator>
			</div>
			<div class="profile-artworkrow">
                <div class="profile-addquestion">New Password</div>
				<asp:TextBox ID="Password" runat="server" TextMode="Password" Width="250px"></asp:TextBox>
				<asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="Password" ErrorMessage="New Password is required" Display="Dynamic" ForeColor="Red" ValidationGroup="editprofile">*</asp:RequiredFieldValidator>
			</div>
			<div class="profile-artworkrow">
                <div class="profile-addquestion">Confirm New Password</div>
				<asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password" Width="250px"></asp:TextBox>
				<asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="Confirm Password is required" Display="Dynamic" ForeColor="Red" ValidationGroup="editprofile">*</asp:RequiredFieldValidator>
			    <asp:CompareValidator ID="CompareValidator1" runat="server" Display="Dynamic" ErrorMessage="Confirm Password not same" ForeColor="Red" ValidationGroup="editprofile" ControlToCompare="Password" ControlToValidate="ConfirmPassword">*</asp:CompareValidator>
			</div>
			<asp:Label ID="lblopass" runat="server"></asp:Label>
			<asp:Button ID="Button1" runat="server" Text="Update Profile"  OnClick="UpdateProfile_Click" ValidationGroup="editprofile" CssClass="profile-uploadbtn"/>
	        <asp:ValidationSummary ID="ValidationSummary2" runat="server" DisplayMode="List" ForeColor="Red" ValidationGroup="editprofile" />
	</div>
		</div>




</asp:Content>

