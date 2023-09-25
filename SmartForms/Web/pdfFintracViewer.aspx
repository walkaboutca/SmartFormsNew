<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="pdfFintracViewer.aspx.vb" Inherits="SmartForms.pdfFintracViewer" %>

<%@ Register Src="~/Web/Controls/wz_885326974.ascx" TagPrefix="uc1" TagName="wz_885326974" %>



<!DOCTYPE html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FINTRAC Viewer</title>
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
</head>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.2.2/pdf.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.2.2/pdf.worker.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.2.2/pdf.js"></script>
<script> window.pdfjsLib.GlobalWorkerOptions.workerSrc = 'https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.2.2/pdf.worker.js'; </script>

<script>         
    function getRadWindow() {
        var oWindow = null;
        if (window.radWindow)
            oWindow = window.radWindow;
        else if (window.frameElement.radWindow)
            oWindow = window.frameElement.radWindow;
        return oWindow;
    }

    // Reload parent page
    function refreshParentPage() {
        getRadWindow().BrowserWindow.location.reload();
        getRadWindow().close();
    }
</script>

<body>
    <form id="form1" runat="server">

        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            <Scripts>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js"></asp:ScriptReference>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js"></asp:ScriptReference>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js"></asp:ScriptReference>
            </Scripts>
        </telerik:RadScriptManager>
        <telerik:RadAjaxLoadingPanel ID="loading_Main" runat="server" Skin="Default"></telerik:RadAjaxLoadingPanel>
        <asp:Panel ID="panelTop" runat="server">
            <div class="w3-row">
                <div class="w3-container w3-third w3-padding-small">
                    <p>Select the Fintrac Form to complete.</p>
                </div>
                <div class="w3-container w3-twothird w3-padding-small">
                    <telerik:RadComboBox ID="rcbWhichForm" runat="server" DataSourceID="sqlForms" DataTextField="DisplayName" EmptyMessage="Choose the proper form." DataValueField="HashCode" MarkFirstMatch="True" Width="100%" AutoPostBack="True"></telerik:RadComboBox>
                </div>
            </div>
        </asp:Panel>

        <telerik:RadAjaxPanel ID="ajax_Main" runat="server" LoadingPanelID="loading_Main">
         
            <uc1:wz_885326974 runat="server" ID="wz_885326974" />
            
        </telerik:RadAjaxPanel>
         <asp:HiddenField ID="hfFormId" runat="server" />
         <asp:HiddenField ID="hfWebKitId" runat="server" />



    </form>
    <asp:SqlDataSource ID="sqlForms" runat="server" ConnectionString="<%$ ConnectionStrings:smartData %>"
        SelectCommand="SELECT [HashCode], [DisplayName] FROM [cad_smart].[dbo].[forms_Catalog] WHERE [Vertical] = 'FINTRAC'"></asp:SqlDataSource>

</body>
</html>
