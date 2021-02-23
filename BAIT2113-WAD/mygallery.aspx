<%@ Page Title="" Language="C#" MasterPageFile="~/Gallerion.Master" AutoEventWireup="true" CodeBehind="mygallery.aspx.cs" Inherits="BAIT2113_WAD.mygallary" %>
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td colspan="2">My Gallery</td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2"></td>
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
            <td class="auto-style1">&nbsp;</td>
            <td colspan="2">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="artworkID" DataSourceID="SqlDataSource2">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                        <asp:BoundField DataField="artworkID" HeaderText="artworkID" ReadOnly="True" SortExpression="artworkID" />
                        <asp:BoundField DataField="artworkName" HeaderText="artworkName" SortExpression="artworkName" />
                        <asp:BoundField DataField="artworkDesc" HeaderText="artworkDesc" SortExpression="artworkDesc" />
                        <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />
                        <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                        <asp:BoundField DataField="category" HeaderText="category" SortExpression="category" />
                        <asp:ImageField HeaderText="image" SortExpression="image" DataImageURLField="image"/>
                        <asp:BoundField DataField="artistID" HeaderText="artistID" SortExpression="artistID" />
                    </Columns>
                </asp:GridView>
                <asp:Repeater ID="Repeater1" runat="server">
                </asp:Repeater>
            </td>
        </tr>
    </table>
    
</asp:Content>
