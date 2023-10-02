<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="About_Fintrac.aspx.vb" Inherits="SmartForms.About_Fintrac" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

        <div class="w3-panel">
        <img src="Images/SmartForms_Bar_Trans.png" alt="Lights" class="w3-image" style="width: 260px;">
    </div>

    <!-- Grid -->
    <div class="w3-row-padding" id="about">
        <div class="w3-center w3-padding-32">
            <span class="w3-xlarge w3-bottombar w3-border-dark-grey w3-padding-16">Our '3 Pillars' of Smart Fintrac</span>
        </div>

        <div class="w3-third w3-margin-bottom">
            <div class="w3-card-4">
                <div class="w3-container">
                    <asp:Panel ID="panel_left" runat="server">
                        <h3>Type Nothing Twice!</h3>
                        <p>
                            Love them or hate them we believe that CREA's Web Forms&copy; are here to stay in Canadian Real Estate! 
                        </p>
                        <p>
                            CREA has 'negotiated' a framework for compliance for Real Estate and published that compliance in a series of Web Forms.
                        </p>
                        <p>
                            In effect, CREA has said 'if you fill out these Web Forms and file them properly you WILL be Fintrac Compliant!'
                        </p>
                        <p>We believe we distinguish ourselves from our competitors by building a 'type once' bridge between Web Forms and Smart Forms.</p>
                    </asp:Panel>
                </div>
            </div>
        </div>

        <div class="w3-third w3-margin-bottom">
            <div class="w3-card-4">
                <div class="w3-container">
                    <asp:Panel ID="panel_middle" runat="server">
                        <h3>Why Smart-Fintrac for your Brokerage?</h3>
                        <p>
                            Why is Smart-Fintrac different than other applications and offering?
                        </p>
                        <p>
                            Explore how Smart-Fintrac is designed to not just support your brokerage FINTRAC requirements, but be a whole framework for compliance right out of the box!
                        </p>
                        <p>
                            <a class="btn btn-default" href="#">Learn more &raquo;</a>
                        </p>
                    </asp:Panel>
                </div>
            </div>
        </div>

        <div class="w3-third w3-margin-bottom">
            <div class="w3-card-4">
                <div class="w3-container">
                    <asp:Panel ID="panel_right" runat="server">
                        <h3>Fintrac As A Service</h3>
                        <p>
                            New rules and processes around Fintrac make it more than a Smart Form but a full DMS (Document Managment System) that brokerages and agents are required to maintain.
                        </p>
                        <p>
                            <a class="btn btn-default" href="Web/FintracDashboard.aspx">Fintrac Dashboard &raquo;</a>

                        </p>
                    </asp:Panel>
                </div>
            </div>
        </div>
    </div>

    <!-- Contact -->
    <div class="w3-center w3-padding-64" id="contact">
        <span class="w3-xlarge w3-bottombar w3-border-dark-grey w3-padding-16">Contact Us</span>
    </div>

    <div class="w3-container" action="/action_page.php" target="_blank">
        <div class="w3-section">
            <label>Name</label>
            <input class="w3-input w3-border w3-hover-border-black" style="width: 100%;" type="text" name="Name" required>
        </div>
        <div class="w3-section">
            <label>Email</label>
            <input class="w3-input w3-border w3-hover-border-black" style="width: 100%;" type="text" name="Email" required>
        </div>
        <div class="w3-section">
            <label>Subject</label>
            <input class="w3-input w3-border w3-hover-border-black" style="width: 100%;" name="Subject" required>
        </div>
        <div class="w3-section">
            <label>Message</label>
            <input class="w3-input w3-border w3-hover-border-black" style="width: 100%;" name="Message" required>
        </div>
        <button type="submit" class="w3-button w3-block w3-black">Send</button>
    </div>




</asp:Content>
