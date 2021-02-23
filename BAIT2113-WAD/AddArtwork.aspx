﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Gallerion.Master" AutoEventWireup="true" CodeBehind="AddArtwork.aspx.cs" Inherits="BAIT2113_WAD.WebForm4" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="http://code.jquery.com/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function ImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=Image1.ClientID%>').prop('src', e.target.result)
                        .width(100)
                        .height(100);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
    
    <table style="width:100%;">
        <tr>
            <td class="auto-style1" rowspan="4">&nbsp;</td>
            <td class="auto-style2">Add New Artwork</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td>
                <br />
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Artwork Name:</td>
            <td>
                <asp:TextBox ID="txtArtworkName" runat="server" Width="220px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style4"></td>
            <td class="auto-style5"></td>
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:Label ID="lblArtistName" runat="server"></asp:Label>
            </td>
            <td class="auto-style2">Category:</td>
            <td>
                <asp:DropDownList ID="ddlCategory" runat="server" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" AutoPostBack="True" Height="28px">
                    <asp:ListItem>Painting</asp:ListItem>
                    <asp:ListItem>Photography</asp:ListItem>
                    <asp:ListItem>Design</asp:ListItem>
                    <asp:ListItem>Sculpture</asp:ListItem>
                    <asp:ListItem>Textile</asp:ListItem>
                    <asp:ListItem>Illustration</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="lblArtistID" runat="server"></asp:Label>
            </td>
            <td class="auto-style4"></td>
            <td class="auto-style5"></td>
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:Label ID="lbldob" runat="server"></asp:Label>
            </td>
            <td class="auto-style2">Artwork ID:</td>
            <td>
                <asp:Label ID="lblArtworkID" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="lblphone" runat="server"></asp:Label>
            </td>
            <td class="auto-style4"></td>
            <td class="auto-style5"></td>
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:Label ID="lblemail" runat="server"></asp:Label>
            </td>
            <td class="auto-style2">Quantity:</td>
            <td>
                <asp:TextBox ID="txtQuantity" runat="server" Width="220px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3"></td>
            <td class="auto-style4"></td>
            <td class="auto-style5"></td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;<a href="mygallery.aspx">My Gallary</a></td>
            <td class="auto-style2">Price (RM):</td>
            <td>
                <asp:TextBox ID="txtPrice" runat="server" Width="220px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3"></td>
            <td class="auto-style4"></td>
            <td class="auto-style5"></td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style2">Image:</td>
            <td>
                <asp:FileUpload ID="FileUpload1" runat="server" onchange="ImagePreview(this);" />
                <br />
                <asp:Image ID="Image1" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="auto-style3"></td>
            <td class="auto-style4"></td>
            <td class="auto-style5"></td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style2">Description:</td>
            <td>
                <textarea id="taDescription" class="auto-style6" name="taDescription" runat="server"></textarea></td>
        </tr>
        <tr>
            <td class="auto-style3"></td>
            <td class="auto-style4"></td>
            <td class="auto-style5"></td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
            <td>
                <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" />
                <br />
                <br />
                <asp:Label ID="lblmsg" runat="server"></asp:Label>
            </td>
        </tr>
    </table>

    
</asp:Content>

<asp:Content ID="Content3" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style1 {
            width: 302px;
        }
        .auto-style2 {
            width: 173px;
        }
        .auto-style3 {
            width: 302px;
            height: 15px;
        }
        .auto-style4 {
            width: 173px;
            height: 15px;
        }
        .auto-style5 {
            height: 15px;
        }
        .auto-style6 {
            width: 220px;
            height: 43px;
        }
    </style>
</asp:Content>


