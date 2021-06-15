<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Web/forms.Master" CodeBehind="FintracForms.aspx.vb" Inherits="SmartForms.FintracForms" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="w3-container">
        <div class="w3-row w3-margin-top">
            <div class="w3-third w3-container">
                <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload1"
                    RenderMode="Lightweight"
                    EnableCustomValidation="true"
                    MultipleFileSelection="Disabled"
                    HideFileInput="true"
                    Skin="Silk"
                    OnFileUploaded="RadAsyncUpload1_FileUploaded">
                </telerik:RadAsyncUpload>

                <div class="w3-panel w3-card">
                    <p>FILE CARD</p>
                    <hr />
                    <table style="width: 100%; font-size: small;">
                        <tr>
                            <td style="padding-top: 3px; padding-bottom: 3px; width: 33.3%">File Title
                            </td>
                            <td style="padding-top: 3px; padding-bottom: 3px; width: 66.3%">
                                <telerik:RadTextBox ID="rtbFileTitle" runat="server" Width="90%"></telerik:RadTextBox>
                            </td>

                        </tr>
                        <tr>
                            <td style="padding-top: 3px; padding-bottom: 3px; width: 33.3%">Agent Name
                            </td>
                            <td style="padding-top: 3px; padding-bottom: 3px; width: 66.3%">
                                <telerik:RadTextBox ID="rtbAgentName" runat="server" Width="90%"></telerik:RadTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-top: 3px; padding-bottom: 3px; width: 33.3%"></td>
                            <td style="padding-top: 3px; padding-bottom: 3px; width: 66.3%"></td>

                        </tr>
                    </table>



                </div>


                <telerik:RadButton ID="rbLoadPdf" runat="server" Text="Load">
                </telerik:RadButton>
            </div>
            <div class="w3-twothird w3-container">
                <telerik:RadPdfViewer ID="RadPdfViewer1" runat="server"  Height="1000px" Width="100%">
                </telerik:RadPdfViewer>
            </div>
        </div>
    </div>

</asp:Content>
