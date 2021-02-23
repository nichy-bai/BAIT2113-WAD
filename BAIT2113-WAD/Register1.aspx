<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register1.aspx.cs" Inherits="BAIT2113_WAD.WebForm4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet2.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style4 {
            width: 2400px;
            
             /*background: url(icon.png);*/
              color:#ffffff;
        }
        .auto-style5 {
            width: 40%;
            height: 40%;
            color:#ffffff;
            margin-left: auto;
            margin-right: auto;
            margin-top: 50px;
            margin-bottom: auto;

        }
        .auto-style6 {
             color:#ffffff;
             width: 425px;
             align-items: center;
        }
        .auto-style10 {
             color:#ffffff;
            width: 425px;
            height:50px;
        }
        .auto-style11 {
            color:#ffffff;
            width: 265px;
             height: 50px;
        }
        .auto-style12 {
             color:#ffffff;
            width: 265px;
            height: 50px;
           
        }
        .auto-style14 {
             color:#ffffff;
            height: 50px;
        }
        th, td {
            padding: 10px;
            border-bottom: 1px solid #808080;
        }
        
        
        .auto-style15 {
            height: 50px;
        }
        
        
      
        
        
        </style>
</head>

<body>
    <form id="form1" runat="server">

        <div >

            


            <table class="auto-style5" style="background-color:#000000;">
                <tr>
                   <td class="auto-style4" rowspan="10" style="background-color:#ffffff;">
                       <img align:"center " width=" 100% " height="50%" src="icon.png"  />
                   </td>
                   <td colspan="2" class="auto-style15">
                   <h3>Register </h3> 
                   </td>
                </tr>


                <tr>
                    <td colspan="2" class="auto-style14">
           
            

            <h2>Register as</h2>

            <asp:RadioButton ID="radiobtn1" runat="server" Text="Artist" />&nbsp&nbsp&nbsp&nbsp&nbsp
            <asp:RadioButton ID="radiobtn2" runat="server" Text="Buyer" /> &nbsp&nbsp
                        <asp:Label ID="lblwarning" runat="server" Text=" " ForeColor="Red"></asp:Label>
                     </td>
                </tr>

                <tr>
                    <td class="auto-style11"> User ID <br />
                        <asp:TextBox ID="txtid" runat="server" Height="30px" Width="220px"></asp:TextBox>
                       
                        </td>
                    <td class="auto-style11"> Name<br />
                        <asp:TextBox ID="txtname" runat="server" Height="30px" Width="220px"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style11"> Password   <br />
                <asp:TextBox ID="txtpassword" runat="server" Height="30px" Width="220px" BorderStyle="Solid"></asp:TextBox> 
                
                </td>
                    <td class="auto-style6" > Re-enter Password<br />
                <asp:TextBox ID="txt4" runat="server" Height="30px" Width="220px" BorderStyle="Solid"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style12"> <p> Date of Birth  <br />  
                 <asp:TextBox ID="txtdob" runat="server" Height="30px" Width="220px" BorderStyle="Solid" ></asp:TextBox>
                
                <br />
                </p></td>
                    <td class="auto-style10"> Email <br />
                <asp:TextBox ID="txtemail" runat="server" Height="30px" Width="220px" BorderStyle="Solid"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td colspan="2"> <p> Street <br /> 
                <asp:TextBox ID="txtstreet" runat="server" Height="30px" Width="412px" BorderStyle="Solid"></asp:TextBox>
            </p></td>
                </tr>

                <tr>
                    <td class="auto-style11">
                 <p> City <br /> 
                <asp:TextBox ID="txtcity" runat="server" Height="30px" Width="220px" BorderStyle="Solid"></asp:TextBox>
           
            
              </p></td>
                    <td class="auto-style6"> Zip Code<br />
            
              <asp:TextBox ID="txtzip" runat="server" Height="30px" Width="220px" BorderStyle="Solid" OnTextChanged="txtzip_TextChanged"></asp:TextBox>
                    </td>
                </tr>

                <tr>


                <td class="auto-style11">
                       <p> State  <br /> 
                <asp:TextBox ID="txtstate" runat="server" Height="30px" Width="220px" BorderStyle="Solid"></asp:TextBox>
            
                   </p></td>
                    <td class="auto-style11">Phone <br />
                   <asp:TextBox ID="txtphone" runat="server" Height="30px" Width="220px" BorderStyle="Solid"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td colspan="2">
                        <asp:CheckBox ID="checkBox1" runat="server" Text=" " /><a href="term and condition.aspx"><span class="auto-style3">Term and condition </span></a> &nbsp;&nbsp;

            <asp:Label ID="lblwarning2" runat="server" Text=" "></asp:Label>
</td>
                </tr>

                <tr>
                    <td class="button">
                       <asp:Button ID="btn2" runat="server" OnClick="btn2_Click" Text="Reset" Width="150px" Height="39px"/>
            </td>
                    <td class="button" >
            <asp:Button ID="btn1" runat="server" Height="39px" Text="Register" Width="150px" OnClick="btn1_Click" /></td>
                </tr>
            </table>
       
           
           

   
   
            
           
            
              
              
           
          


           


            
            
            
            

          
       
            
           
      

           
          
        </div>
    </form>
</body>
</html>
