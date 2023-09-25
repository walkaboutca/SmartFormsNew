<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="wz_885326974.ascx.vb" Inherits="SmartForms.wz_885326974" %>

<style>
    html, body, h1, h2, h3, h4, h5, h6 {
        font-family: "Roboto", sans-serif
    }

    p {
        font-size: small;
        margin: 2px;
        padding: 2px;
    }

    html .RadSearchBox .rsbInput {
        height: 20px;
    }

    .table-style {
        width: 100%;
        font-size: small;
        vertical-align: top;
    }

    .td-style {
        vertical-align: top;
    }
</style>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.2.2/pdf.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.2.2/pdf.worker.js"></script>
<script>
    window.pdfjsLib.GlobalWorkerOptions.workerSrc = 'https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.2.2/pdf.worker.js';
</script>

<script>         
    function getRadWindow() {
        var oWindow = null;
        if (window.radWindow)
            oWindow = window.radWindow;
        else if (window.frameElement.radWindow)
            oWindow = window.frameElement.radWindow;
        return oWindow;
    }

    // Reload parent page
    function refreshParentPage() {
        getRadWindow().BrowserWindow.location.reload();
    }
</script>

<asp:HiddenField ID="hfFormHash" runat="server" />
<asp:HiddenField ID="hfFormId" runat="server" />

