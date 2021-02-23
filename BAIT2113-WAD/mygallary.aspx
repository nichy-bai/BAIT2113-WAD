<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="mygallary.aspx.cs" Inherits="BAIT2113_WAD.mygallary" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 300px;
        }
        .auto-style2 {
            width: 300px;
            height: 31px;
        }
        .auto-style3 {
            height: 31px;
        }
        .propic{
            border-radius:50%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="auto-style1" rowspan="4">
                <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource3">
                    <ItemTemplate>
                        <asp:Image ID="profilepic" runat="server" class="propic" ImageUrl="profilePic"/>
                    </ItemTemplate>
                </asp:Repeater>
                <br />
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [profilePic] FROM [Artist] WHERE ([artistID] = @artistID)">
                    <SelectParameters>
                        <asp:SessionParameter Name="artistID" SessionField="ArtistID" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:Label ID="lblArtistName" runat="server"></asp:Label> <br />
                <asp:Label ID="lblArtistID" runat="server"></asp:Label><br />
                <asp:Label ID="lbldob" runat="server"></asp:Label><br />
                <asp:Label ID="lblArtworkID" runat="server"></asp:Label><br />
                <asp:Label ID="lblphone" runat="server"></asp:Label><br />
                <asp:Label ID="lblemail" runat="server"></asp:Label><br />
                &nbsp;<asp:HyperLink ID="HyperLink1" runat="server" Target="_blank">Watch Me</asp:HyperLink><br />
                &nbsp;<a href="mygallary.aspx">My Gallary</a><br />
                &nbsp;<a href="newartwork.aspx">Add New Artwork</a>
            </td>
            <td colspan="2">My Gallery</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">Select the category:
                <asp:DropDownList ID="ddlshowctg" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="category" DataValueField="category" Height="32px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Artwork] WHERE ([artistID] = @artistID)">
                    <SelectParameters>
                        <asp:SessionParameter Name="artistID" SessionField="ArtistID" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Artwork] WHERE [artworkID] = @artworkID" InsertCommand="INSERT INTO [Artwork] ([artworkID], [artworkName], [artworkDesc], [quantity], [price], [category], [image], [artistID]) VALUES (@artworkID, @artworkName, @artworkDesc, @quantity, @price, @category, @image, @artistID)" SelectCommand="SELECT * FROM [Artwork] WHERE ([category] = @category)" UpdateCommand="UPDATE [Artwork] SET [artworkName] = @artworkName, [artworkDesc] = @artworkDesc, [quantity] = @quantity, [price] = @price, [category] = @category, [image] = @image, [artistID] = @artistID WHERE [artworkID] = @artworkID">
                    <DeleteParameters>
                        <asp:Parameter Name="artworkID" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="artworkID" Type="String" />
                        <asp:Parameter Name="artworkName" Type="String" />
                        <asp:Parameter Name="artworkDesc" Type="String" />
                        <asp:Parameter Name="quantity" Type="Decimal" />
                        <asp:Parameter Name="price" Type="Decimal" />
                        <asp:Parameter Name="category" Type="String" />
                        <asp:Parameter Name="image" Type="String" />
                        <asp:Parameter Name="artistID" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlshowctg" Name="category" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="artworkName" Type="String" />
                        <asp:Parameter Name="artworkDesc" Type="String" />
                        <asp:Parameter Name="quantity" Type="Decimal" />
                        <asp:Parameter Name="price" Type="Decimal" />
                        <asp:Parameter Name="category" Type="String" />
                        <asp:Parameter Name="image" Type="String" />
                        <asp:Parameter Name="artistID" Type="String" />
                        <asp:Parameter Name="artworkID" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
            <td class="auto-style3"></td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="artworkID" DataSourceID="SqlDataSource2">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                        <asp:BoundField DataField="artworkID" HeaderText="artworkID" ReadOnly="True" SortExpression="artworkID" ItemStyle-Width="200px" />
                        <asp:BoundField DataField="artworkName" HeaderText="artworkName" SortExpression="artworkName" ItemStyle-Width="200px" />
                        <asp:BoundField DataField="artworkDesc" HeaderText="artworkDesc" SortExpression="artworkDesc" ItemStyle-Width="200px" />
                        <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" ItemStyle-Width="200px" />
                        <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" ItemStyle-Width="200px" />
                        <asp:BoundField DataField="category" HeaderText="category" SortExpression="category" ItemStyle-Width="200px"/>
                        <asp:ImageField HeaderText="image" SortExpression="image" DataImageURLField="" ItemStyle-Width="200px" />
                        <asp:BoundField DataField="artistID" HeaderText="artistID" SortExpression="artistID" ItemStyle-Width="200px" />
                    </Columns>
                </asp:GridView>
                <asp:Repeater ID="Repeater1" runat="server">
                </asp:Repeater>
            </td>
        </tr>
    </table>
    
</asp:Content>
