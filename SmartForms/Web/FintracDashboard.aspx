<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Web/forms.Master" CodeBehind="FintracDashboard.aspx.vb" Inherits="SmartForms.FintracDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="w3-row-padding w3-center w3-margin-top">
        <div class="w3-third">
            <div class="w3-card w3-container" style="min-height: 460px">
                Form Management
                <br /><br />

                <telerik:RadButton ID="rbFintracForms" runat="server" Text="Go" PostBackUrl="~/Web/FintracForms.aspx"></telerik:RadButton>
            </div>
        </div>

        <div class="w3-third">
            <div class="w3-card w3-container" style="min-height: 460px">
                Property Forms
                <br /><br />

                <telerik:RadButton ID="rbFintracProperty" runat="server" Text="Go" PostBackUrl="~/Web/PropertyFintrac.aspx"></telerik:RadButton>
            </div>
        </div>
        <div class="w3-third">
            <div class="w3-card w3-container" style="min-height: 460px">
                Future
                
            </div>
        </div>
    </div>


</asp:Content>