<div>

    <div class="w3-bar w3-border w3-light-grey w3-padding-small">
        <asp:Button ID="butSubmit" runat="server" class="w3-bar-item w3-button" Text="Submit for Assessment" />
        <asp:Button ID="butSave" runat="server" class="w3-bar-item w3-button w3-right" Text="Save" />
        <asp:Button ID="butSendOffice" runat="server" class="w3-bar-item w3-button w3-right" Text="Send to Office" />
    </div>
    <div class="w3-top w3-bottombar w3-border-grey w3-light-grey">
        <div class="w3-container">
            <table style="width: 100%; font-size: small;">
                <tr>
                    <td style="vertical-align: top">
                        <telerik:RadComboBox ID="rcbWhatForm" runat="server" Font-Size="Small" Width="90%">
                            <Items>
                                <telerik:RadComboBoxItem runat="server" Selected="True" Text="Indivdual IIR" Value="IndivdualIIR" />
                                <telerik:RadComboBoxItem runat="server" Text="Coperate IIR" Value="CoperateIIR" />
                            </Items>
                        </telerik:RadComboBox>
                        <br />
                        <telerik:RadCheckBox ID="rcbShowMobile" runat="server" Text="Send Mobile Identity Invitation"></telerik:RadCheckBox>
                        <br />
                        <asp:Panel ID="panelMobileIdentity" runat="server" BorderStyle="Solid" BorderWidth="1" BorderColor="Silver" Visible="False" Width="90%">
                            <table class="w3-table" style="font-size: small">
                                <tr>
                                    <td style="width: 100px">Send EMail:</td>
                                    <td>
                                        <telerik:RadTextBox ID="rtbEmail" runat="server" Font-Size="Small"></telerik:RadTextBox></td>
                                    <td>Send</td>
                                </tr>
                                <tr>
                                    <td style="width: 100px">Send Text:</td>
                                    <td style="width: 100px">
                                        <telerik:RadTextBox ID="rtbPhone" runat="server" Font-Size="Small" EmptyMessage="Only Test No"></telerik:RadTextBox></td>
                                    <td>
                                        <asp:LinkButton ID="lbSendText" runat="server">Send Text </asp:LinkButton></td>
                                </tr>
                            </table>
                        </asp:Panel>

                    </td>
                    <td style="text-align: right; vertical-align: top">
                        <telerik:RadAsyncUpload ID="asyncNewDocument" runat="server"
                            UploadedFilesRendering="BelowFileInput"
                            HideFileInput="True"
                            Localization-Select="Select or Drop PDF Here">
                        </telerik:RadAsyncUpload>
                        <div style="padding: 3px 0px 3px 0px">
                            <telerik:RadButton ID="RadButton1" runat="server" Text="Import" Font-Size="x-Small" Skin="Black"></telerik:RadButton>
                            <br />
                            <div style="color: #CC0000">This will overwrite the currently saved data!</div>
                        </div>


                    </td>
                </tr>
            </table>
        </div>
    </div>
    <br />
    <telerik:RadWizard ID="rwIdentification" runat="server" Skin="Material" Font-Size="Small">
        <WizardSteps>
            <telerik:RadWizardStep ID="step_Verification" runat="server" Title=" ">
                <p><strong>Individual Identification Information Record</strong></p>
                <p>
                    NOTE: An Individual Identification Information Record is required by the Proceeds of Crime (Money Laundering) and Terrorist Financing Act. This Record must be completed by the REALTOR® member whenever they act in respect to the purchase or sale of real estate. It is recommended that the Individual Identification Information Record be completed:
                <br />
                    &nbsp;&nbsp;&nbsp;&nbsp; (i) for a buyer when the offer is submitted and/or a deposit made, and 
                <br />
                    &nbsp;&nbsp;&nbsp;&nbsp; (ii) for a seller when the seller accepts the offer.
                </p>
                <p>Transaction Property Address:</p>
                <div class="w3-row">
                    <div class="w3-col m2 w3-padding-small">
                        <telerik:RadTextBox ID="txtp_streetnum" runat="server" EmptyMessage="Street Num" Width="100%"></telerik:RadTextBox>
                    </div>
                    <div class="w3-col m4 w3-padding-small">
                        <telerik:RadTextBox ID="txtp_street" runat="server" EmptyMessage="Street" Width="100%"></telerik:RadTextBox>
                    </div>
                    <div class="w3-col m2 w3-padding-small">
                        <telerik:RadTextBox ID="txtp_unitNumber" runat="server" EmptyMessage="Unit Num" Width="100%"></telerik:RadTextBox>
                    </div>
                    <div class="w3-col m4 w3-padding-small">
                        <telerik:RadTextBox ID="txtp_city" runat="server" EmptyMessage="City" Width="100%"></telerik:RadTextBox>
                    </div>
                </div>
                <div class="w3-row">
                    <div class="w3-col m2 w3-padding-small">
                        <telerik:RadTextBox ID="txtProvince" runat="server" EmptyMessage="Province" Width="100%"></telerik:RadTextBox>
                    </div>
                    <div class="w3-col m2 w3-padding-small">
                        <telerik:RadTextBox ID="txtp_zipcode" runat="server" EmptyMessage="P Code" Width="100%"></telerik:RadTextBox>
                    </div>
                    <div class="w3-col m8 w3-padding-small">
                        <telerik:RadTextBox ID="txtpropAddrLine2" runat="server" EmptyMessage="Add Address" Width="100%"></telerik:RadTextBox>
                    </div>
                </div>
                <p>Brokerage Details:</p>
                <div class="w3-row">
                    <div class="w3-col m6 w3-padding-small">
                        <telerik:RadTextBox ID="txtAgent" runat="server" EmptyMessage="Brokerage Agent Name(s) (seperate with ,)" Width="100%"></telerik:RadTextBox>
                    </div>
                    <div class="w3-col m6 w3-padding-small">
                        <telerik:RadTextBox ID="txtBroker" runat="server" EmptyMessage="Brokerage Name" Width="100%"></telerik:RadTextBox>
                    </div>
                </div>
                <p>Date Verified:<small>(Information or Credit File)</small></p>
                <div class="w3-row">
                    <div class="w3-col m2 w3-padding-small">
                        <telerik:RadTextBox ID="txttodaysDated1_yyyy" runat="server" EmptyMessage="Year (yyyy)" Width="100%"></telerik:RadTextBox>
                    </div>
                    <div class="w3-col m2 w3-padding-small">
                        <telerik:RadTextBox ID="txttodaysDated1_mmmm" runat="server" EmptyMessage="Month (mm)" Width="100%"></telerik:RadTextBox>
                    </div>
                    <div class="w3-col m2 w3-padding-small">
                        <telerik:RadTextBox ID="txttodaysDated1_d" runat="server" EmptyMessage="Day (dd)" Width="100%"></telerik:RadTextBox>
                    </div>
                    <div class="w3-col m2 w3-padding-small">
                        <telerik:RadDatePicker ID="rdpVerifiedDate" runat="server" DateInput-EmptyMessage="Select Date"></telerik:RadDatePicker>
                    </div>
                    <div class="w3-col m2 w3-padding-small">
                    </div>
                    <div class="w3-col m2 w3-padding-small">
                    </div>
                </div>
            </telerik:RadWizardStep>
            <telerik:RadWizardStep ID="step_HeaderInfo" runat="server" Title=" ">
                <p><strong>A. Verification of Individual</strong></p>
                <p>
                    NOTE: One of Section A.1, A.2. or A.3 must be completed for your individual clients or unrepresented individuals that are not clients, but are parties to the transaction
                    (e.g. unrepresented buyer or seller). Where you are unable to identify an unrepresented individual, complete section A.4. Note this might trigger sending a Suspicious Transaction Report to FINTRAC.
                    ALL efforts shoud be made to Identify you client properly.
                </p>
                <p>Transaction Property Address:</p>
                <div class="w3-row">
                    <div class="w3-col m6 w3-padding-small">
                        <telerik:RadTextBox ID="txtindividualName" runat="server" EmptyMessage="Individual Name" Width="100%"></telerik:RadTextBox>
                    </div>
                    <div class="w3-col m6 w3-padding-small">
                        <telerik:RadDateInput ID="txtindividualDOB" runat="server" EmptyMessage="DOB (yyyy-mm-dd)" DisplayDateFormat="yyyy-MM-dd" Culture="en-CA" MinDate="1900-01-01" Width="160px"></telerik:RadDateInput>
                    </div>
                </div>
                <div class="w3-row">
                    <div class="w3-col m6 w3-padding-small">
                        <telerik:RadTextBox ID="txtindividualAddress1" runat="server" EmptyMessage="Individual Address" Width="100%"></telerik:RadTextBox>
                    </div>
                </div>
                <div class="w3-row">
                    <div class="w3-col m6 w3-padding-small">
                        <telerik:RadTextBox ID="txtindividualAddress2" runat="server" EmptyMessage="Addional Address" Width="100%"></telerik:RadTextBox>
                    </div>
                </div>
                <div class="w3-row">
                    <div class="w3-col m6 w3-padding-small">
                        <telerik:RadButton RenderMode="Lightweight" ID="rbGovernmentId" runat="server" ToggleType="Radio" ButtonType="StandardButton" Checked="true" GroupName="StandardButton">
                            <ToggleStates>
                                <telerik:RadButtonToggleState Text="A.1 Federal/Provincial/Territorial Government-Issued Photo ID" PrimaryIconCssClass="p-i-radio-checked"></telerik:RadButtonToggleState>
                                <telerik:RadButtonToggleState Text="A.1 Federal/Provincial/Territorial Government-Issued Photo ID" PrimaryIconCssClass="p-i-radio"></telerik:RadButtonToggleState>
                            </ToggleStates>
                        </telerik:RadButton>
                    </div>
                    <div class="w3-col m6 w3-padding-small">
                        <telerik:RadCheckBox ID="rcbShowAllSteps" runat="server" Text="Show All Wizard Steps" RenderMode="Lightweight" AutoPostBack="False"></telerik:RadCheckBox>
                    </div>
                </div>
                <div class="w3-row">
                    <div class="w3-col m6 w3-padding-small">
                        <telerik:RadButton RenderMode="Lightweight" ID="rbCreditMethod" runat="server" ToggleType="Radio" ButtonType="StandardButton" GroupName="StandardButton">
                            <ToggleStates>
                                <telerik:RadButtonToggleState Text="A.2 Credit File Method" PrimaryIconCssClass="p-i-radio-checked"></telerik:RadButtonToggleState>
                                <telerik:RadButtonToggleState Text="A.2 Credit File Method" PrimaryIconCssClass="p-i-radio"></telerik:RadButtonToggleState>
                            </ToggleStates>
                        </telerik:RadButton>
                    </div>
                </div>
                <div class="w3-row">
                    <div class="w3-col m6 w3-padding-small">
                        <telerik:RadButton RenderMode="Lightweight" ID="rbDualIdMethod" runat="server" ToggleType="Radio" GroupName="StandardButton" ButtonType="StandardButton">
                            <ToggleStates>
                                <telerik:RadButtonToggleState Text="A.3 Dual ID Process Method" PrimaryIconCssClass="p-i-radio-checked"></telerik:RadButtonToggleState>
                                <telerik:RadButtonToggleState Text="A.3 Dual ID Process Method" PrimaryIconCssClass="p-i-radio"></telerik:RadButtonToggleState>
                            </ToggleStates>
                        </telerik:RadButton>
                    </div>
                </div>
                <div class="w3-row">
                    <div class="w3-col m6 w3-padding-small">
                        <telerik:RadButton RenderMode="Lightweight" ID="rbUnidentified" runat="server" ToggleType="Radio" GroupName="StandardButton" ButtonType="StandardButton">
                            <ToggleStates>
                                <telerik:RadButtonToggleState Text="A.4 Unrepresented Individual Reasonable Measures Record (if applicable)" PrimaryIconCssClass="p-i-radio-checked"></telerik:RadButtonToggleState>
                                <telerik:RadButtonToggleState Text="A.4 Unrepresented Individual Reasonable Measures Record (if applicable)" PrimaryIconCssClass="p-i-radio"></telerik:RadButtonToggleState>
                            </ToggleStates>
                        </telerik:RadButton>
                    </div>
                </div>
            </telerik:RadWizardStep>
            <telerik:RadWizardStep ID="step_GovernmentId" runat="server" Title=" ">
                <p><strong>A.1 Federal/Provincial/Territorial Government-Issued Photo ID</strong></p>
                <p>
                    Ascertain the individual’s identity by comparing the individual to their photo ID. The individual must be physically present unless using technology capable of
                    assessing a government-issued photo identification document’s authenticity.
                </p>
                <p>Transaction Property Address:</p>
                <div class="w3-row">
                    <div class="w3-col m6 w3-padding-small">
                        <telerik:RadTextBox ID="txtidDocument" runat="server" EmptyMessage="Type of ID Document" Width="100%"></telerik:RadTextBox>
                    </div>
                    <div class="w3-col m6 w3-padding-small">
                        <telerik:RadTextBox ID="txtdocIdentifierNumber" runat="server" EmptyMessage="Doc ID Number" Width="100%"></telerik:RadTextBox>
                    </div>
                </div>
                <div class="w3-row">
                    <div class="w3-col m6 w3-padding-small">
                        <telerik:RadTextBox ID="txtissuingJurisdiction" runat="server" EmptyMessage="Issuing Jurisdiction" Width="100%"></telerik:RadTextBox>
                    </div>
                    <div class="w3-col m6 w3-padding-small">
                        <telerik:RadTextBox ID="txtissuingCountry" runat="server" EmptyMessage="Issuing Jurisdiction" Width="100%"></telerik:RadTextBox>
                    </div>
                </div>
                <div class="w3-row">
                    <div class="w3-col m6 w3-padding-small">
                        <telerik:RadDateInput ID="txtDocExpDate" runat="server" EmptyMessage="Doc Expiry (yyyy-mm-dd)" DisplayDateFormat="yyyy-MM-dd" Culture="en-CA" MinDate="1900-01-01"></telerik:RadDateInput>
                    </div>
                    <div class="w3-col m6 w3-padding-small">
                        <div style="width: 35%; font-size: x-small;">(must be valid and not expired)</div>
                    </div>
                </div>
                <hr />
                <p>Electronic / Remote Identification - Only Remote Identifaction applications approved by the brokerage can be used!</p>
                <div class="w3-row">
                    <div class="w3-col m6 w3-padding-small">
                        <telerik:RadComboBox ID="rcbRemoteIdentification" runat="server" EmptyMessage="Select Remote ID App" Font-Size="Small" Width="75%" RenderMode="Lightweight">
                            <Items>
                                <telerik:RadComboBoxItem runat="server" Text="Fintracker" Value="Fintracker" />
                                <telerik:RadComboBoxItem runat="server" Text="Really Trusted" Value="ReallyTrusted" />
                            </Items>
                        </telerik:RadComboBox>
                    </div>
                    <div class="w3-col m6 w3-padding-small">
                        <div class="w3-row">
                            <div class="w3-col m6 w3-padding-small">
                                What Risk is returned?
                            </div>
                            <div class="w3-col m6 w3-padding-small">
                                <telerik:RadRadioButtonList ID="rbList" runat="server" RenderMode="Lightweight">
                                    <Items>
                                        <telerik:ButtonListItem Text="Low" Value="Low" />
                                        <telerik:ButtonListItem Text="Medium" Value="Medium" />
                                        <telerik:ButtonListItem Text="High" Value="High" />
                                    </Items>
                                </telerik:RadRadioButtonList>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="w3-row">
                    <div class="w3-col m6 w3-padding-small">
                        UPLOAD Remote Identification Report 
                    </div>
                    <div class="w3-col m6 w3-padding-small">
                        <telerik:RadAsyncUpload ID="asyncRemoteId" runat="server"
                            UploadedFilesRendering="BelowFileInput"
                            HideFileInput="True"
                            Localization-Select="Select or Drop PDF Here">
                        </telerik:RadAsyncUpload>
                    </div>
                </div>
            </telerik:RadWizardStep>

            <telerik:RadWizardStep ID="step_CreditFile" runat="server" Title=" ">
                <p><strong>A.2 Credit File Method</strong></p>
                <p>
                   Ascertain the individual’s identity by comparing the individual’s name, date of birth and address information above to information in a Canadian credit file that has
                    been in existence for at least three years and is derived from more than one source. If any of the information does not match, you will need to use another method
                    to ascertain client identity. Consult the credit file at the time you ascertain the individual’s identity. The individual does not need to be physically present.
                </p>
            </telerik:RadWizardStep>
            <telerik:RadWizardStep ID="step_DualId" runat="server" Title=" ">
                <p><strong>A.3 Dual ID Process Method</strong></p>
                <p>
                     Complete two of the following three checkboxes by ascertaining the individual’s identity by referring to information in two independent, reliable, sources. Each
                    source must be well known and reputable (e.g., federal, provincial, territorial and municipal levels of government, crown corporations, financial entities or utility
                    providers). The individual does not need to be physically present.
                </p>
            </telerik:RadWizardStep>

            <telerik:RadWizardStep ID="step_UnrepresentedParty" runat="server" Title=" ">
                <p><strong>A.4 Unrepresented Individual Reasonable Measures Record</strong></p>
                <p>
                     (if applicable)&nbsp;&nbsp; Only complete this section when you are unable to ascertain the identity of an unrepresented individual.
                </p>
            </telerik:RadWizardStep>

            <telerik:RadWizardStep ID="step_ThirdParty" runat="server" Title=" ">
                <p><strong>B. Verification of Third Parties</strong></p>
                <p>
                    NOTE: Only complete Section B for your clients. Take reasonable measures to determine whether your clients are acting on behalf of third parties by
                    completing this section of the form. If you are not able to determine whether your clients are acting on behalf of a third party but there are reasonable
                    grounds to suspect there are, complete Section B.1. If there is a third party, complete Section B.2.
                </p>
                <p style="font-weight: bold">B.1 Third Party Reasonable Measures</p>
                 <div class="w3-row">
                    <div class="w3-col w3-padding-small">
                        <telerik:RadRadioButtonList ID="rrbTransConductedBehalfClient" runat="server">
                            <Items>
                                <telerik:ButtonListItem Text="YES the transaction IS being conducted on behalf of a third party according to the client." Value="Yes" />
                                <telerik:ButtonListItem Text="NO the transaction is NOT being conducted on behalf of a third party according to the client." Value="No" />
                            </Items>
                        </telerik:RadRadioButtonList>
                    </div>
                </div>
                 <div class="w3-row">
                     <div class="w3-col w3-padding-small">
                         <p>Describe why you think  your client may be acting on behalf of a third party</p>
                        <telerik:RadTextBox ID="txtReasonActingOn" runat="server" Width="100%"></telerik:RadTextBox>
                     </div>
                </div>          
            </telerik:RadWizardStep>
            
            <telerik:RadWizardStep ID="step_ThirdPartIdent" runat="server" Title=" ">
                <p style="font-weight: bold">B.2 Third Party Record</p>
                <p>Where there is a third party, complete this section.</p>
                <div class="w3-row">
                    <div class="w3-col m6 w3-padding-small">
                        <telerik:RadTextBox ID="txtthirdPartyName" runat="server" EmptyMessage="Name of other entity" Width="100%"></telerik:RadTextBox>
                    </div>
                    <div class="w3-col m6 w3-padding-small">
                        <telerik:RadTextBox ID="txtthirdPartyAddress2" runat="server" EmptyMessage="Telephone Number" Width="100%"></telerik:RadTextBox>
                    </div>
                </div>
                <div class="w3-row">
                   <div class="w3-col m6 w3-padding-small">
                        <telerik:RadTextBox ID="txtthirdPartyAddress1" runat="server" EmptyMessage="Address" Width="100%"></telerik:RadTextBox>
                    </div>
                     <div class="w3-col m6 w3-padding-small">
                         <telerik:RadDateInput ID="txtthirdPartyDOB" runat="server" EmptyMessage="DOB (when app. (yyyy-mm-dd))" DisplayDateFormat="yyyy-MM-dd" Culture="en-CA" MinDate="1900-01-01" Width="75%"></telerik:RadDateInput>
                     </div>
                </div>
                <div class="w3-row">
                    <p>Nature of Principle Business or Occupation</p>
                    <div class="w3-col m6 w3-padding-small">
                        <telerik:RadTextBox ID="txtthirdPartyBusinessOccupation1" runat="server" EmptyMessage="Principal Business or Occupation" Width="100%"></telerik:RadTextBox><br />
                    </div>
                    <div class="w3-col m6 w3-padding-small">
                        <telerik:RadTextBox ID="txtthirdPartyBusinessOccupation2" runat="server" EmptyMessage="Additional" Width="100%"></telerik:RadTextBox>
                    </div>
                </div>
                <div class="w3-row">
                        <p>Registration or incorporation number, and jurisdiction and country that issued that number (if applicable)</p>
                    <div class="w3-col m6 w3-padding-small">
                        <telerik:RadTextBox ID="txtthirdPartyIncorporationNumber1" runat="server" EmptyMessage="Registration or Incorporation No" Width="100%"></telerik:RadTextBox><br />
                    </div>
                    <div class="w3-col m6 w3-padding-small">
                        <telerik:RadTextBox ID="txtthirdPartyIncorporationNumber2" runat="server" EmptyMessage="Issuing Jurisdiction" Width="100%"></telerik:RadTextBox>
                    </div>
                </div>
                <div class="w3-row">
                    <p>Relationship between third party and client</p>
                    <div class="w3-col m6 w3-padding-small">
                        <telerik:RadTextBox ID="RadTextBox5" runat="server" EmptyMessage="Third Party relationship" Width="100%"></telerik:RadTextBox><br />
                    </div>
                    <div class="w3-col m6 w3-padding-small">
                        <telerik:RadTextBox ID="RadTextBox6" runat="server" EmptyMessage="Additional" Width="100%"></telerik:RadTextBox>
                    </div>
                </div>
            </telerik:RadWizardStep>
            <telerik:RadWizardStep ID="step_WrapUp" runat="server" Title=" ">
                <p><strong>Review and Submit the Individual Identifcation Form</strong></p>
                <p>
                    Notes
                </p>
                <telerik:RadButton ID="rbReviewDoc" runat="server" Text="RadButton"></telerik:RadButton>
            </telerik:RadWizardStep>
        </WizardSteps>
    </telerik:RadWizard>

