<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="BAIT2113_WAD.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet2.css" rel="stylesheet" />
</head>

<body>
    <form id="form1" runat="server">

        <div class="register-box">
            <div>
                <a href="Homepage.aspx" id="avatarBtn">
                    <img src="images/icon.png" class="avatar" title="Back to homepage" />
                </a>
            </div>
            
            <%--<h1>gallerion</h1>--%>
            <div class="register-singlerow">
                <div class="register-single">
                    <div class="register-question">User ID</div>
                    <asp:TextBox ID="txtid" runat="server" Height="30px" Width="220px"></asp:TextBox>
                </div>
                <div class="register-single">
                    <div class="register-question">Full Name</div>
                    <asp:TextBox ID="txtname" runat="server" Height="30px" Width="220px"></asp:TextBox>
                </div>
            </div>
            <div class="register-singlerow">
                <div class="register-single">
                    <div class="register-question">Password</div>
                    <asp:TextBox ID="txtpassword" runat="server" Height="30px" Width="220px" BorderStyle="Solid"></asp:TextBox>
                </div>
                <div class="register-single">
                    <div class="register-question">Re-enter Password</div>
                    <asp:TextBox ID="txt4" runat="server" Height="30px" Width="220px" BorderStyle="Solid"></asp:TextBox>
                </div>
            </div>
            <div class="register-singlerow">
                <div class="register-single">
                    <div class="register-question">Email</div>
                    <asp:TextBox ID="txtemail" runat="server" Height="30px" Width="220px" BorderStyle="Solid"></asp:TextBox>
                </div>
                <div class="register-single">
                    <div class="register-question">Date of Birth</div>
                    <asp:TextBox ID="txtdob" runat="server" Height="30px" Width="220px" BorderStyle="Solid"></asp:TextBox>
                </div>
            </div>
            <div class="register-singlerow">
                <div class="register-single">
                    <div class="register-question">Street</div>
                    <asp:TextBox ID="txtstreet" runat="server" Height="30px" Width="510px" BorderStyle="Solid"></asp:TextBox>
                </div>
            </div>
            <div class="register-singlerow">
                <div class="register-single">
                    <div class="register-question">City</div>
                    <asp:TextBox ID="txtcity" runat="server" Height="30px" Width="220px" BorderStyle="Solid"></asp:TextBox>
                </div>
                <div class="register-single">
                    <div class="register-question">Zip Code</div>
                    <asp:TextBox ID="txtzip" runat="server" Height="30px" Width="220px" BorderStyle="Solid" OnTextChanged="txtzip_TextChanged"></asp:TextBox>
                </div>
            </div>
            <div class="register-singlerow">
                <div class="register-single">
                    <div class="register-question">State</div>
                    <asp:TextBox ID="txtstate" runat="server" Height="30px" Width="220px" BorderStyle="Solid"></asp:TextBox>
                </div>
                <div class="register-single">
                    <div class="register-question">Phone Number</div>
                    <asp:TextBox ID="txtphone" runat="server" Height="30px" Width="220px" BorderStyle="Solid"></asp:TextBox>
                </div>
            </div>
            <div class="register-singlerow" style="justify-content: space-around; align-items: center; width: 100%">
                <div class="register-single">
                    <div class="register-question">Register As</div>
                    <div class="register-singlerow" style="justify-content: flex-start">
                        <asp:RadioButton ID="radiobtn1" runat="server" GroupName="userType" Text="Artist" />&nbsp&nbsp&nbsp&nbsp&nbsp
                        <asp:RadioButton ID="radiobtn2" runat="server" GroupName="userType" Text="Customer" />
                        &nbsp&nbsp
                    </div>
                </div>
                <div class="register-singlerow">
                    <asp:CheckBox ID="checkBox1" runat="server" Text=" " /><a href="/Help.aspx#terms_and_conditions" target="_blank"><span style="color: black">Term and conditions </span></a>&nbsp;&nbsp;
                </div>
            </div>
            <br />
            <div style="text-align: center">
                <asp:Label ID="lblwarning2" runat="server" Text=" " ForeColor="Red"></asp:Label>
                <asp:Label ID="lblwarning" runat="server" Text=" " ForeColor="Red"></asp:Label>
            </div>
            <br />
            <div class="register-singlerow">
                <div class="register-single">
                    <asp:Button ID="btn2" runat="server" OnClick="btn2_Click" Text="Reset" Width="150px" Height="39px" CssClass="cancel-btn" />
                </div>
                <div class="register-single">
                    <asp:Button ID="btn1" runat="server" Height="39px" Text="Register" Width="150px" OnClick="btn1_Click" CssClass="register-btn" />
                </div>
            </div>

            <a href="Login.aspx" class="return-btn">Already have an account?</a>
        </div>
    </form>
</body>
</html>
