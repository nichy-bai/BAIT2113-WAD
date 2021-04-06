<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CHeader.ascx.cs" Inherits="BAIT2113_WAD.User_Control.CHeader" %>
<style type="text/css">
    .auto-style2 {
        background-color: #000;
        height: 35px;
    }

    .auto-style3 {
        width: 1615px;
        border: none;
        color: #fff;
        font-size: 16px;
        letter-spacing: 1px;
    }

    .auto-style4 {
        width: 900px;
        text-align: right;
        border: none;
        font-size: 16px;
        color: #fff;
        padding: 0 25px;
    }
    .text {
        margin-left: 80px;
    }
</style>
<div border-bottom:"double">
    <script src="https://www.w3schools.com/lib/w3.js"></script>

    <table style="width: 100%;border-collapse:collapse;" >
        <tr class="auto-style2">
            <td class="auto-style3">
                <span class="city text">Coming Soon!</span>
                <span class="city text">Coming Soon!</span>
                <span class="city text">5.5 Big Sales</span>
                <span class="city text">5.5 Big Sales</span>
                <span class="city text">Only One Day</span>
                <span class="city text">Only One Day</span>
                <span class="city text">Start from 12am - 12pm</span>
                <span class="city text">Start from 12am - 12pm</span>
                <span class="city text">What Promotion?</span>
                <span class="city text">What Promotion?</span>
                <span class="city text">50% Offer for Specific Artwork</span>
                <span class="city text">50% Offer for Specific Artwork</span>
                <span class="city text">Yeah</span>
                <span class="city text">Yeah ＼(＾O＾)／</span>
                <span class="city text">Yeah ＼(＾o＾)／</span>
                <span class="city text">Yeah ＼(＾O＾)／</span>
                <span class="city text">Yeah ＼(＾o＾)／</span>
            </td>
            <td class="auto-style4">
                You logged on at&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label> &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
    </table>
    <script>
        w3.slideshow(".city");
    </script>
</div>
