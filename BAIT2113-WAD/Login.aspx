<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BAIT2113_WAD.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <link href="StyleSheet2.css" rel="stylesheet" />
    
</head>
<body>
    
    <form id="form1" runat="server">
        
    <div class="login-box">
        <img src="images/icon.png" class="avatar"/>
    <h1>gallerion</h1>
        <p>User ID</p>
        <asp:TextBox ID="txtID" runat="server"></asp:TextBox><br\ />
        
        <p>Password</p>
        <asp:TextBox ID="txtPassword" TextMode="Password" runat="server"></asp:TextBox><br\ />
        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" /><br\ />
        <a href="Register.aspx">Create Account</a>
        </div>
       
       
 
    </form>
</body>
</html>