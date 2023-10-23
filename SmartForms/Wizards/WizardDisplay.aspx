<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Wizards/Wizard.Master" CodeBehind="WizardDisplay.aspx.vb" Inherits="SmartForms.WizardDisplay" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainHolder" runat="server">

    <script type="text/javascript" src="Controls/Scripts.js"></script>
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>



    <telerik:RadWizard RenderMode="Lightweight" ID="rwFintrac"
        OnClientLoad="demo.clientLoad"
        OnClientButtonClicking="demo.clientButtonClicking"
        runat="server"
        OnWizardStepCreated="rwFintrac_WizardStepCreated"
        Skin="Silk">
    </telerik:RadWizard>


    <asp:HiddenField ID="hfFormHash" runat="server" />
    <asp:HiddenField ID="hfFormId" runat="server" />
    <asp:HiddenField ID="hfIsValidated" runat="server" />
    <asp:HiddenField ID="hfInvalidList" runat="server" />


</asp:Content>
