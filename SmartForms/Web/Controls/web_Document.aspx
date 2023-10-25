<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="web_Document.aspx.vb" Inherits="SmartForms.web_Document" %>


<script type="text/javascript">
    function closeWin() {
        GetRadWindow().close();
    }
    function GetRadWindow() {
        var oWindow = null; if (window.radWindow)
            oWindow = window.radWindow; else if (window.frameElement.radWindow)
            oWindow = window.frameElement.radWindow; return oWindow;
    }
    function getRadParent() {
        var oWindow = null;
        if (window.radWindow)
            oWindow = window.radWindow;
        else if (window.frameElement.radWindow)
            oWindow = window.frameElement.radWindow;
        return oWindow;
    }

    // Reload parent page
    function refreshParentPage() {
        getRadParent().BrowserWindow.location.reload();
        getRadParent().close();
    }
</script>

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
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
   <form id="form1" runat="server">
<%--    <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
    <telerik:RadSkinManager ID="RadSkinManager1" runat="server" ShowChooser="true" />--%>
     <script type="text/javascript" src="scripts.js"></script>
       <telerik:RadWizard RenderMode="Lightweight" ID="rwDisplay" 
            runat="server" 
            OnWizardStepCreated="rwDisplay_WizardStepCreated" >
        </telerik:RadWizard>
      
       </form>
</body>
</html>
