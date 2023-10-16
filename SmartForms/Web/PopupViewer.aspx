<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Web/popup.Master" CodeBehind="PopupViewer.aspx.vb" Inherits="SmartForms.PopupViewer" %>

<%@ Register Src="~/Web/Controls/uc_RiskReview.ascx" TagPrefix="uc1" TagName="uc_RiskReview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <uc1:uc_RiskReview runat="server" id="uc_RiskReview" />

</asp:Content>
