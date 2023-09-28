<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="wz_885326974.ascx.vb" Inherits="SmartForms.wz_885326974" %>
<%@ Register Src="~/Web/Controls/uc_ComplianceNotes.ascx" TagPrefix="uc1" TagName="uc_ComplianceNotes" %>


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
                    </td>
                    <td style="text-align: right; vertical-align: top">
                        <telerik:RadAsyncUpload ID="asyncNewDocument" runat="server"
                            UploadedFilesRendering="BelowFileInput"
                            HideFileInput="True"
                            Localization-Select="Select or Drop PDF Here">
                        </telerik:RadAsyncUpload>
                        <div style="padding: 3px 0px 3px 0px">
                            <div style="color: #CC0000">This will overwrite the currently saved data!</div>
                            <telerik:RadButton ID="RadButton1" runat="server" Text="Import" Font-Size="Small" Skin="Black"></telerik:RadButton>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <telerik:RadWizard ID="rwIdentification" runat="server" Skin="Material" Font-Size="Small">
        <WizardSteps>
            <telerik:RadWizardStep ID="step_Verification" runat="server" Title=" ">
                <telerik:RadSplitter RenderMode="Lightweight" ID="RadSplitter1" runat="server" Width="100%">
                     <telerik:RadPane ID="navigationPane" runat="server" RenderMode="Lightweight">
                        <div class="w3-container">
                            <p><strong>Individual Identification Information Record</strong></p>
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
                        </div>
                    </telerik:RadPane>
                    <telerik:RadPane ID="EndPane" runat="server" Width="22" Scrolling="None">
                        <div class="w3-container">
                            <telerik:RadSlidingZone ID="RadSlidingZone1" runat="server" Width="50" ClickToOpen="True" SlideDirection="Left" RenderMode="Lightweight" ExpandedPaneId="RadSlidingPane1">
                                <telerik:RadSlidingPane ID="RadSlidingPane1" Title="RULES" runat="server" Width="300" RenderMode="Lightweight" DockOnOpen="true" >

                                    <uc1:uc_ComplianceNotes runat="server" ID="uc_step_Verification" />

                                </telerik:RadSlidingPane>
                            </telerik:RadSlidingZone>
                        </div>

                    </telerik:RadPane>
                </telerik:RadSplitter>
            </telerik:RadWizardStep>
            <telerik:RadWizardStep ID="step_HeaderInfo" runat="server" Title=" ">
                <telerik:RadSplitter RenderMode="Lightweight" ID="RadSplitter2" runat="server" Width="100%">
                    <telerik:RadPane ID="RadPane1" runat="server" RenderMode="Lightweight">
                        <div class="w3-container">
                        <p><strong>A. Verification of Individual</strong></p>
                        <div class="w3-row">
                            <div class="w3-third w3-padding-small">
                                <telerik:RadTextBox ID="txtindividualName" runat="server" EmptyMessage="Individual Name" Width="50%"></telerik:RadTextBox>
                            </div>
                            <div class="w3-third w3-padding-small">
                                <telerik:RadDateInput ID="txtindividualDOB" runat="server" EmptyMessage="DOB (yyyy-mm-dd)" DisplayDateFormat="yyyy-MM-dd" Culture="en-CA" MinDate="1900-01-01" Width="50%"></telerik:RadDateInput>
                            </div>
                        </div>
                        <div class="w3-row">
                            <div class="w3-padding-small">
                                <telerik:RadTextBox ID="txtindividualAddress1" runat="server" EmptyMessage="Individual Address" Width="100%"></telerik:RadTextBox>
                            </div>
                        </div>
                        <div class="w3-row">
                            <div class="w3-padding-small">
                                <telerik:RadTextBox ID="txtindividualAddress2" runat="server" EmptyMessage="Addional Address" Width="100%"></telerik:RadTextBox>
                            </div>
                        </div>
                        <div class="w3-row">
                            <div class="w3-third w3-padding-small">
                                <telerik:RadComboBox ID="rcbEmployment" runat="server" Width="75%">
                                    <Items>
                                        <telerik:RadComboBoxItem runat="server" Text="Employed" Value="Employed" />
                                        <telerik:RadComboBoxItem runat="server" Text="Self Employed" Value="SelfEmployed" />
                                        <telerik:RadComboBoxItem runat="server" Text="Unemployed" Value="Unemployed" />
                                        <telerik:RadComboBoxItem runat="server" Text="Retired" Value="Retired" />
                                        <telerik:RadComboBoxItem runat="server" Text="Student" Value="Student" />
                                    </Items>
                                </telerik:RadComboBox>
                                <telerik:RadTextBox ID="txtnatureOfBusinessOccupation" runat="server" Visible="False"></telerik:RadTextBox>
                            </div>
                            <div class="w3-third w3-padding-small">
                                <telerik:RadTextBox ID="txtBusinessLocation" runat="server" EmptyMessage="Individual Name" Width="100%"></telerik:RadTextBox>
                                <telerik:RadToolTip ID="rttBusinessLocation" runat="server" TargetControlID="txtBusinessLocation" Position="BottomCenter" Title="Business Location">
                                    <contenttemplate>
                                        Be specific when possible ... Principal physical address where doing business.
                                    </contenttemplate>
                                </telerik:RadToolTip>
                            </div>
                        </div>
                        <div class="w3-row" width="100%">
                            <div class="w3-third w3-padding-small">
                                <telerik:RadButton RenderMode="Lightweight" ID="rbGovernmentId" runat="server" ToggleType="Radio" ButtonType="StandardButton" Checked="true" GroupName="StandardButton">
                                    <ToggleStates>
                                        <telerik:RadButtonToggleState Text="A.1 Government-Issued Photo ID" PrimaryIconCssClass="p-i-radio-checked"></telerik:RadButtonToggleState>
                                        <telerik:RadButtonToggleState Text="A.1 Government-Issued Photo ID" PrimaryIconCssClass="p-i-radio"></telerik:RadButtonToggleState>
                                    </ToggleStates>
                                </telerik:RadButton>
                            </div>
                            <div class="w3-third w3-padding-small">
                                <telerik:RadCheckBox ID="rcbShowAllSteps" runat="server" Text="Show All Steps" RenderMode="Lightweight" AutoPostBack="False" Width="100%"></telerik:RadCheckBox>
                            </div>
                        </div>
                        <div class="w3-row">
                            <div class="w3-twothird w3-padding-small">
                                <telerik:RadButton RenderMode="Lightweight" ID="rbCreditMethod" runat="server" ToggleType="Radio" ButtonType="StandardButton" GroupName="StandardButton">
                                    <ToggleStates>
                                        <telerik:RadButtonToggleState Text="A.2 Credit File Method" PrimaryIconCssClass="p-i-radio-checked"></telerik:RadButtonToggleState>
                                        <telerik:RadButtonToggleState Text="A.2 Credit File Method" PrimaryIconCssClass="p-i-radio"></telerik:RadButtonToggleState>
                                    </ToggleStates>
                                </telerik:RadButton>
                            </div>
                        </div>
                        <div class="w3-row">
                            <div class="w3-twothird w3-padding-small">
                                <telerik:RadButton RenderMode="Lightweight" ID="rbDualIdMethod" runat="server" ToggleType="Radio" GroupName="StandardButton" ButtonType="StandardButton">
                                    <ToggleStates>
                                        <telerik:RadButtonToggleState Text="A.3 Dual ID Process Method" PrimaryIconCssClass="p-i-radio-checked"></telerik:RadButtonToggleState>
                                        <telerik:RadButtonToggleState Text="A.3 Dual ID Process Method" PrimaryIconCssClass="p-i-radio"></telerik:RadButtonToggleState>
                                    </ToggleStates>
                                </telerik:RadButton>
                            </div>
                        </div>
                        <div class="w3-row">
                            <div class="w3-twothird w3-padding-small">
                                <telerik:RadButton RenderMode="Lightweight" ID="rbUnidentified" runat="server" ToggleType="Radio" GroupName="StandardButton" ButtonType="StandardButton">
                                    <ToggleStates>
                                        <telerik:RadButtonToggleState Text="A.4 Unrepresented Individual Reasonable Measures Record (if applicable)" PrimaryIconCssClass="p-i-radio-checked"></telerik:RadButtonToggleState>
                                        <telerik:RadButtonToggleState Text="A.4 Unrepresented Individual Reasonable Measures Record (if applicable)" PrimaryIconCssClass="p-i-radio"></telerik:RadButtonToggleState>
                                    </ToggleStates>
                                </telerik:RadButton>
                            </div>
                        </div>
                        </div>
                    </telerik:RadPane>
                    <telerik:RadPane ID="RadPane9" runat="server" Width="22" Scrolling="None">
                        <telerik:RadSlidingZone ID="RadSlidingZone2" runat="server" Width="25" ClickToOpen="True" SlideDirection="Left" RenderMode="Lightweight" ExpandedPaneId="RadSlidingPane2">
                            <telerik:RadSlidingPane ID="RadSlidingPane2" Title="NOTES" runat="server" Width="300" RenderMode="Lightweight" DockOnOpen="true">

                                <uc1:uc_ComplianceNotes runat="server" ID="Uc_step_HeaderInfo" />

                            </telerik:RadSlidingPane>
                        </telerik:RadSlidingZone>
                    </telerik:RadPane>
                </telerik:RadSplitter>
            </telerik:RadWizardStep>
            <telerik:RadWizardStep ID="step_GovernmentId" runat="server" Title=" ">
                <telerik:RadSplitter RenderMode="Lightweight" ID="RadSplitter3" runat="server" Width="100%">
                    <telerik:RadPane ID="RadPane2" runat="server" RenderMode="Lightweight">
                        <p><strong>A.1 Federal/Provincial/Territorial Government-Issued Photo ID</strong></p>
                        <p>Transaction Property Address:</p>
                        <div class="w3-row">
                            <div class="w3-third w3-padding-small">
                                <telerik:RadTextBox ID="txtidDocument" runat="server" EmptyMessage="Type of ID Document" Width="100%"></telerik:RadTextBox>
                            </div>
                            <div class="w3-third w3-padding-small">
                                <telerik:RadTextBox ID="txtdocIdentifierNumber" runat="server" EmptyMessage="Doc ID Number" Width="100%"></telerik:RadTextBox>
                            </div>
                        </div>
                        <div class="w3-row">
                            <div class="w3-third w3-padding-small">
                                <telerik:RadTextBox ID="txtissuingJurisdiction" runat="server" EmptyMessage="Issuing Jurisdiction" Width="100%"></telerik:RadTextBox>
                            </div>
                            <div class="w3-third w3-padding-small">
                                <telerik:RadTextBox ID="txtissuingCountry" runat="server" EmptyMessage="Issuing Jurisdiction" Width="100%"></telerik:RadTextBox>
                            </div>
                        </div>
                        <div class="w3-row">
                            <div class="w3-third w3-padding-small">
                                <telerik:RadDateInput ID="txtDocExpDate" runat="server" EmptyMessage="Doc Expiry (yyyy-mm-dd)" DisplayDateFormat="yyyy-MM-dd" Culture="en-CA" MinDate="1900-01-01"></telerik:RadDateInput>
                            </div>
                            <div class="w3-third w3-padding-small">
                                <div style="width: 35%; font-size: x-small;">(must be valid and not expired)</div>
                            </div>
                        </div>
                        <hr />
                        <p>Electronic / Remote Identification - Only Remote Identifaction applications approved by the brokerage can be used!</p>
                        <div class="w3-row">
                            <div class="w3-third w3-padding-small">
                                <telerik:RadComboBox ID="rcbRemoteIdentification" runat="server" EmptyMessage="Select Remote ID App" Font-Size="Small" Width="75%" RenderMode="Lightweight">
                                    <Items>
                                        <telerik:RadComboBoxItem runat="server" Text="Fintracker" Value="Fintracker" />
                                        <telerik:RadComboBoxItem runat="server" Text="Really Trusted" Value="ReallyTrusted" />
                                    </Items>
                                </telerik:RadComboBox>
                            </div>
                            <div class="w3-third w3-padding-small">
                                <div class="w3-row">
                                    <div class="w3-third w3-padding-small">
                                        What Risk is returned?
                                    </div>
                                    <div class="w3-third w3-padding-small">
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
                            <div class="w3-third w3-padding-small">
                                UPLOAD Remote Identification Report 
                            </div>
                            <div class="w3-third w3-padding-small">
                                <telerik:RadAsyncUpload ID="asyncRemoteId" runat="server"
                                    UploadedFilesRendering="BelowFileInput"
                                    HideFileInput="True"
                                    Localization-Select="Select or Drop PDF Here">
                                </telerik:RadAsyncUpload>
                            </div>
                        </div>
                    </telerik:RadPane>
                    <telerik:RadSplitBar ID="RadSplitbar5" runat="server">
                    </telerik:RadSplitBar>
                    <telerik:RadSplitBar ID="RadSplitBar6" runat="server">
                    </telerik:RadSplitBar>
                    <telerik:RadPane ID="RadPane10" runat="server" Width="22" Scrolling="None">
                        <telerik:RadSlidingZone ID="RadSlidingZone3" runat="server" Width="22" ClickToOpen="True" SlideDirection="Left" RenderMode="Lightweight" ExpandedPaneId="RadSlidingPane3">
                            <telerik:RadSlidingPane ID="RadSlidingPane3" Title="NOTES" runat="server" Width="275" MinWidth="275" RenderMode="Lightweight" DockOnOpen="true">

                                <uc1:uc_ComplianceNotes runat="server" ID="Uc_step_GovernmentId" />

                            </telerik:RadSlidingPane>
                        </telerik:RadSlidingZone>
                    </telerik:RadPane>
                </telerik:RadSplitter>
            </telerik:RadWizardStep>

            <telerik:RadWizardStep ID="step_CreditFile" runat="server" Title=" ">
                <telerik:RadSplitter RenderMode="Lightweight" ID="RadSplitter4" runat="server" Width="100%">
                    <telerik:RadPane ID="RadPane3" runat="server" RenderMode="Lightweight">
                        <p><strong>A.2 Credit File Method</strong></p>
                    </telerik:RadPane>
                    <telerik:RadSplitBar ID="RadSplitbar7" runat="server">
                    </telerik:RadSplitBar>
                    <telerik:RadSplitBar ID="RadSplitBar8" runat="server">
                    </telerik:RadSplitBar>
                    <telerik:RadPane ID="RadPane11" runat="server" Width="22" Scrolling="None">
                        <telerik:RadSlidingZone ID="RadSlidingZone4" runat="server" Width="22" ClickToOpen="True" SlideDirection="Left" RenderMode="Lightweight" ExpandedPaneId="RadSlidingPane4">
                            <telerik:RadSlidingPane ID="RadSlidingPane4" Title="NOTES" runat="server" Width="275" MinWidth="275" RenderMode="Lightweight" DockOnOpen="true">

                                <uc1:uc_ComplianceNotes runat="server" ID="Uc_step_CreditFile" />

                            </telerik:RadSlidingPane>
                        </telerik:RadSlidingZone>
                    </telerik:RadPane>
                </telerik:RadSplitter>
            </telerik:RadWizardStep>
            <telerik:RadWizardStep ID="step_DualId" runat="server" Title=" ">
                <telerik:RadSplitter RenderMode="Lightweight" ID="RadSplitter5" runat="server" Width="100%">
                    <telerik:RadPane ID="RadPane4" runat="server" RenderMode="Lightweight">
                        <p><strong>A.3 Dual ID Process Method</strong></p>
                    </telerik:RadPane>
                    <telerik:RadSplitBar ID="RadSplitbar9" runat="server">
                    </telerik:RadSplitBar>
                    <telerik:RadSplitBar ID="RadSplitBar10" runat="server">
                    </telerik:RadSplitBar>
                    <telerik:RadPane ID="RadPane12" runat="server" Width="22" Scrolling="None">
                        <telerik:RadSlidingZone ID="RadSlidingZone5" runat="server" Width="22" ClickToOpen="True" SlideDirection="Left" RenderMode="Lightweight" ExpandedPaneId="RadSlidingPane5">
                            <telerik:RadSlidingPane ID="RadSlidingPane5" Title="NOTES" runat="server" Width="275" MinWidth="275" RenderMode="Lightweight" DockOnOpen="true">

                                <uc1:uc_ComplianceNotes runat="server" ID="Uc_step_DualId" />

                            </telerik:RadSlidingPane>
                        </telerik:RadSlidingZone>
                    </telerik:RadPane>
                </telerik:RadSplitter>
            </telerik:RadWizardStep>

            <telerik:RadWizardStep ID="step_UnrepresentedParty" runat="server" Title=" ">
                <telerik:RadSplitter RenderMode="Lightweight" ID="RadSplitter6" runat="server" Width="100%">
                    <telerik:RadPane ID="RadPane5" runat="server" RenderMode="Lightweight">
                        <p><strong>A.4 Unrepresented Individual Reasonable Measures Record</strong></p>
                    </telerik:RadPane>
                    <telerik:RadSplitBar ID="RadSplitbar11" runat="server">
                    </telerik:RadSplitBar>
                    <telerik:RadSplitBar ID="RadSplitBar12" runat="server">
                    </telerik:RadSplitBar>
                    <telerik:RadPane ID="RadPane13" runat="server" Width="22" Scrolling="None">
                        <telerik:RadSlidingZone ID="RadSlidingZone6" runat="server" Width="22" ClickToOpen="True" SlideDirection="Left" RenderMode="Lightweight" ExpandedPaneId="RadSlidingPane6">
                            <telerik:RadSlidingPane ID="RadSlidingPane6" Title="NOTES" runat="server" Width="275" MinWidth="275" RenderMode="Lightweight" DockOnOpen="true">

                                <uc1:uc_ComplianceNotes runat="server" ID="Uc_step_UnrepresentedParty" />

                            </telerik:RadSlidingPane>
                        </telerik:RadSlidingZone>
                    </telerik:RadPane>
                </telerik:RadSplitter>
            </telerik:RadWizardStep>

            <telerik:RadWizardStep ID="step_ThirdParty" runat="server" Title=" ">
                <telerik:RadSplitter RenderMode="Lightweight" ID="RadSplitter7" runat="server" Width="100%">
                    <telerik:RadPane ID="RadPane6" runat="server" RenderMode="Lightweight">
                        <p><strong>B. Verification of Third Parties</strong></p>
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
                    </telerik:RadPane>
                    <telerik:RadSplitBar ID="RadSplitbar13" runat="server">
                    </telerik:RadSplitBar>
                    <telerik:RadSplitBar ID="RadSplitBar14" runat="server">
                    </telerik:RadSplitBar>
                    <telerik:RadPane ID="RadPane14" runat="server" Width="22" Scrolling="None">
                        <telerik:RadSlidingZone ID="RadSlidingZone7" runat="server" Width="22" ClickToOpen="True" SlideDirection="Left" RenderMode="Lightweight" ExpandedPaneId="RadSlidingPane7">
                            <telerik:RadSlidingPane ID="RadSlidingPane7" Title="NOTES" runat="server" Width="275" MinWidth="275" RenderMode="Lightweight" DockOnOpen="true">

                                <uc1:uc_ComplianceNotes runat="server" ID="Uc_step_ThirdParty" />

                            </telerik:RadSlidingPane>
                        </telerik:RadSlidingZone>
                    </telerik:RadPane>
                </telerik:RadSplitter>
            </telerik:RadWizardStep>

            <telerik:RadWizardStep ID="step_ThirdPartIdent" runat="server" Title=" ">
                <telerik:RadSplitter RenderMode="Lightweight" ID="RadSplitter8" runat="server" Width="100%">
                    <telerik:RadPane ID="RadPane7" runat="server" RenderMode="Lightweight">
                        <p style="font-weight: bold">B.2 Third Party Record</p>
                        <div class="w3-row">
                            <div class="w3-third w3-padding-small">
                                <telerik:RadTextBox ID="txtthirdPartyName" runat="server" EmptyMessage="Name of other entity" Width="100%"></telerik:RadTextBox>
                            </div>
                            <div class="w3-third w3-padding-small">
                                <telerik:RadTextBox ID="txtthirdPartyAddress2" runat="server" EmptyMessage="Telephone Number" Width="100%"></telerik:RadTextBox>
                            </div>
                        </div>
                        <div class="w3-row">
                            <div class="w3-third w3-padding-small">
                                <telerik:RadTextBox ID="txtthirdPartyAddress1" runat="server" EmptyMessage="Address" Width="100%"></telerik:RadTextBox>
                            </div>
                            <div class="w3-third w3-padding-small">
                                <telerik:RadDateInput ID="txtthirdPartyDOB" runat="server" EmptyMessage="DOB (when app. (yyyy-mm-dd))" DisplayDateFormat="yyyy-MM-dd" Culture="en-CA" MinDate="1900-01-01" Width="75%"></telerik:RadDateInput>
                            </div>
                        </div>
                        <div class="w3-row">
                            <p>Nature of Principle Business or Occupation</p>
                            <div class="w3-third w3-padding-small">
                                <telerik:RadTextBox ID="txtthirdPartyBusinessOccupation1" runat="server" EmptyMessage="Principal Business or Occupation" Width="100%"></telerik:RadTextBox><br />
                            </div>
                            <div class="w3-third w3-padding-small">
                                <telerik:RadTextBox ID="txtthirdPartyBusinessOccupation2" runat="server" EmptyMessage="Additional" Width="100%"></telerik:RadTextBox>
                            </div>
                        </div>
                        <div class="w3-row">
                            <p>Registration or incorporation number, and jurisdiction and country that issued that number (if applicable)</p>
                            <div class="w3-third w3-padding-small">
                                <telerik:RadTextBox ID="txtthirdPartyIncorporationNumber1" runat="server" EmptyMessage="Registration or Incorporation No" Width="100%"></telerik:RadTextBox><br />
                            </div>
                            <div class="w3-third w3-padding-small">
                                <telerik:RadTextBox ID="txtthirdPartyIncorporationNumber2" runat="server" EmptyMessage="Issuing Jurisdiction" Width="100%"></telerik:RadTextBox>
                            </div>
                        </div>
                        <div class="w3-row">
                            <p>Relationship between third party and client</p>
                            <div class="w3-third w3-padding-small">
                                <telerik:RadTextBox ID="RadTextBox5" runat="server" EmptyMessage="Third Party relationship" Width="100%"></telerik:RadTextBox><br />
                            </div>
                            <div class="w3-third w3-padding-small">
                                <telerik:RadTextBox ID="RadTextBox6" runat="server" EmptyMessage="Additional" Width="100%"></telerik:RadTextBox>
                            </div>
                        </div>
                    </telerik:RadPane>
                    <telerik:RadSplitBar ID="RadSplitbar17" runat="server">
                    </telerik:RadSplitBar>
                    <telerik:RadSplitBar ID="RadSplitBar18" runat="server">
                    </telerik:RadSplitBar>
                    <telerik:RadPane ID="RadPane16" runat="server" Width="22" Scrolling="None">
                        <telerik:RadSlidingZone ID="RadSlidingZone9" runat="server" Width="22" ClickToOpen="True" SlideDirection="Left" RenderMode="Lightweight" ExpandedPaneId="RadSlidingPane9">
                            <telerik:RadSlidingPane ID="RadSlidingPane9" Title="NOTES" runat="server" Width="275" MinWidth="275" RenderMode="Lightweight" DockOnOpen="true">

                                <uc1:uc_ComplianceNotes runat="server" ID="Uc_step_ThirdPartIdent" />

                            </telerik:RadSlidingPane>
                        </telerik:RadSlidingZone>
                    </telerik:RadPane>
                </telerik:RadSplitter>
            </telerik:RadWizardStep>
            <telerik:RadWizardStep ID="step_WrapUp" runat="server" Title=" ">
                <telerik:RadSplitter RenderMode="Lightweight" ID="RadSplitter9" runat="server" Width="100%">
                    <telerik:RadPane ID="RadPane8" runat="server" RenderMode="Lightweight">
                        <p><strong>Review and Submit the Individual Identifcation Form</strong></p>
                        <telerik:RadButton ID="rbReviewDoc" runat="server" Text="RadButton"></telerik:RadButton>
                    </telerik:RadPane>
                    <telerik:RadSplitBar ID="RadSplitbar15" runat="server">
                    </telerik:RadSplitBar>
                    <telerik:RadSplitBar ID="RadSplitBar16" runat="server">
                    </telerik:RadSplitBar>
                    <telerik:RadPane ID="RadPane15" runat="server" Width="22" Scrolling="None">
                        <telerik:RadSlidingZone ID="RadSlidingZone8" runat="server" Width="22" ClickToOpen="True" SlideDirection="Left" RenderMode="Lightweight" ExpandedPaneId="RadSlidingPane8">
                            <telerik:RadSlidingPane ID="RadSlidingPane8" Title="NOTES" runat="server" Width="275" MinWidth="275" RenderMode="Lightweight" DockOnOpen="true">

                                <uc1:uc_ComplianceNotes runat="server" ID="Uc_step_WrapUp" />

                            </telerik:RadSlidingPane>
                        </telerik:RadSlidingZone>
                    </telerik:RadPane>
                </telerik:RadSplitter>
            </telerik:RadWizardStep>
        </WizardSteps>
    </telerik:RadWizard>
    <div class="w3-panel w3-topbar w3-border-teal">
        <div class="w3-twothird w3-container w3-padding-small">
            <div class="w3-row" style="font-size: small; text-align: center; vertical-align: middle;">
                <div class="w3-half w3-container w3-padding-small">
                    <div class="w3-quarter w3-padding-small">
                        Send SMS / Text:
                    </div>
                    <div class="w3-half  w3-padding-small">
                        <telerik:RadTextBox ID="rtbText" runat="server" Font-Size="Small" Width="100%"></telerik:RadTextBox>
                    </div>
                    <asp:LinkButton ID="lbSendText" runat="server">Send</asp:LinkButton>
                </div>
                <div class="w3-half w3-container w3-padding-small">
                    <div class="w3-quarter w3-padding-small">
                        Send E Mail To:
                    </div>
                    <div class="w3-half  w3-padding-small">
                        <telerik:RadTextBox ID="RadTextBox1" runat="server" Font-Size="Small" Width="100%"></telerik:RadTextBox>
                    </div>
                    <asp:LinkButton ID="lbSendEmail" runat="server">Send</asp:LinkButton>
                </div>
            </div>
        </div>
        <div class="w3-third w3-container w3-padding-small">
            <p>You can send this form any time to you mobile for completion!</p>
        </div>
    </div>
</div>


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
