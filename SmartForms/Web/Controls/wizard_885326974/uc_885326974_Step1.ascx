<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="uc_885326974_Step1.ascx.vb" Inherits="SmartForms.uc_885326974_Step1" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
    html, body, h1, h2, h3, h4, h5, h6 {
        font-family: "Roboto", sans-serif
    }

    p {
        font-size: small;
    }

    html .RadSearchBox .rsbInput {
        height: 20px;
    }

    .table-style {
        width: 100%;
        font-size: small;
        vertical-align: top;
    }

    .td-style {
        vertical-align: top;
    }
</style>

    <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>

    <asp:HiddenField ID="hfSeller1" runat="server" />
    <asp:HiddenField ID="hfSeller2" runat="server" />
    <asp:HiddenField ID="hfSeller3" runat="server" />

    <div class="w3-row">
        <div class="w3-twothird w3-container w3-padding-small">
            Drop a Listing Contract or CPS here to import a new Web Kit:<br />
            <small>(As long as you have saved a Listing Contract or the Contract for Sale or Purchase as an 'Editable PDF' we can parse the data from it to create you FINTRAC Kit without re-entering the data.<br />
                An approach to CREA is in the works to have access to your Web Kits in this UI which will automate this part of the process.)</small>
        </div>
        <div class="w3-third w3-container w3-padding-small">

            <telerik:RadAsyncUpload ID="asyncNewDocument" runat="server"
                UploadedFilesRendering="BelowFileInput"
                HideFileInput="True"
                Localization-Select="Select or Drop PDF Here">
            </telerik:RadAsyncUpload>
            <br />
            <telerik:RadButton ID="RadButton1" runat="server" Text="Import" Font-Size="Small" Skin="Black"></telerik:RadButton>

        </div>
    </div>
    <hr />
    <div class="w3-row-padding">
        <div class="w3-quarter w3-container w3-padding-small">
            Contract Date:
        </div>
        <div class="w3-quarter w3-container w3-padding-small">
            <telerik:RadTextBox ID="rtbContractDate" runat="server" RenderMode="Lightweight" Width="90%"></telerik:RadTextBox>
        </div>
        <div class="w3-quarter w3-container w3-padding-small">
            MLS No:
        </div>
        <div class="w3-quarter w3-container w3-padding-small">
            <telerik:RadTextBox ID="rtbMLSNo" runat="server" RenderMode="Lightweight" Width="90%"></telerik:RadTextBox>
        </div>
    </div>
    <div class="w3-row-padding">
        <div class="w3-quarter w3-container w3-padding-small">
            Web Kit Title:
        </div>
        <div class="w3-threequarter w3-container w3-padding-small">
            <telerik:RadTextBox ID="rtbFileName" runat="server" RenderMode="Lightweight" Width="90%"></telerik:RadTextBox>
        </div>
    </div>
    <div class="w3-row-padding">
        <div class="w3-quarter w3-container w3-padding-small">
            Address 1 / 2:
        </div>
        <div class="w3-threequarter w3-container w3-padding-small">
            <telerik:RadTextBox ID="rtbAddress" runat="server" RenderMode="Lightweight" Width="90%"></telerik:RadTextBox>
        </div>
    </div>
    <div class="w3-row-padding">
        <div class="w3-quarter w3-container w3-padding-small">
            &nbsp;&nbsp;&nbsp;
        </div>
        <div class="w3-threequarter w3-container w3-padding-small">
            <telerik:RadTextBox ID="rtbAddAddress" runat="server" RenderMode="Lightweight" Width="90%"></telerik:RadTextBox>
        </div>
    </div>
    <div class="w3-row-padding">
        <div class="w3-quarter w3-container w3-padding-small">
            City:
        </div>
        <div class="w3-quarter w3-container w3-padding-small">
            <telerik:RadTextBox ID="rtbCity" runat="server" RenderMode="Lightweight" Width="100%"></telerik:RadTextBox>
        </div>
        <div class="w3-quarter w3-container w3-padding-small">
            Province:
        </div>
        <div class="w3-quarter w3-container w3-padding-small">
            <telerik:RadTextBox ID="rtbProvince" runat="server" RenderMode="Lightweight" Width="50%"></telerik:RadTextBox>
        </div>
    </div>
    <div class="w3-row-padding">
        <div class="w3-quarter w3-container w3-padding-small">
            Postal Code:
        </div>
        <div class="w3-quarter w3-container w3-padding-small">
            <telerik:RadTextBox ID="rtbPCode" runat="server" RenderMode="Lightweight" Width="50%"></telerik:RadTextBox>
        </div>
        <div class="w3-quarter w3-container w3-padding-small">
        </div>
        <div class="w3-quarter w3-container w3-padding-small">
        </div>
    </div>
    <div class="w3-row-padding">
        <div class="w3-quarter w3-container w3-padding-small">
            <telerik:RadButton ID="rbSave" runat="server" Text="Save"></telerik:RadButton>
            &nbsp;&nbsp;&nbsp;
                <telerik:RadButton ID="rbClose" runat="server" Text="Close"></telerik:RadButton>
        </div>
        <div class="w3-quarter w3-container w3-padding-small">
        </div>
        <div class="w3-quarter w3-container w3-padding-small">
        </div>
        <div class="w3-quarter w3-container w3-padding-small">
        </div>
    </div>

