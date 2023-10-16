<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="About_Fintrac.aspx.vb" Inherits="SmartForms.About_Fintrac" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

        <div class="w3-panel">
            <div class="w3-row-padding">
                <div class="w3-left w3-padding-16">
                    <div style="float: left">
                        <img src="Images/SmartForms_Bar_Trans.png" alt="Lights" class="w3-image"" width="200">
                    </div>                   
                </div>
            </div>
        </div>

    <!-- Grid -->
    <div class="w3-row-padding" id="about">
        <div class="w3-center w3-padding-16">
            <span class="w3-xlarge w3-bottombar w3-border-dark-grey w3-padding-16">Our '3 Pillars' of Smart Fintrac</span>
        </div>

        <div class="w3-center w3-padding-16">
            <h3>Compliance is comming!</h3>
            <p>The days of an industry pretending it can isolate itself off and run any old way it chooses are gone.</p>
            <p>Real Estate is not immune!</p>
            <p>
                We have seen a greater and greater requirement to 'comply' with best practices for all businesses in Canada, 
                        particularly where that business intersects with the public.
            </p>
            <p>What industry is more intertwined with the public interests than Real Estate and the purchase of homes?</p>
        </div>
        <div class="w3-third w3-margin-bottom">
            <div class="w3-card-4">
                <div class="w3-container">
                    <asp:Panel ID="panel_left" runat="server">
                    <h3>Type Nothing Twice!</h3>
                        <p>
                            The bain of agents always ... re-typing client or contract information they have already just typed into Web Forms!</p>
                        <p>Thats the 'Smart' in Smart-Fintrac. As long as you follow one simple step while saving or editting your Web Forms, we can save you all that extra typing!</p>
                        <p.>And, on our road map, right at the top, is a direct connection to Web Forms that will even do away with the exra step.</p.>
                        <p>What is it worth to you to 'type nothing twice'?</p>
                    <p></p>
                    </asp:Panel>
                </div>
            </div>
        </div>

        <div class="w3-third w3-margin-bottom">
            <div class="w3-card-4">
                <div class="w3-container">
                    <asp:Panel ID="panel_middle" runat="server">
                    <h3>Be Easier To Do, Than Not Do!</h3>
                        <p>Nothing is easier to do than nothing! But that isn't the reality of FINTRAC. 
                            Brokers have to enforce it, agent have to do it.</p>
                        <p>How hard it has to be ... that we can adjust!</p>
                        <p>Smart-Fintrac makes the assumtion that 90+% of all your deals are relatively sraightforward, standard contracts.</p>
                        <p>If you observe Pillar one, 90% of your agetn side FINTRAC compliance can be completed in well under 1 minute!</p>
                    <p></p>
                    
                    </asp:Panel>
                </div>
            </div>
        </div>

        <div class="w3-third w3-margin-bottom">
            <div class="w3-card-4">
                <div class="w3-container">
                    <asp:Panel ID="panel_right" runat="server">
                    <h3>Do Only What Needs Doing!!</h3>
                    <p>Love them or hate them Web Forms are here to stay!</p>
                    <p>Smart-Fintrac is predicated on CREAs definition of FINTRAC compliance for Real Estate, as delivered through Web Forms.</p>
                        <p>Every effort in Smart-Fintrac is designed to complete and save the appropriate Web Form(s), properly and no more.</p>
                        <p>Smart-Fintrac will do everything required to be FINTRAC Compliant ... but doing more than is required is time we'd rather you use to do Real Estate!</p>
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
    <div class="w3-margin-bottom">

        &nbsp;&nbsp;

    </div>



</asp:Content>
