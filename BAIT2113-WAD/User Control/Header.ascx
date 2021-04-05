<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="BAIT2113_WAD.User_Control.Header" %>
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
        padding: 0 30px;
        letter-spacing: 0.2px;
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
                <span class="city text">New Notification!</span>
                <span class="city text">New Notification!</span>
                <span class="city text">System Maintainance</span>
                <span class="city text">System Maintainance</span>
                <span class="city text">Start From 12/4/2021</span>
                <span class="city text">Start From 12/4/2021</span>
                <span class="city text">At 3am - 5am</span>
                <span class="city text">At 3am - 5am</span>
                <span class="city text">Whats New?</span>
                <span class="city text">Whats New?</span>
                <span class="city text">Batch Upload Feature Added</span>
                <span class="city text">Batch Upload Feature Added</span>
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