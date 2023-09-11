<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="uc_236589754.ascx.vb" Inherits="SmartForms.uc_236589754" %>

<asp:HiddenField ID="hfFormHash" runat="server" />
<asp:HiddenField ID="hfFormId" runat="server" />

<div>
    <div class="w3-top">
        <div class="w3-bar w3-border w3-light-grey">
            <asp:Button ID="butSubmit" runat="server" class="w3-bar-item w3-button" Text="Submit for Assessment" />
            <asp:Button ID="butSendOffice" runat="server" class="w3-bar-item w3-button w3-right" Text="Send to Office" />
            <asp:Button ID="butDisplayForm" runat="server" class="w3-bar-item w3-button w3-right" Text="Display Form" />
            <asp:Button ID="butSave" runat="server" class="w3-bar-item w3-button w3-right" Text="Save Form" />
        </div>
    </div>
    <br>
    <br>

    <div class="w3-container">
        <p style="font-weight: bold">Individual Identification Information Record</p>
        <hr />
    </div>
</div>
