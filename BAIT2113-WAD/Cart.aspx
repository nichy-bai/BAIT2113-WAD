<%@ Page Title="" Language="C#" MasterPageFile="~/Gallerion.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="BAIT2113_WAD.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <link href="StyleSheet3.css" rel="stylesheet" />

    <div class="profile-box">
        <div class="profile-detail">

            <asp:Image ID="profilepic" runat="server" class="profile-pic" />

            <span class="profile-detail-label">name</span>
            <asp:Label ID="lblCustomerName" runat="server" CssClass="profile-detail-text"></asp:Label>

            <span class="profile-detail-label">user id</span>
            <asp:Label ID="lblCustomerID" runat="server" CssClass="profile-detail-text"></asp:Label>

            <span class="profile-detail-label">date of birth</span>
            <asp:Label ID="lbldob" runat="server" CssClass="profile-detail-text"></asp:Label>

            <span class="profile-detail-label">phone</span>
            <asp:Label ID="lblphone" runat="server" CssClass="profile-detail-text"></asp:Label>

            <span class="profile-detail-label">email</span>
            <asp:Label ID="lblemail" runat="server" CssClass="profile-detail-text"></asp:Label>

            <span class="profile-detail-label">address</span>
            <asp:Label ID="lbladdress" runat="server" CssClass="profile-detail-text"></asp:Label>

            <a href="Profile.aspx" class="profile-btn">Profile Details</a>
            <a href="Wishlist.aspx" class="profile-btn">Wishlist</a>
            <a href="Cart.aspx" class="profile-btn-active">Shopping Cart</a>
            <a href="PurchaseHistory.aspx" class="profile-btn">Purchase History</a>
        </div>

        <div>
            <div class="profile-addtitle">Shopping Cart</div>

            <%--<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" CssClass="profile-gridview" OnRowCommand="GridView1_RowCommand">
                <Columns>
                   <asp:BoundField DataField="No" HeaderText="No" SortExpression="No" ReadOnly="True" />
                    <asp:BoundField DataField="artworkID" HeaderText="artworkID" SortExpression="artworkID" />
                    <asp:BoundField DataField="artworkID" HeaderText="artworkID" SortExpression="artworkID" ItemStyle-Width="200px" />
                    <asp:TemplateField HeaderText="Artwork ID">
                        <ItemTemplate>
                            <asp:Label ID="artworkID" runat="server" Text='<%#Eval("artworkID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:ImageField HeaderText="image" SortExpression="image" DataImageURLField="image" ItemStyle-Width="200px" ItemStyle-Height="200px" ControlStyle-Height="200" ControlStyle-Width="200" />
                    <asp:BoundField DataField="artworkName" HeaderText="artworkName" SortExpression="artworkName" ItemStyle-Width="200px" />
                    <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" ItemStyle-Width="200px" />
                    <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity"  ItemStyle-Width="200px"/>
                   <asp:BoundField DataField="subtotal" HeaderText="subtotal" ReadOnly="True" SortExpression="subtotal" />
                    <asp:TemplateField HeaderText="Subtotal">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Convert.ToInt32(Eval("quantity"))* Convert.ToDouble(Eval("price")) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandName="delete_Button">Delete</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>--%>
            <table style="width:100%; border:hidden; border-collapse: collapse">
                            <tr style="width:100%; background-color:lightgrey">
                                <td style="text-align:center;width:200px;">Image</td>
                                <td style="text-align:center;width:150px;">Artwork Name</td>
                                <td style="text-align:center;width:150px;">Price</td>
                                <td style="text-align:center;width:150px;">Quantity</td>
                                <td style="text-align:center;width:150px;">Subtotal</td>
                                <td> </td>
                            </tr>
                 </table>
            <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="DataList1_ItemCommand">

                <ItemTemplate>
                    <table style="width:100%; border:hidden; border-collapse: collapse">
                            <tr style="width:100%">
                                <td>
                                    <asp:Label ID="artworkID" runat="server" Visible="false" Text='<%# Eval("artworkID") %>'></asp:Label>
                                    <asp:Image ID="image" runat="server" ImageUrl='<%# Eval("image") %>' Height="200px" Width="200px"/>
                                </td>
                                <td>
                                    <asp:Label ID="artworkName" runat="server" Width="200px" Text='<%# Eval("artworkName") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="price" runat="server" Width="150px" Text='<%# String.Format("$ {0:0.00}", Eval("price")) %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="quantity" runat="server" Width="150px" Text='<%# Eval("quantity") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="subtotal" runat="server" Width="150px" Text='<%# String.Format("$ {0:0.00}", Eval("subtotal")) %>'></asp:Label>
                                </td>
                                <td>
                                    <%--<asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="delete_Button" />--%>
                                    <%--<asp:LinkButton ID="linkButtonDelete" runat="server" CommandName="deleteButton">Delete</asp:LinkButton>--%>
                                    <asp:Button ID="deleteSingleRow" runat="server" CommandName="deleteButton" Text="×" CssClass="delete-btn" Width="20px" Height="20px" BackColor="White" Font-Size="Large"/>
                                </td>
                        </tr>
                        </table>
                </ItemTemplate>
            </asp:DataList>
            <br />
            <asp:Button ID="Delete" runat="server" Text="Clear All" OnClick="Delete_Click" CssClass="delete-btn" Width="150px" Height="26px" BackColor="White" Font-Size="Medium"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="addMoreItems" runat="server" Text="Add More Items" OnClick="addMoreItems_Click" CssClass="delete-btn" Width="150px" Height="30px" BackColor="Black" ForeColor="White" BorderStyle="None" Font-Size="Medium"/>
            <asp:Button ID="ProceedToCheckout" runat="server" Text="Proceed to Checkout" OnClick="Payment_Click" CssClass="delete-btn" Width="150px" Height="30px" BackColor="Black" ForeColor="White" BorderStyle="None" Font-Size="Medium" CommandArgument='<%# Eval("customerID") %>'></asp:Button>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT artworkID, image, artworkName, price, quantity, quantity * price AS subtotal FROM Cart WHERE (customerID = @customerID)" DeleteCommand="DELETE FROM [Cart] WHERE [No] = @No" InsertCommand="INSERT INTO [Cart] ([No], [artworkID], [image], [artworkName], [price], [quantity], [subtotal]) VALUES (@No, @artworkID, @image, @artworkName, @price, @quantity, @subtotal)" UpdateCommand="UPDATE [Cart] SET [artworkID] = @artworkID, [image] = @image, [artworkName] = @artworkName, [price] = @price, [quantity] = @quantity, [subtotal] = @subtotal WHERE [No] = @No">
                <DeleteParameters>
                    <asp:Parameter Name="No" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="No" Type="Int32" />
                    <asp:Parameter Name="artworkID" Type="String" />
                    <asp:Parameter Name="image" Type="String" />
                    <asp:Parameter Name="artworkName" Type="String" />
                    <asp:Parameter Name="price" Type="String" />
                    <asp:Parameter Name="quantity" Type="Decimal" />
                    <asp:Parameter Name="subtotal" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="customerID" SessionField="CustomerID" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="artworkID" Type="String" />
                    <asp:Parameter Name="image" Type="String" />
                    <asp:Parameter Name="artworkName" Type="String" />
                    <asp:Parameter Name="price" Type="String" />
                    <asp:Parameter Name="quantity" Type="Decimal" />
                    <asp:Parameter Name="subtotal" Type="String" />
                    <asp:Parameter Name="No" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>

    </div>
</asp:Content>
