<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BAIT2113_WAD.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet2.css" rel="stylesheet" />

</head>
<body>

    <form id="form1" runat="server">
        <%--<div>
            <div class="spin">
                <div class="large circle one"></div>
                <div class="large circle two"></div>
                <div class="large circle three"></div>
                <div class="large circle four"></div>
                <div class="large circle five"></div>
                <div class="large circle six"></div>
                <div class="large circle seven"></div>
                <div class="large circle eight"></div>
            </div>

            <div class="pulse">
                <div class="small circle one"></div>
                <div class="small squircle two"></div>
                <div class="small circle three"></div>
                <div class="small squircle four"></div>
                <div class="small circle five"></div>
                <div class="small squircle six"></div>
                <div class="small circle seven"></div>
                <div class="small squircle eight"></div>
            </div>--%>

            <div class="login-box">
                <div>
                    <a href="Homepage.aspx" id="avatarBtn">
                        <img src="images/icon.png" class="avatar" title="Back to homepage" />
                    </a>
                </div>
                
                <%--<h1>gallerion</h1>--%>

                <p>User ID</p>
                <asp:TextBox ID="txtID" runat="server"></asp:TextBox><br />

                <p>Password</p>
                <asp:TextBox ID="txtPassword" TextMode="Password" runat="server"></asp:TextBox><br /><br /><br />
                <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" /><br />
                <a href="Register.aspx" class="return-btn">Don't have an account?</a>
            </div>
        </div>

    </form>
</body>
</html>
