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
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtid" ErrorMessage="UserID is required" ForeColor="Red">UserID is required</asp:RequiredFieldValidator>
                </div>
                <div class="register-single">
                    <div class="register-question">Full Name</div>
                    <asp:TextBox ID="txtname" runat="server" Height="30px" Width="220px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtname" Display="Dynamic" ErrorMessage="Name is required" ForeColor="Red">Name is required</asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="register-singlerow">
                <div class="register-single">
                    <div class="register-question">Password</div>
                    <asp:TextBox ID="txtpassword" TextMode="Password"  runat="server" Height="30px" Width="220px"></asp:TextBox>
                </div>
                <div class="register-single">
                    <div class="register-question">Re-enter Password</div>
                    <asp:TextBox ID="txt4" TextMode="Password"  runat="server" Height="30px" Width="220px"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtpassword" ControlToValidate="txt4" ErrorMessage="Password Incorrect" ForeColor="Red"></asp:CompareValidator>
                </div>
            </div>
            <div class="register-singlerow">
                <div class="register-single">
                    <div class="register-question">Email</div>
                    <asp:TextBox ID="txtemail" TextMode="Email" runat="server" Height="30px" Width="220px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtemail" ErrorMessage="Email Invalid" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </div>
                <div class="register-single">
                    <div class="register-question">Date of Birth</div>
                    <asp:TextBox ID="txtdob" runat="server" Height="30px" Width="220px"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="txtdob" ErrorMessage="Date Invalid" ForeColor="Red" Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                </div>
            </div>
            <div class="register-singlerow">
                <div class="register-single">
                    <div class="register-question">Street</div>
                    <asp:TextBox ID="txtstreet" runat="server" Height="30px" Width="510px"></asp:TextBox>
                </div>
            </div>
            <div class="register-singlerow">
                <div class="register-single">
                    <div class="register-question">City</div>
                    <asp:TextBox ID="txtcity" runat="server" Height="30px" Width="220px"></asp:TextBox>
                </div>
                <div class="register-single">
                    <div class="register-question">Zip Code</div>
                    <asp:TextBox ID="txtzip" runat="server" Height="30px" Width="220px" OnTextChanged="txtzip_TextChanged"></asp:TextBox>
                </div>
            </div>
            <div class="register-singlerow">
                <div class="register-single">
                    <div class="register-question">State</div>
                    <asp:TextBox ID="txtstate" runat="server" Height="30px" Width="220px"></asp:TextBox>
                </div>
                <div class="register-single">
                    <div class="register-question">Phone Number</div>
                    <asp:TextBox ID="txtphone" runat="server" Height="30px" Width="220px"></asp:TextBox>
                    <asp:RegularExpressionValidator runat="server" ControlToValidate="txtphone" ErrorMessage="Phone Number Invalid" ForeColor="Red" ValidationExpression="^(\+?6?01)[0-46-9]-*[0-9]{7,8}$"></asp:RegularExpressionValidator>
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
                    <asp:CheckBox ID="checkBox1" runat="server" Text=" " /><a href="/Help.aspx#terms_and_conditions" target="_blank"><span style="color: black">Terms and conditions </span></a>&nbsp;&nbsp;
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
                    <asp:Button ID="btn2" runat="server" OnClick="btn2_Click" Text="Reset" Width="230px" Height="40px" CssClass="cancel-btn" />
                </div>
                <div class="register-single">
                    <asp:Button ID="btn1" runat="server" OnClick="btn1_Click" Text="Register" Width="230px" Height="40px" CssClass="register-btn" />
                </div>
            </div>

            <a href="Login.aspx" class="return-btn">Already have an account?</a>
        </div>
    </form>
</body>
</html>
