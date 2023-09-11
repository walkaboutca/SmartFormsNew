<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Web/forms.Master" CodeBehind="FillableForms.aspx.vb" Inherits="SmartForms.FillableForms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        window.pdfjsLib.GlobalWorkerOptions.workerSrc = 'https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.2.2/pdf.worker.js';
        function pageLoad(app, args) {
            var upload = $find('<%= RadAsyncUpload1.ClientID %>');
            $telerik.$(upload.get_element()).find("input[type='file']").attr("accept", ".docx, .rtf, .html, .txt, .xlsx, .csv");
        }
    </script>



    <div class="w3-row">
        <div class="w3-half w3-container">
            <p>SELECT FORM:</p>
        </div>
        <div class="w3-half w3-container">
            <telerik:RadAsyncUpload ID="RadAsyncUpload1" runat="server"
                OnFileUploaded="RadAsyncUpload1_FileUploaded"
                AllowedFileExtensions=".pdf,.docx,.rtf,.html,.txt,.xlsx,.csv" HideFileInput="true"
                AutoAddFileInputs="false" 
                Localization-Select="Upload And Convert" 
                EnableInlineProgress="false"
                MultipleFileSelection="Disabled" />
            <br />

            <telerik:RadButton runat="server" ID="rbSave" Text="Submit File" AutoPostBack="true" Skin="Black" />

        </div>
    </div>
    <hr />
       
    <telerik:RadLabel ID="rlSourceForm" runat="server"></telerik:RadLabel>

    <telerik:RadPdfViewer ID="pdfViewer" runat="server" Height="1200px" RenderMode="Lightweight" 
        Scale="Telerik.Web.UI.PdfViewer.Scale" Width="1000px">

    </telerik:RadPdfViewer>


</asp:Content>
