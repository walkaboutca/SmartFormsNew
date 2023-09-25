<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="pdfViewer.aspx.vb" Inherits="SmartForms.pdfViewer" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.2.2/pdf.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.2.2/pdf.worker.js"></script>
</head>



<body>
    <form id="form1" runat="server">

        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            <scripts>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js">
                </asp:ScriptReference>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js">
                </asp:ScriptReference>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js">
                </asp:ScriptReference>
            </scripts>
        </telerik:RadScriptManager>

        <div>
            <telerik:RadPdfViewer ID="radpdf" runat="server" Height="1000px" Scale="Telerik.Web.UI.PdfViewer.Scale" Width="800px"></telerik:RadPdfViewer>
        </div>
    </form>
</body>
</html>
