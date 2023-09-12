<%@ Page Title="Contact" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.vb" Inherits="SmartForms.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <div class="jumbotron">
        <table style="width: 100%;">
            <tr>
                <td style="width: 150px; vertical-align: top">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/SmartForms_Bar_Trans.png" />
                </td>
                <td style="vertical-align: top">
                    <%-- <h1>pbs Smart Forms</h1>--%>
                </td>
                <td style="vertical-align: top"></td>
            </tr>
        </table>
    </div>


    <address>
        C 101 3088 Croydon Dr<br />
        Surrey, BC V3Z 0T1<br />
        <abbr title="Phone">P:</abbr>
        604.789.8394
    </address>

    <address>
        <strong>Support:</strong><a href="mailto:info@pbstools.ca">Support@example.com</a><br />
        <strong>Marketing:</strong><a href="mailto:info@pbstools.ca">Marketing@example.com</a>
    </address>
</asp:Content>
