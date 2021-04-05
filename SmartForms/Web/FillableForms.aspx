<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Web/forms.Master" CodeBehind="FillableForms.aspx.vb" Inherits="SmartForms.FillableForms" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br /><br />
    <div class="row">
        <div class="col-md-4">
            <telerik:RadButton ID="RadButton1" runat="server" Text="RadButton">
            </telerik:RadButton>
        </div>
        <div class="col-md-4">
           
            <telerik:RadGrid ID="rgFields" runat="server" RenderMode="Lightweight"></telerik:RadGrid>

        </div>
        <div class="col-md-4">
            <telerik:RadPdfViewer ID="pdfFormView" runat="server"></telerik:RadPdfViewer>
        </div>
    </div>



</asp:Content>
