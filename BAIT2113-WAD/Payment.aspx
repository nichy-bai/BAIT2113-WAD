<%@ Page Title="" Language="C#" MasterPageFile="~/Gallerion.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="BAIT2113_WAD.Payment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	 <div class="panel panel-info">
                        <div class="panel-body">
                            <div class="form-group">
                                <div class="col-md-12"><strong>Card Type:</strong></div>
                                <div class="col-md-12">
                                    &nbsp;<asp:RadioButtonList ID="RadioButtonList1" runat="server">
										<asp:ListItem>Visa</asp:ListItem>
										<asp:ListItem>MasterCard</asp:ListItem>
									</asp:RadioButtonList>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="RadioButtonList1" Display="Dynamic" ErrorMessage="Please choose either 1"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12"><strong>Credit Card Number:</strong></div>
                                <div class="col-md-12">
									<asp:TextBox ID="TextBox2" runat="server" Width="1480px"></asp:TextBox>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Field are Required" Display="Dynamic"></asp:RequiredFieldValidator>
									<asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ControlToValidate="TextBox2" EnableClientScript="False" ErrorMessage="Invalid Card Number" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
								</div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12"><strong>Card CVV:</strong></div>
                                <div class="col-md-12">
									<asp:TextBox ID="TextBox3" runat="server" Width="1470px"></asp:TextBox>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="Field are Required" Display="Dynamic"></asp:RequiredFieldValidator>
									<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox3" ErrorMessage="Invalid CVV Number" ValidationExpression="^[0-9]{3}$"></asp:RegularExpressionValidator>
								</div>
                            </div>
							<div class="form-group">
                                <div class="col-md-12">
                                    <strong>Expiration Date</strong>
                                </div>


                                    <div>
                                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="&nbsp;&nbsp;&nbsp;&nbsp;Month :"></asp:Label>

									<asp:TextBox ID="TextBox4" runat="server" Width="380px"></asp:TextBox>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="Field are Required" Display="Dynamic"></asp:RequiredFieldValidator>
                                	<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBox4" ErrorMessage="Invalid month" MaximumValue="12" MinimumValue="1"></asp:RangeValidator>

                                    </div>

                                <div>
									<asp:Label ID="Label2" runat="server" Font-Bold="True" Text="&nbsp;&nbsp;&nbsp;&nbsp;Year &nbsp;&nbsp;&nbsp;:"></asp:Label>
									<asp:TextBox ID="TextBox5" runat="server" Width="380px"></asp:TextBox>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox5" ErrorMessage="Field is required"></asp:RequiredFieldValidator>
									<asp:RangeValidator ID="RangeValidator3" runat="server" ControlToValidate="TextBox5" ErrorMessage="Invalid Year" MaximumValue="30" MinimumValue="22"></asp:RangeValidator>
                                    </div>
                                </div>

                            <div class="form-group">
                                <div class="col-md-12"><strong>Logistics:</strong></div>
                                <div class="col-md-12">
                                    &nbsp;<asp:RadioButtonList ID="RadioButtonList2" runat="server">
										<asp:ListItem>DHL</asp:ListItem>
										<asp:ListItem>PosLaju</asp:ListItem>
									</asp:RadioButtonList>

                                	<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="RadioButtonList2" ErrorMessage="Field is required!"></asp:RequiredFieldValidator>

                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-md-6 col-sm-6 col-xs-12">
									<asp:Button ID="Pay" runat="server" Text="Place Order" OnClick ="Pay_OnClick"></asp:Button>
                                </div>
                            </div>
                        </div>

                    <!--CREDIT CART PAYMENT END-->




            <div class="row cart-footer">

            </div>

</asp:Content>
