<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="About_pbsTools.aspx.vb" Inherits="SmartForms.About_pbsTools" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="w3-panel">
        <img src="Images/pbsTools_Transparent.png" alt="Lights" class="w3-image" width="300">
    </div>

    <!-- Grid -->
    <div class="w3-row-padding" id="about">
        <div class="w3-center w3-padding-32">
            <span class="w3-xlarge w3-bottombar w3-border-dark-grey w3-padding-16">Meet pbsTools</span>
        </div>

        <div class="w3-third w3-margin-bottom">
            <div class="w3-card-4">
                <div class="w3-container">
                    <asp:Panel ID="panel_left" runat="server">
                        <h3>Holder</h3>
                        <p></p>
                    </asp:Panel>
                </div>
            </div>
        </div>

        <div class="w3-third w3-margin-bottom">
            <div class="w3-card-4">
                <div class="w3-container">
                    <asp:Panel ID="panel_middle" runat="server">
                        <h3>Holder</h3>
                        <p></p>
                    </asp:Panel>
                </div>
            </div>
        </div>

        <div class="w3-third w3-margin-bottom">
            <div class="w3-card-4">
                <div class="w3-container">
                    <asp:Panel ID="panel_right" runat="server">
                        <h3>Holder</h3>
                        <p></p>
                    </asp:Panel>
                </div>
            </div>
        </div>
    </div>

    <!-- Contact -->
    <div class="w3-center w3-padding-64" id="contact">
        <span class="w3-xlarge w3-bottombar w3-border-dark-grey w3-padding-16">The Gang!</span>
    </div>

<%--    <div class="w3-container" action="/action_page.php" target="_blank">
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
    </div>--%>


</asp:Content>
