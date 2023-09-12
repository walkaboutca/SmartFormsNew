<%@ Page Title="About" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.vb" Inherits="SmartForms.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
      <div class="jumbotron">
        <table style="width: 100%;">
            <tr>
                <td style="width: 150px; vertical-align: top">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/SmartForms_Bar_Trans.png" />
                </td>
                <td style="vertical-align: top">
                   <%-- <h1>pbs Smart Forms</h1>--%>
                </td>
                <td style="vertical-align: top">

                </td>
            </tr>
        </table>
        PBS Tools ... who are we?
    </div>
</asp:Content>
