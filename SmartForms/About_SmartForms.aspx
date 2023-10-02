<%@ Page Title="About" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About_SmartForms.aspx.vb" Inherits="SmartForms.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="w3-panel">
        <img src="Images/SmartForms_Bar_Trans.png" alt="Lights" class="w3-image" style="width: 260px;">
    </div>

    <!-- Grid -->
    <div class="w3-row-padding" id="about">
        <div class="w3-center w3-padding-32">
            <span class="w3-xlarge w3-bottombar w3-border-dark-grey w3-padding-16">Smart Form Three Pillars</span>
        </div>

        <div class="w3-third w3-margin-bottom">
            <div class="w3-card-4">
                <div class="w3-container">
                    <asp:Panel ID="panel_left" runat="server">
                    <h3>CREA Web Forms&copy; is cool!</h3>
                    <p>Web Forms is here to stay ... and that is not a bad thing.</p>
                    <p>Real Estate, like so many industries, is facing the spectre of change. Oversite, Segradation of Duties, Media Storm, AI, GDPR ... it's all coming.</p>
                    <p>As are the costs of both staying current and relevant, or often worse, the cost of doing nothing.</p>
                    </asp:Panel>
                </div>
            </div>
        </div>

        <div class="w3-third w3-margin-bottom">
            <div class="w3-card-4">
                <div class="w3-container">
                    <asp:Panel ID="panel_middle" runat="server">
                    <h3>Compliance is comming!</h3>
                    <p>The days of an industry pretending it can isolate itself off and run any old way it chooses are gone.</p>
                    <p>Real Estate is not immune!</p>
                    <p>
                        We have seen a greater and greater requirement to 'comply' with best practices for all businesses in Canada, 
                        particularly where that business intersects with the public.
                    </p>
                    <p>What industry is more intertwined with the public interests than Real Estate and the purchase of homes?</p>
                    </asp:Panel>
                </div>
            </div>
        </div>

        <div class="w3-third w3-margin-bottom">
            <div class="w3-card-4">
                <div class="w3-container">
                    <asp:Panel ID="panel_right" runat="server">
                    <h3>As A Service is a thing!</h3>
                    <p>If COVID taught us anything is was that we are not locked into tradional ways of doing most businesses.</p>
                    <p></p>
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

    <!-- Footer -->

<%--    <footer class="w3-container w3-padding-32 w3-light-grey w3-center">
        <h4>Footer</h4>
        <a href="#" class="w3-button w3-black w3-margin"><i class="fa fa-arrow-up w3-margin-right"></i>To the top</a>
        <div class="w3-xlarge w3-section">
            <i class="fa fa-facebook-official w3-hover-opacity"></i>
            <i class="fa fa-instagram w3-hover-opacity"></i>
            <i class="fa fa-snapchat w3-hover-opacity"></i>
            <i class="fa fa-pinterest-p w3-hover-opacity"></i>
            <i class="fa fa-twitter w3-hover-opacity"></i>
            <i class="fa fa-linkedin w3-hover-opacity"></i>
        </div>
        <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" title="W3.CSS" target="_blank" class="w3-hover-text-green">w3.css</a></p>
    </footer>
--%>

</asp:Content>
