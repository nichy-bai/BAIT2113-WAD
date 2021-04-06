<%@ Page Title="" Language="C#" MasterPageFile="~/Gallerion.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="BAIT2113_WAD.Checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="StyleSheet3.css" rel="stylesheet" />
        <div>
            <div class="profile-addtitle">Check Out</div>

            <table id="checkout" style="width: 1000px; margin-top: 3%;" >

                <tr style="font-weight: bold;text-align: center">
                    <th>Artwork</th>
                    <th>Artwork Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Subtotal</th>
                </tr>
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">

                    <ItemTemplate>
                        <tr style="border-style: solid none solid none; border-width: thin; font-weight: bold;border : thin ">
                            <td class="image1"  style="width: 100px; vertical-align: middle;";>
                                <asp:ImageButton ID="Image1" runat="server" ImageUrl='<%# Eval("image")%>'  Width="100px" Height="100px" /></td>
                            <td style="text-align: center; height: 200px;">
								<asp:Label ID="Label1" runat="server" Text='<%# Eval("artworkName")%>'></asp:Label></td>
                            <td style="text-align: center; height: 200px;"><asp:Label ID="Label2" runat="server" Text='<%# Eval("price","${0:0.00}")%>'></asp:Label></td>
							<td style="text-align: center; height: 200px;">
								<asp:Label ID="Label3" runat="server" Text='<%# Eval("quantity")%>'></asp:Label></td>
							<td style="text-align: center; height: 200px;">
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

    <div style ="margin-left:850px">
		<asp:Label ID="Label5" runat="server" Text="Total: "></asp:Label>
    <asp:Label ID="lblTotal" runat="server" text ="total" ></asp:Label>
        </div>
    <div>
	<asp:Button ID="Payment" runat="server" Text="Proceed to Payment" OnClick="Payment_Click"></asp:Button>
    </div>
</asp:Content>
