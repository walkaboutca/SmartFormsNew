<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Web/forms.Master" CodeBehind="FintracDashboard.aspx.vb" Inherits="SmartForms.FintracDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="w3-row-padding w3-center w3-margin-top">
        <div class="w3-third">
            <div class="w3-card w3-container" style="min-height: 460px">
                <telerik:RadComboBox ID="rcbForm" runat="server" RenderMode="Lightweight" Width="100%" Font-Size="Small">
                </telerik:RadComboBox>

            </div>
        </div>

        <div class="w3-twothird">
            <div class="w3-card w3-container" style="min-height: 460px">
            </div>
        </div>
    </div>


</asp:Content>
