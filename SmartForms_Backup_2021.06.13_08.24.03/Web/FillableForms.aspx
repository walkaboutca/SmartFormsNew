<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Web/forms.Master" CodeBehind="FillableForms.aspx.vb" Inherits="SmartForms.FillableForms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    SELECT FORM:
    <br />
 <%--   <telerik:RadAsyncUpload ID="RadAsyncUpload1" runat="server"
        OnClientFileUploaded="fileUploaded" OnFileUploaded="RadAsyncUpload1_FileUploaded"
        AllowedFileExtensions=".pdf" HideFileInput="true"
        AutoAddFileInputs="false" Localization-Select="Upload And Convert" EnableInlineProgress="false"
        MultipleFileSelection="Disabled" />--%>

    <telerik:RadAsyncUpload ID="RadAsyncUpload1" runat="server" 
        OnClientFileUploaded="RadAsyncUpload1_FileUploaded">

    </telerik:RadAsyncUpload>



    <telerik:RadLabel ID="rlSourceForm" runat="server"></telerik:RadLabel>

    <telerik:RadPdfViewer runat="server" ID="RadPdfViewer1" Height="550px" Width="100%" Scale="0.9">
        <PdfjsProcessingSettings File="../../Document.pdf"></PdfjsProcessingSettings>
    </telerik:RadPdfViewer>



</asp:Content>
