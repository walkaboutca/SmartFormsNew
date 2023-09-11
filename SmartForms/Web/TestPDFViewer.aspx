<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Web/forms.Master" CodeBehind="TestPDFViewer.aspx.vb" Inherits="SmartForms.TestPDFViewer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.2.2/pdf.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.2.2/pdf.worker.js"></script>

    <script type="text/javascript">
        window.pdfjsLib.GlobalWorkerOptions.workerSrc = 'https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.2.2/pdf.worker.js';
    </script>

    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Default"></telerik:RadAjaxLoadingPanel>

    <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" Height="200px" Width="300px" LoadingPanelID="RadAjaxLoadingPanel1">
        
    <telerik:RadButton ID="RadButton1" runat="server" Text="RadButton"></telerik:RadButton>

    <telerik:RadLabel ID="rlWarning" runat="server"></telerik:RadLabel>


    </telerik:RadAjaxPanel>


    <telerik:RadAsyncUpload ID="asyncNewDocument" runat="server"
        UploadedFilesRendering="BelowFileInput"
        HideFileInput="True"
        Localization-Select="Select or Drop Contract to Map Here">
    </telerik:RadAsyncUpload>

    <telerik:RadPdfViewer runat="server" ID="RadPdfViewer1" RenderMode="Lightweight" Height="550px" Width="900px">
        <PdfjsProcessingSettings>
        </PdfjsProcessingSettings>
    </telerik:RadPdfViewer>

</asp:Content>
