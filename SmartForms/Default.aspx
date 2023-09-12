<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="SmartForms._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

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

    </div>
   
    <div class="row">
        <div class="col-md-4">
            <h2>Introducing pbsTools Smart Forms! </h2>
            <p>
                ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
            A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
            </p>
            <p>
                <a class="btn btn-default" href="Web/FillableForms.aspx">Forms &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Our Roadmap</h2>
            <p>
                NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <asp:Image ID="Image2" runat="server" Height="35px" ImageUrl="~/Images/SmartForms_Fintrac Banner.png" Width="147px" />
            <h2>Fintrac As A Service</h2>
            <p>
                New rules and processes around Fintrac make it more than a Smart Form but a full DMS (Document Managment System) that brokerages and agents are required to maintain. </p>
            <p>
                <a class="btn btn-default" href="Web/FintracDashboard.aspx">Fintrac Dashboard &raquo;</a>

            </p>
        </div>
    </div>

</asp:Content>
