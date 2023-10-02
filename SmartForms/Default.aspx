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
                Love them or hate them we belief that CREA's Web Forms&copy; are here to stay in Canadian Real Estate! 
            </p>
             <p>
                Explore the reasons why this is a good thing and how Smart Forms will leverage this powerful tool. 
            </p>
            <p>
                <a class="btn btn-default" href="About_SmartForms.aspx">Learn More about Smart-Forms! &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Why Smart-Fintrac for your Brokerage?</h2>
            <p>
                Why is Smart-Fintrac different than other applications and offering?
            </p>
            <p>
                Explore how Smart-Fintrac is designed to not just support your brokerage FINTRAC requirements, but be a whole framework for compliance right out of the box!
            </p>
            <p>
                <a class="btn btn-default" href="About_Fintrac.aspx">Learn more about Smart-Fintrac &raquo;</a>
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