<%--EXTRA CODE--%>
<%--    <div>
        <p style="font-weight: bold">A.2 Credit File Method</p>

        <p>
            Ascertain the individual’s identity by comparing the individual’s name, date of birth and address information above to information in a Canadian credit file that has
                    been in existence for at least three years and is derived from more than one source. If any of the information does not match, you will need to use another method
                    to ascertain client identity. Consult the credit file at the time you ascertain the individual’s identity. The individual does not need to be physically present.
        </p>
        <table style="width: 100%; font-size: small;">
            <tr>
                <td style="width: 30%">Name of Canadian Credit Bureau Holding the Credit File::
                </td>
                <td style="width: 35%">
                    <telerik:RadTextBox ID="txtcreditBureau1" runat="server" EmptyMessage="Individual Name" Width="100%"></telerik:RadTextBox>
                </td>
                <td style="width: 35%"></td>

            </tr>
            <tr>
                <td style="width: 30%"></td>
                <td style="width: 35%">
                    <telerik:RadTextBox ID="txtcreditBureau2" runat="server" EmptyMessage="Address" Width="100%"></telerik:RadTextBox>
                </td>
                <td style="width: 35%"></td>
            </tr>
            <tr>
                <td style="width: 30%">Reference Number of Credit File:
                </td>
                <td style="width: 35%">
                    <telerik:RadTextBox ID="txtcreditBureauRefNum" runat="server" EmptyMessage="Add. Address" Width="100%"></telerik:RadTextBox>
                </td>
                <td style="width: 35%"></td>
            </tr>
        </table>
        <p style="font-weight: bold">A.3 Dual ID Process Method</p>

        <p>
            Complete two of the following three checkboxes by ascertaining the individual’s identity by referring to information in two independent, reliable, sources. Each
                    source must be well known and reputable (e.g., federal, provincial, territorial and municipal levels of government, crown corporations, financial entities or utility
                    providers). The individual does not need to be physically present.
        </p>
        <table style="width: 100%; font-size: small; text-align: left;">
            <tr>
                <td style="width: 40px">
                    <telerik:RadCheckBox ID="chkOpt_dualID2" runat="server" AutoPostBack="False"></telerik:RadCheckBox>
                </td>
                <td>Confirm the individual’s name and date of birth by referring to a document or source containing the individual’s name and date of birth*
                </td>

            </tr>
        </table>
        <table style="font-size: small;" class="auto-style1">
            <tr>
                <td style="width: 30%">&nbsp;&nbsp;&nbsp; - Name of Source:
                </td>
                <td style="width: 35%">
                    <telerik:RadTextBox ID="txtsourceName1" runat="server" EmptyMessage="Source Name" Width="100%"></telerik:RadTextBox>
                </td>
                <td style="width: 35%"></td>

            </tr>
            <tr>
                <td style="width: 30%">&nbsp;&nbsp;&nbsp; - Account Number**:
                </td>
                <td style="width: 35%">
                    <telerik:RadTextBox ID="txtBillNumber1" runat="server" EmptyMessage="Acct Num" Width="100%"></telerik:RadTextBox>
                </td>
                <td style="width: 35%"></td>
            </tr>
        </table>

        <table style="width: 100%; font-size: small; text-align: left;">
            <tr>
                <td style="width: 40px">
                    <telerik:RadCheckBox ID="chkOpt_dualID3" runat="server" AutoPostBack="False"></telerik:RadCheckBox>
                </td>
                <td>Confirm the individual’s name and address by referring to a document or source containing the individual’s name and address*
                </td>

            </tr>
        </table>
        <table style="font-size: small;" class="auto-style1">
            <tr>
                <td style="width: 30%">&nbsp;&nbsp;&nbsp; - Name of Source:
                </td>
                <td style="width: 35%">
                    <telerik:RadTextBox ID="txtsourceName2" runat="server" EmptyMessage="Source Name" Width="100%"></telerik:RadTextBox>
                </td>
                <td style="width: 35%"></td>

            </tr>
            <tr>
                <td style="width: 30%">&nbsp;&nbsp;&nbsp; - Account Number**:
                </td>
                <td style="width: 35%">
                    <telerik:RadTextBox ID="txtBillNumber2" runat="server" EmptyMessage="Accy Num" Width="100%"></telerik:RadTextBox>
                </td>
                <td style="width: 35%"></td>
            </tr>
        </table>

        <table style="width: 100%; font-size: small; text-align: left;">
            <tr>
                <td style="width: 40px">
                    <telerik:RadCheckBox ID="checkboxhold3" runat="server" AutoPostBack="False"></telerik:RadCheckBox>
                </td>
                <td>Confirm the individuals’ name and confirm a financial account*
                </td>

            </tr>
        </table>
        <table style="font-size: small;" class="auto-style1">
            <tr>
                <td style="width: 30%">&nbsp;&nbsp;&nbsp; - Name of Source:
                </td>
                <td style="width: 35%">
                    <telerik:RadTextBox ID="txtsourceName3" runat="server" EmptyMessage="Source Name" Width="100%"></telerik:RadTextBox>
                </td>
                <td style="width: 35%"></td>

            </tr>
            <tr>
                <td style="width: 30%">&nbsp;&nbsp;&nbsp; - Financial Account Type:
                </td>
                <td style="width: 35%">
                    <telerik:RadTextBox ID="txtacctType" runat="server" EmptyMessage="Acct Type" Width="100%"></telerik:RadTextBox>
                </td>
                <td style="width: 35%"></td>
            </tr>
            <tr>
                <td style="width: 30%">&nbsp;&nbsp;&nbsp; - Account Number**:
                </td>
                <td style="width: 35%">
                    <telerik:RadTextBox ID="txtBillNumber3" runat="server" EmptyMessage="Acct Num" Width="100%"></telerik:RadTextBox>
                </td>
                <td style="width: 35%"></td>
            </tr>
        </table>
        <p style="font-size: x-small">*See CREA’s FINTRAC materials on REALTOR Link® for examples. ** Or reference number if there is no account number.</p>

        <p style="font-weight: bold">A.4 Unrepresented Individual Reasonable Measures Record</p>

        <p>
            (if applicable)&nbsp;&nbsp; Only complete this section when you are unable to ascertain the identity of an unrepresented individual.
        </p>
        <table style="width: 100%; font-size: small; text-align: left;">
            <tr>
                <td style="width: 40px"></td>
                <td>
                    <strong>1. Measures taken to Ascertain Identity</strong> (check one):
                </td>
            </tr>
            <tr>
                <td style="width: 40px">
                    <telerik:RadCheckBox ID="chkOpt_ascertainIdentity" runat="server" AutoPostBack="False"></telerik:RadCheckBox>
                </td>
                <td>Asked unrepresented individual for information to ascertain their identity
                </td>
            </tr>
        </table>
        <table style="font-size: small;" class="auto-style1">
            <tr>
                <td style="width: 30%">
                    <telerik:RadCheckBox ID="chkOpt_reasonsMeasuresUnsccessful" runat="server" AutoPostBack="False"></telerik:RadCheckBox>
                    &nbsp;&nbsp;&nbsp;Other, Explain:
                </td>
                <td style="width: 35%">
                    <telerik:RadTextBox ID="txtascertainIdentityExplain1" runat="server" EmptyMessage="Explain" Width="100%"></telerik:RadTextBox>
                </td>
                <td style="width: 35%"></td>
            </tr>
            <tr>
                <td style="width: 30%"></td>
                <td style="width: 35%">
                    <telerik:RadTextBox ID="txtascertainIdentityExplain2" runat="server" EmptyMessage="Add Explain" Width="100%"></telerik:RadTextBox>
                </td>
                <td style="width: 35%"></td>
            </tr>
            <tr>
                <td style="width: 30%">Date on which above measures taken:
                </td>
                <td style="width: 35%">
                    <telerik:RadDatePicker ID="rdpascertainIdentityDate" runat="server"></telerik:RadDatePicker>
                </td>
                <td style="width: 35%"></td>
            </tr>
        </table>

        <table style="width: 100%; font-size: small; text-align: left;">
            <tr>
                <td style="width: 40px"></td>
                <td>
                    <strong>2. Reasons why measures were unsuccesful</strong> (check one):
                </td>
            </tr>
            <tr>
                <td style="width: 40px">
                    <telerik:RadCheckBox ID="RadCheckBox1" runat="server" AutoPostBack="False"></telerik:RadCheckBox>
                </td>
                <td>Unrepresented individual did not provide information
                </td>
            </tr>
        </table>
        <table style="font-size: small;" class="auto-style1">
            <tr>
                <td style="width: 30%">
                    <telerik:RadCheckBox ID="RadCheckBox2" runat="server" AutoPostBack="False"></telerik:RadCheckBox>
                    &nbsp;&nbsp;&nbsp;Other, Explain:
                </td>
                <td style="width: 35%">
                    <telerik:RadTextBox ID="RadTextBox1" runat="server" EmptyMessage="Explain" Width="100%"></telerik:RadTextBox>
                </td>
                <td style="width: 35%"></td>
            </tr>
            <tr>
                <td style="width: 30%"></td>
                <td style="width: 35%">
                    <telerik:RadTextBox ID="RadTextBox2" runat="server" EmptyMessage="Add Explain" Width="100%"></telerik:RadTextBox>
                </td>
                <td style="width: 35%"></td>
            </tr>
        </table>

        <p style="font-weight: bold">B. Verification of Third Parties</p>

        <p>
            NOTE: Only complete Section B for your clients. Take reasonable measures to determine whether your clients are acting on behalf of third parties by
                    completing this section of the form. If you are not able to determine whether your clients are acting on behalf of a third party but there are reasonable
                    grounds to suspect there are, complete Section B.1. If there is a third party, complete Section B.2.
        </p>
        <p style="font-weight: bold">B.1 Third Party Reasonable Measures</p>
        <table style="width: 100%; font-size: small; text-align: left;">
            <tr>
                <td style="width: 40px"></td>
                <td>
                    <strong>Is the transaction being conducted on behalf of a third party according to the client?</strong> (check one):
                </td>
            </tr>
            <tr>
                <td style="width: 40px"></td>
                <td>
                    <telerik:RadCheckBox ID="chkOpt_transConductedBehalfClient" runat="server" AutoPostBack="False"></telerik:RadCheckBox>
                    &nbsp;&nbsp; Yes<br />
                    <telerik:RadCheckBox ID="RadCheckBox9" runat="server" AutoPostBack="False"></telerik:RadCheckBox>
                    &nbsp;&nbsp; No
                </td>
            </tr>
            <tr>
                <td style="width: 40px"></td>
                <td>
                    <strong>Describe why you think your client may be acting on behalf a third party:</strong>
                </td>
            </tr>
            <tr>
                <td style="width: 40px"></td>
                <td>
                    <telerik:RadTextBox ID="txtreasonsMeasuresUnsuccessful1" runat="server" Width="100%"></telerik:RadTextBox><br />
                    <telerik:RadTextBox ID="txtreasonsMeasuresUnsuccessful2" runat="server" Width="100%"></telerik:RadTextBox>
                </td>
            </tr>
        </table>
        <p style="font-weight: bold">B.2 Third Party Record</p>
        <p>Where there is a third party, complete this section.</p>
        <table class="table-style">
        </table>
        <p>C. <strong>C. Client Risk</strong> (ask your Compliance Officer if this section is applicable)</p>

        <p>
            Determine the level of risk of a money laundering or terrorist financing offence for this client by determining the appropriate cluster of client in your policies and
                    procedures manual this client falls into and checking one of the checkboxes below:
        </p>
        <p><strong>Low Risk</strong></p>
        <table style="width: 100%; font-size: small; text-align: left;">
            <tr>
                <td style="width: 40px"></td>
                <td>
                    <telerik:RadCheckBox ID="RadCheckBox7" runat="server" AutoPostBack="False"></telerik:RadCheckBox>
                    &nbsp;&nbsp; Canadian Citizen or Resident Physically Present<br />
                    <telerik:RadCheckBox ID="RadCheckBox10" runat="server" AutoPostBack="False"></telerik:RadCheckBox>
                    &nbsp;&nbsp; Canadian Citizen or Resident Not Physically Present<br />
                    <telerik:RadCheckBox ID="RadCheckBox11" runat="server" AutoPostBack="False"></telerik:RadCheckBox>
                    &nbsp;&nbsp; Canadian Citizen or Resident – High Crime Area – No Other Higher Risk Factors Evident<br />
                    <telerik:RadCheckBox ID="RadCheckBox12" runat="server" AutoPostBack="False"></telerik:RadCheckBox>
                    &nbsp;&nbsp; Foreign Citizen or Resident that does not Operate in a High Risk Country (physically present or not)<br />
                    <telerik:RadCheckBox ID="RadCheckBox8" runat="server" AutoPostBack="False"></telerik:RadCheckBox>
                    &nbsp;&nbsp; Other, explain;
                </td>
            </tr>
            <tr>
                <td style="width: 40px"></td>
                <td>
                    <telerik:RadTextBox ID="txtlowRiskExplain" runat="server" Width="100%" TextMode="MultiLine"></telerik:RadTextBox>
                </td>
            </tr>
        </table>
        <p><strong>Medium Risk</strong></p>
        <table style="width: 100%; font-size: small; text-align: left;">
            <tr>
                <td style="width: 40px"></td>
                <td>
                    <telerik:RadCheckBox ID="RadCheckBox17" runat="server" AutoPostBack="False"></telerik:RadCheckBox>
                    &nbsp;&nbsp; Other, explain;
                </td>
            </tr>
            <tr>
                <td style="width: 40px"></td>
                <td>
                    <telerik:RadTextBox ID="txtmedRiskExplain" runat="server" Width="100%" TextMode="MultiLine"></telerik:RadTextBox>
                </td>
            </tr>
        </table>
        <p><strong>High Risk</strong></p>
        <table style="width: 100%; font-size: small; text-align: left;">
            <tr>
                <td style="width: 40px"></td>
                <td>
                    <telerik:RadCheckBox ID="RadCheckBox16" runat="server" AutoPostBack="False"></telerik:RadCheckBox>
                    &nbsp;&nbsp; Foreign Citizen or Resident that operates in a High Risk Country (physically present or not)<br />
                    <telerik:RadCheckBox ID="RadCheckBox18" runat="server" AutoPostBack="False"></telerik:RadCheckBox>
                    &nbsp;&nbsp; Other, explain;
                </td>
            </tr>
            <tr>
                <td style="width: 40px"></td>
                <td>
                    <telerik:RadTextBox ID="txthighRiskExplain" runat="server" Width="100%" TextMode="MultiLine"></telerik:RadTextBox>
                </td>
            </tr>
        </table>
        <p>
            If you determined that the client’s risk was high, tell your brokerage’s Compliance Officer. They will want to consider this when conducting
                    the overall brokerage risk assessment, which occurs every two years. It will also be relevant in completing Section D below. Note that your
                    brokerage may have developed other clusters not listed above. If no cluster is appropriate, the agent will need to provide a risk assessment
                    of the client, and explain their assessment, in the relevant space above.
        </p>
        <p><strong>D. Business Relationship</strong></p>

        <p>Check the appropriate boxes. </p>
        Acting as an agent for the purchase or sale of:<br />
        <table style="width: 100%; font-size: small; text-align: left;">
            <tr>
                <td style="width: 50%">
                    <telerik:RadCheckBox ID="RadCheckBox13" runat="server" AutoPostBack="False"></telerik:RadCheckBox>
                    &nbsp;&nbsp; Residential property<br />
                    <telerik:RadCheckBox ID="RadCheckBox14" runat="server" AutoPostBack="False"></telerik:RadCheckBox>
                    &nbsp;&nbsp; Commercial property
                            
                </td>
                <td style="width: 50%">
                    <telerik:RadCheckBox ID="RadCheckBox15" runat="server" AutoPostBack="False"></telerik:RadCheckBox>
                    &nbsp;&nbsp; Residential property for income purposes<br />
                    <telerik:RadCheckBox ID="RadCheckBox19" runat="server" AutoPostBack="False"></telerik:RadCheckBox>
                    &nbsp;&nbsp; Land for Commercial Use
                            
                </td>
            </tr>
            <tr>
                <td style="width: 50%">
                    <telerik:RadCheckBox ID="RadCheckBox20" runat="server" AutoPostBack="False"></telerik:RadCheckBox>
                    &nbsp;&nbsp; Other, please specify;
                </td>
                <td>
                    <telerik:RadTextBox ID="txtD1explain19" runat="server" Width="100%" TextMode="MultiLine"></telerik:RadTextBox>
                </td>
            </tr>
        </table>
        <table style="width: 100%; font-size: small; text-align: left;">
            <tr>
                <td style="width: 100%">Optional: describe your business dealings with the client and include information that would help you anticipate the types of
                                transactions and activities that the client may conduct.
                </td>
            </tr>
            <tr>
                <td style="width: 100%">
                    <telerik:RadTextBox runat="server" Width="100%" TextMode="MultiLine"></telerik:RadTextBox>
                </td>
            </tr>
        </table>
        <p><strong>D.2. Measures Taken to Monitor Business Relationship and Keep Client Information Up-To-Date</strong></p>

        <p>
            D.2.1. Ask the client if their name, address or principal business or occupation has changed and if it has include the updated
                    information on page one.
                    D.2.2 Keep all relevant correspondence with the client on file in order to maintain a record of the information you have used to monitor
                    the business relationship with the client. Optional - if you have taken measures beyond simply keeping correspondence on file, specify
                    them here:
        </p>
        <table style="width: 100%; font-size: small; text-align: left;">
            <tr>
                <td style="width: 100%">
                    <telerik:RadTextBox ID="txtthirdPartyReasonsMeasuresTaken" runat="server" Width="100%" TextMode="MultiLine"></telerik:RadTextBox>
                </td>
            </tr>
        </table>
        <p>
            D.2.3. If the client is high risk you must conduct enhanced measures to monitor the brokerage’s business relationship and keep their
                    client information up to date. Optional - consult your Compliance Officer and document what enhanced measures you have applied:
        </p>
        <table style="width: 100%; font-size: small; text-align: left;">
            <tr>
                <td style="width: 100%">
                    <telerik:RadTextBox ID="txtthirdPartyReasonsMeasuresTaken2" runat="server" Width="100%" TextMode="MultiLine"></telerik:RadTextBox>
                </td>
            </tr>
        </table>
        <p><strong>D.3 Suspicious Transactions</strong></p>
        <p>
            Don’t forget, if you see something suspicious during the transaction report it to your Compliance Officer. Consult your policies and
                    procedures manual for more information.
        </p>
        <p><strong>E. Terrorist Property Reports</strong></p>
        <p>
            Don’t forget to follow your brokerage’s procedures with respect to terrorist property reports. Consult your policies and procedures
                    manual for more information.
        </p>
    </div>--%>


</div>
<telerik:RadWindowManager ID="window_alert" runat="server"
    KeepInScreenBounds="False"
    RenderMode="Lightweight"
    DestroyOnClose="True">
    <Windows>
        <telerik:RadWindow ID="window_form" runat="server"
            Modal="True"
            RenderMode="Lightweight"
            Overlay="False"
            VisibleStatusbar="False"
            ShowContentDuringLoad="False">
        </telerik:RadWindow>
    </Windows>
</telerik:RadWindowManager>
