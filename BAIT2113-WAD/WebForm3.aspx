<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="BAIT2113_WAD.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <link href="StyleSheet2.css" rel="stylesheet" />
    
    <style type="text/css">
        .auto-style6 {
            position: absolute;
            left: 40%;
            text-align: left;
 
            top: 20px;
            width: 550px;
        }
    </style>
    
</head>
<body>
    
    <form id="form1" runat="server">
         <div class ="auto-style6"><img src="image/excellent.png" width="150" height="150"/>
           <strong> Gallerion</strong></div>
    <div class="login-box">
        <img src="avatar.png" class="avatar"/>
    <h1>Login</h1>
        <p> User Id   </p><br />
        <asp:TextBox ID="txtID" runat="server"></asp:TextBox><br\ />
        <p>
            Password 
        </p>
        <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox><br\ />
        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="Button1_Click" /><br\ />
        <a href="Register1.aspx">Create Account</a>
        </div>
       
       
 
    </form>
</body>
</html>
