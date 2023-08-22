<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="uc_885326974.ascx.vb" Inherits="SmartForms.uc_885326974" %>

<style>
    html, body, h1, h2, h3, h4, h5, h6 {
        font-family: "Roboto", sans-serif
    }

    p {
        font-size: small;
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
        getRadWindow().close();
    }
</script>

<asp:HiddenField ID="hfFormHash" runat="server" />
<asp:HiddenField ID="hfFormId" runat="server" />

<div>
    <div class="w3-top">
        <div class="w3-bar w3-border w3-light-grey">
            <asp:Button ID="butSubmit" runat="server" class="w3-bar-item w3-button" Text="Submit for Assessment" />
            <asp:Button ID="butSendOffice" runat="server" class="w3-bar-item w3-button w3-right" Text="Send to Office" />
            <asp:Button ID="butDisplayForm" runat="server" class="w3-bar-item w3-button w3-right" Text="Display Form" />
             <asp:Button ID="butSave" runat="server" class="w3-bar-item w3-button w3-right" Text="Save Form" />
        </div>
    </div>
    <br>
    <br>

    <div class="w3-container">
        <p style="font-weight: bold">Individual Identification Information Record</p>
        <hr />
        <p>
            NOTE: An Individual Identification Information Record is required by the Proceeds of Crime (Money Laundering) and Terrorist Financing Act. This Record must be completed by the REALTOR® member whenever they act in respect to the purchase or sale of real estate. It is recommended that the Individual Identification Information Record be completed:
                <br />
            &nbsp;&nbsp;&nbsp;&nbsp; (i) for a buyer when the offer is submitted and/or a deposit made, and 
                <br />
            &nbsp;&nbsp;&nbsp;&nbsp; (ii) for a seller when the seller accepts the offer.
        </p>
        Transaction Property Address:<br />
        <table style="width: 100%; font-size: small;">
            <tr>
                <td style="width: 10%">
                    <telerik:RadTextBox ID="txtp_streetnum" runat="server" EmptyMessage="Street Num" Width="100%"></telerik:RadTextBox>
                </td>
                <td style="width: 30%">
                    <telerik:RadTextBox ID="txtp_street" runat="server" EmptyMessage="Street" Width="100%"></telerik:RadTextBox>
                </td>
                <td style="width: 10%">
                    <telerik:RadTextBox ID="txtp_unitNumber" runat="server" EmptyMessage="Unit Num" Width="100%"></telerik:RadTextBox>
                </td>
                <td style="width: 30%">
                    <telerik:RadTextBox ID="txtp_city" runat="server" EmptyMessage="City" Width="100%"></telerik:RadTextBox>
                </td>
                <td style="width: 10%">
                    <telerik:RadTextBox ID="txtProvince" runat="server" EmptyMessage="Province" Width="100%"></telerik:RadTextBox>
                </td>
                <td style="width: 10%">
                    <telerik:RadTextBox ID="txtp_zipcode" runat="server" EmptyMessage="P Code" Width="100%"></telerik:RadTextBox>
                </td>
            </tr>
        </table>
        <table style="width: 100%; font-size: small;">
            <tr>
                <td style="width: 40%">
                    <telerik:RadTextBox ID="txtpropAddrLine2" runat="server" EmptyMessage="Add Address" Width="100%"></telerik:RadTextBox>
                </td>
                <td style="width: 60%"></td>
            </tr>
        </table>
        <table style="width: 100%; font-size: small;">
            <tr>
                <td style="width: 30%">Sales Representative/Broker Name:
                </td>
                <td style="width: 35%">
                    <telerik:RadTextBox ID="txtAgent" runat="server" EmptyMessage="Agent Name" Width="100%"></telerik:RadTextBox>
                </td>
                <td style="width: 35%">
                    <telerik:RadTextBox ID="txtBroker" runat="server" EmptyMessage="Broker Name" Width="100%"></telerik:RadTextBox>
                </td>
            </tr>

            <tr>
                <td style="width: 30%">Date Information Verified/Credit File Consulted:
                </td>
                <td style="width: 35%">
                    <telerik:RadDatePicker ID="rdpVerifiedDate" runat="server"></telerik:RadDatePicker>
                    <%--txttodaysDated1_mmmm   txttodaysDated1_d   txttodaysDated1_yyyy--%>
                </td>
                <td style="width: 35%"></td>
            </tr>
        </table>

        <p style="font-weight: bold">A. Verification of Individual</p>
        <hr />
        <p>
            NOTE: One of Section A.1, A.2. or A.3 must be completed for your individual clients or unrepresented individuals that are not clients, but are parties to the transaction
                        (e.g. unrepresented buyer or seller) . Where you are unable to identify an unrepresented individual, complete section A.4 and consider sending a Suspicious
                        Transaction Report to FINTRAC if there are reasonable grounds to suspect that the transaction involves the proceeds of crime or terrorist activity. Where you are
                        using an agent or mandatary to verify the identity of an individual, see procedure described in CREA’s materials on REALTOR Link®.
        </p>
        <table style="width: 100%; font-size: small;" class="table">
            <tr>
                <td style="width: 30%">Full legal name of individual:
                </td>
                <td style="width: 35%">
                    <telerik:RadTextBox ID="txtindividualName" runat="server" EmptyMessage="Individual Name" Width="100%"></telerik:RadTextBox>
                </td>
                <td style="width: 35%">Date of Birth: &nbsp;&nbsp;
                            <telerik:RadDateInput ID="txtindividualDOB" runat="server" EmptyMessage="DOB"></telerik:RadDateInput>
                </td>

            </tr>
            <tr>
                <td style="width: 30%">Address:
                </td>
                <td style="width: 35%">
                    <telerik:RadTextBox ID="txtindividualAddress1" runat="server" EmptyMessage="Address" Width="100%"></telerik:RadTextBox>
                </td>
                <td style="width: 35%"></td>
            </tr>
            <tr>
                <td style="width: 30%"></td>
                <td style="width: 35%">
                    <telerik:RadTextBox ID="txtindividualAddress2" runat="server" EmptyMessage="Add. Address" Width="100%"></telerik:RadTextBox>
                </td>
                <td style="width: 35%"></td>
            </tr>
            <tr>
                <td style="width: 30%">Nature of Principal Business or Occupation::
                </td>
                <td style="width: 35%">
                    <telerik:RadTextBox ID="txtnatureOfBusinessOccupation" runat="server" EmptyMessage="Address" Width="100%"></telerik:RadTextBox>
                </td>
                <td style="width: 35%"></td>
            </tr>
        </table>
        <p style="font-weight: bold">A.1 Federal/Provincial/Territorial Government-Issued Photo ID</p>

        <p>
            Ascertain the individual’s identity by comparing the individual to their photo ID. The individual must be physically present unless using technology capable of
                    assessing a government-issued photo identification document’s authenticity.
        </p>
        <table style="width: 100%; font-size: small;">
            <tr>
                <td style="width: 30%">Type of Identification Document:
                </td>
                <td style="width: 35%">
                    <telerik:RadTextBox ID="RadTextBox1" runat="server" EmptyMessage="Individual Name" Width="100%"></telerik:RadTextBox>
                </td>
                <td style="width: 35%">Date of Birth: &nbsp;&nbsp;
                            <telerik:RadDateInput ID="RadDateInput1" runat="server" EmptyMessage="DOB"></telerik:RadDateInput>
                </td>

            </tr>
            <tr>
                <td style="width: 30%">Document Identifier Number:
                </td>
                <td style="width: 35%">
                    <telerik:RadTextBox ID="RadTextBox2" runat="server" EmptyMessage="Address" Width="100%"></telerik:RadTextBox>
                </td>
                <td style="width: 35%"></td>
            </tr>
            <tr>
                <td style="width: 30%">Issuing Jurisdiction:
                </td>
                <td style="width: 35%">
                    <telerik:RadTextBox ID="RadTextBox3" runat="server" EmptyMessage="Add. Address" Width="100%"></telerik:RadTextBox>
                </td>
                <td style="width: 35%">Country: &nbsp;&nbsp;
                            <telerik:RadTextBox ID="RadTextBox5" runat="server" EmptyMessage="Address"></telerik:RadTextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 30%">Document Expiry Date:
                </td>
                <td style="width: 35%">
                    <telerik:RadTextBox ID="RadTextBox4" runat="server" EmptyMessage="Address" Width="100%"></telerik:RadTextBox>
                </td>
                <td style="width: 35%; font-size: x-small;">(must be valid and not expired)</td>
            </tr>
        </table>
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
                    <telerik:RadTextBox ID="RadTextBox6" runat="server" EmptyMessage="Individual Name" Width="100%"></telerik:RadTextBox>
                </td>
                <td style="width: 35%"></td>

            </tr>
            <tr>
                <td style="width: 30%"></td>
                <td style="width: 35%">
                    <telerik:RadTextBox ID="RadTextBox7" runat="server" EmptyMessage="Address" Width="100%"></telerik:RadTextBox>
                </td>
                <td style="width: 35%"></td>
            </tr>
            <tr>
                <td style="width: 30%">Reference Number of Credit File:
                </td>
                <td style="width: 35%">
                    <telerik:RadTextBox ID="RadTextBox8" runat="server" EmptyMessage="Add. Address" Width="100%"></telerik:RadTextBox>
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
                    <telerik:RadCheckBox ID="RadCheckBox1" runat="server" AutoPostBack="False"></telerik:RadCheckBox>
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
                    <telerik:RadTextBox ID="RadTextBox9" runat="server" EmptyMessage="Individual Name" Width="100%"></telerik:RadTextBox>
                </td>
                <td style="width: 35%"></td>

            </tr>
            <tr>
                <td style="width: 30%">&nbsp;&nbsp;&nbsp; - Account Number**:
                </td>
                <td style="width: 35%">
                    <telerik:RadTextBox ID="RadTextBox10" runat="server" EmptyMessage="Address" Width="100%"></telerik:RadTextBox>
                </td>
                <td style="width: 35%"></td>
            </tr>
        </table>

        <table style="width: 100%; font-size: small; text-align: left;">
            <tr>
                <td style="width: 40px">
                    <telerik:RadCheckBox ID="RadCheckBox2" runat="server" AutoPostBack="False"></telerik:RadCheckBox>
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
                    <telerik:RadTextBox ID="RadTextBox11" runat="server" EmptyMessage="Individual Name" Width="100%"></telerik:RadTextBox>
                </td>
                <td style="width: 35%"></td>

            </tr>
            <tr>
                <td style="width: 30%">&nbsp;&nbsp;&nbsp; - Account Number**:
                </td>
                <td style="width: 35%">
                    <telerik:RadTextBox ID="RadTextBox12" runat="server" EmptyMessage="Address" Width="100%"></telerik:RadTextBox>
                </td>
                <td style="width: 35%"></td>
            </tr>
        </table>

        <table style="width: 100%; font-size: small; text-align: left;">
            <tr>
                <td style="width: 40px">
                    <telerik:RadCheckBox ID="RadCheckBox3" runat="server" AutoPostBack="False"></telerik:RadCheckBox>
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
                    <telerik:RadTextBox ID="RadTextBox13" runat="server" EmptyMessage="Individual Name" Width="100%"></telerik:RadTextBox>
                </td>
                <td style="width: 35%"></td>

            </tr>
            <tr>
                <td style="width: 30%">&nbsp;&nbsp;&nbsp; - Financial Account Type:
                </td>
                <td style="width: 35%">
                    <telerik:RadTextBox ID="RadTextBox14" runat="server" EmptyMessage="Address" Width="100%"></telerik:RadTextBox>
                </td>
                <td style="width: 35%"></td>
            </tr>
            <tr>
                <td style="width: 30%">&nbsp;&nbsp;&nbsp; - Account Number**:
                </td>
                <td style="width: 35%">
                    <telerik:RadTextBox ID="RadTextBox15" runat="server" EmptyMessage="Address" Width="100%"></telerik:RadTextBox>
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
                    <telerik:RadCheckBox ID="RadCheckBox4" runat="server" AutoPostBack="False"></telerik:RadCheckBox>
                </td>
                <td>Asked unrepresented individual for information to ascertain their identity
                </td>
            </tr>
        </table>
        <table style="font-size: small;" class="auto-style1">
            <tr>
                <td style="width: 30%">
                    <telerik:RadCheckBox ID="RadCheckBox6" runat="server" AutoPostBack="False"></telerik:RadCheckBox>
                    &nbsp;&nbsp;&nbsp;Other, Explain:
                </td>
                <td style="width: 35%">
                    <telerik:RadTextBox ID="RadTextBox22" runat="server" EmptyMessage="Individual Name" Width="100%"></telerik:RadTextBox>
                </td>
                <td style="width: 35%"></td>
            </tr>
            <tr>
                <td style="width: 30%"></td>
                <td style="width: 35%">
                    <telerik:RadTextBox ID="RadTextBox25" runat="server" EmptyMessage="Individual Name" Width="100%"></telerik:RadTextBox>
                </td>
                <td style="width: 35%"></td>
            </tr>
            <tr>
                <td style="width: 30%">Date on which above measures taken:
                </td>
                <td style="width: 35%">
                    <telerik:RadDatePicker ID="RadDatePicker1" runat="server"></telerik:RadDatePicker>
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
                    <telerik:RadCheckBox ID="RadCheckBox5" runat="server" AutoPostBack="False"></telerik:RadCheckBox>
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
                    <telerik:RadTextBox ID="RadTextBox18" runat="server" Width="100%" TextMode="MultiLine"></telerik:RadTextBox>
                </td>
            </tr>
        </table>
        <p style="font-weight: bold">B.2 Third Party Record</p>
        <p>Where there is a third party, complete this section.</p>
        <table class="table-style">
            <tr>
                <td class="td-style" style="width: 30%">Name of other entity::
                </td>
                <td class="td-style" style="width: 35%">
                    <telerik:RadTextBox ID="RadTextBox16" runat="server" EmptyMessage="Individual Name" Width="100%"></telerik:RadTextBox>
                </td>
                <td class="td-style" style="width: 35%"></td>

            </tr>
            <tr>
                <td class="td-style" style="width: 30%">Address:
                </td>
                <td class="td-style" style="width: 35%">
                    <telerik:RadTextBox ID="RadTextBox17" runat="server" EmptyMessage="Address" Width="100%"></telerik:RadTextBox>
                </td>
                <td class="td-style" style="width: 35%"></td>
            </tr>
            <tr>
                <td class="td-style" style="width: 30%">Telephone number:
                </td>
                <td class="td-style" style="width: 35%">
                    <telerik:RadTextBox ID="RadTextBox19" runat="server" EmptyMessage="Add. Address" Width="100%"></telerik:RadTextBox>
                </td>
                <td class="td-style" style="width: 35%"></td>
            </tr>
            <tr>
                <td class="td-style" style="width: 30%">Date of Birth (if applicable):
                </td>
                <td class="td-style" style="width: 35%">
                    <telerik:RadTextBox ID="RadTextBox20" runat="server" EmptyMessage="Add. Address" Width="100%"></telerik:RadTextBox>
                </td>
                <td class="td-style" style="width: 35%"></td>
            </tr>
            <tr>
                <td class="td-style" style="width: 30%">Registration or incorporation number, and jurisdiction and country that issued that number (if applicable): 
                </td>
                <td class="td-style" style="width: 35%">
                    <telerik:RadTextBox ID="RadTextBox21" runat="server" EmptyMessage="Add. Address" Width="100%" TextMode="MultiLine"></telerik:RadTextBox>
                </td>
                <td class="td-style" style="width: 35%"></td>
            </tr>
            <tr>
                <td class="td-style" style="width: 30%">Relationship between third party and client:.
                </td>
                <td class="td-style" style="width: 35%">
                    <telerik:RadTextBox ID="RadTextBox23" runat="server" EmptyMessage="Add. Address" Width="100%"></telerik:RadTextBox><br />
                    <telerik:RadTextBox ID="RadTextBox24" runat="server" EmptyMessage="Add. Address" Width="100%"></telerik:RadTextBox>
                </td>
                <td class="td-style" style="width: 35%"></td>
            </tr>
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
                    <telerik:RadTextBox ID="RadTextBox26" runat="server" Width="100%" TextMode="MultiLine"></telerik:RadTextBox>
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
                    <telerik:RadTextBox ID="RadTextBox27" runat="server" Width="100%" TextMode="MultiLine"></telerik:RadTextBox>
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
                    <telerik:RadTextBox ID="RadTextBox28" runat="server" Width="100%" TextMode="MultiLine"></telerik:RadTextBox>
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
                    <telerik:RadTextBox ID="RadTextBox29" runat="server" Width="100%" TextMode="MultiLine"></telerik:RadTextBox>
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
                    <telerik:RadTextBox ID="RadTextBox30" runat="server" Width="100%" TextMode="MultiLine"></telerik:RadTextBox>
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
                    <telerik:RadTextBox ID="RadTextBox31" runat="server" Width="100%" TextMode="MultiLine"></telerik:RadTextBox>
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
                    <telerik:RadTextBox ID="RadTextBox32" runat="server" Width="100%" TextMode="MultiLine"></telerik:RadTextBox>
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
    </div>
</div>
<telerik:RadWindowManager ID="window_alert" runat="server"
    KeepInScreenBounds="True"
    RenderMode="Lightweight"
    DestroyOnClose="True">
    <Windows>
        <telerik:RadWindow ID="window_form" runat="server"
            Modal="True"
            RenderMode="Lightweight"
            Overlay="True"
            VisibleStatusbar="False"
            ShowContentDuringLoad="False">
        </telerik:RadWindow>
    </Windows>
</telerik:RadWindowManager>
