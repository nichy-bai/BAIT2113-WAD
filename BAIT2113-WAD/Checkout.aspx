<%@ Page Title="" Language="C#" MasterPageFile="~/Gallerion.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="BAIT2113_WAD.Checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="StyleSheet3.css" rel="stylesheet" />
        <div style="padding: 0 50px;">
            <div class="profile-addtitle" style="margin-top: 50px;">Check Out</div>

            <table id="checkout" style="width:100%; border:hidden; border-collapse: collapse;">

                <tr style="width:100%; background-color:lightgrey;">
                    <th>Artwork</th>
                    <th>Artwork Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Subtotal</th>
                </tr>
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">

                    <ItemTemplate>
                        <tr style="border-bottom: 1px solid black;">
                            <td class="image1"  style="text-align: center;">
                                <asp:ImageButton ID="Image1" runat="server" ImageUrl='<%# Eval("image")%>'  Width="200px" Height="200px" /></td>
                            <td style="text-align: center;  height: 100px;width:200px;">
								<asp:Label ID="Label1" runat="server" Text='<%# Eval("artworkName")%>'></asp:Label></td>
                            <td style="text-align: center; height: 100px;width:200px;"><asp:Label ID="Label2" runat="server" Text='<%# Eval("price","${0:0.00}")%>'></asp:Label></td>
							<td style="text-align: center; height: 100px;width:200px;">
								<asp:Label ID="Label3" runat="server" Text='<%# Eval("quantity")%>'></asp:Label></td>
							<td style="text-align: center; height: 100px;width:200px;">
								<asp:Label ID="Label4" runat="server" Text='<%# Eval("subtotal","${0:0.00}")%>'></asp:Label></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [artworkID],[image], [artworkName], [price],[quantity], [subtotal] FROM [Cart] WHERE ([customerID] = @customerID)">
                <SelectParameters>
                    <asp:SessionParameter Name="customerID" SessionField="customerID"/>
                </SelectParameters>
            </asp:SqlDataSource>
        </div>

    <div style="margin-left:1250px;margin-top:50px;font-size:28px;font-weight:bold;">
		<asp:Label ID="Label5" runat="server" Text="Total: "></asp:Label>
    <asp:Label ID="lblTotal" runat="server" text ="total" ></asp:Label>
        </div>
    <div style="margin: 100px 25%;">
	<asp:Button ID="Payment" runat="server" Text="Proceed to Payment" OnClick="Payment_Click" CssClass="profile-uploadbtn"></asp:Button>
    </div>
</asp:Content>
