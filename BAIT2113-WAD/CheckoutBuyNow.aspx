<%@ Page Title="" Language="C#" MasterPageFile="~/Gallerion.Master" AutoEventWireup="true" CodeBehind="CheckoutBuyNow.aspx.cs" Inherits="BAIT2113_WAD.CheckoutBuyNow" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="StyleSheet3.css" rel="stylesheet" />
	<div class="profile-addartwork" style="padding: 30px 100px 200px 100px;">
        <div class="profile-addtitle">Payment</div>

        <div class="profile-artworkrow">
            <div class="profile-addquestion">Credit Card Type</div>
            <asp:RadioButtonList ID="RadioButtonList1" runat="server">
			<asp:ListItem>Visa</asp:ListItem>
			<asp:ListItem>MasterCard</asp:ListItem>
	        </asp:RadioButtonList>
	        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="RadioButtonList1" Display="Dynamic" ErrorMessage="Please choose either 1 type of credit card" ForeColor="Red">*</asp:RequiredFieldValidator>
        </div>

        <div class="profile-artworkrow">
            <div class="profile-addquestion">Credit Card Number</div>
            <asp:TextBox ID="TextBox2" runat="server" Width="250px"></asp:TextBox>
			<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Card Number is required" Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator>
			<asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ControlToValidate="TextBox2" EnableClientScript="False" ErrorMessage="Invalid Card Number" OnServerValidate="CustomValidator1_ServerValidate" ForeColor="Red">*</asp:CustomValidator>
        </div>

        <div class="profile-artworkrow">
            <div class="profile-addquestion">Credit Card CVV</div>
            <asp:TextBox ID="TextBox3" runat="server" Width="50px"></asp:TextBox>
			<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="CVV Number is required" Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator>
			<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox3" ErrorMessage="Invalid CVV Number" ValidationExpression="^[0-9]{3}$" Display="Dynamic" ForeColor="Red">*</asp:RegularExpressionValidator>
        </div>

        <div class="profile-artworkrow">
            <div class="profile-addquestion">Expiration Month</div>
            <asp:TextBox ID="TextBox4" runat="server" Width="50px"></asp:TextBox>
			<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="Expiration month is required" Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBox4" ErrorMessage="Invalid month" MaximumValue="12" MinimumValue="1" Display="Dynamic" ForeColor="Red">*</asp:RangeValidator>
        </div>


        <div class="profile-artworkrow">
            <div class="profile-addquestion">Expiration Year</div>
            <asp:TextBox ID="TextBox5" runat="server" Width="50px"></asp:TextBox>
			<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox5" ErrorMessage="Expiration year is required" Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator>
			<asp:RangeValidator ID="RangeValidator3" runat="server" ControlToValidate="TextBox5" ErrorMessage="Invalid Year" MaximumValue="30" MinimumValue="22" Display="Dynamic" ForeColor="Red">*</asp:RangeValidator>
        </div>

        <div class="profile-artworkrow">
            <div class="profile-addquestion">Logistics</div>
            <asp:RadioButtonList ID="RadioButtonList2" runat="server">
				<asp:ListItem>DHL</asp:ListItem>
				<asp:ListItem>PosLaju</asp:ListItem>
			</asp:RadioButtonList>

            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="RadioButtonList2" ErrorMessage="Logistics is required" Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator> <p>
        </div>

            <asp:ValidationSummary ID="ValidationSummary2" runat="server" DisplayMode="List" ForeColor="Red" />

        <asp:Button ID="Pay" runat="server" Text="Place Order" OnClick ="Pay_OnClick" CssClass="profile-uploadbtn"></asp:Button>

    </div>
</asp:Content>