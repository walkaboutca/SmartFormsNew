<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="uc_PropertyHeader.ascx.vb" Inherits="SmartForms.uc_PropertyHeader" %>

<%@ Register Src="../../Web/Controls/uc_ComplianceNotes.ascx" TagPrefix="uc1" TagName="uc_ComplianceNotes" %>



<telerik:RadSplitter RenderMode="Lightweight" ID="RadSplitter1" runat="server" Width="100%">
    <telerik:RadPane ID="navigationPane" runat="server" RenderMode="Lightweight">
        <div class="w3-bottombar w3-border-grey w3-light-grey">
            <div class="w3-container">
                <div class="w3-row">
                    <div class="w3-col s8">
                        <div class="w3-padding-small">
                            <p>You can drag or select a Web Forms IIIR to import at any point.</p>
                        </div>
                    </div>
                    <div class="w3-col s4">
                        <div class="w3-padding-small w3-right" style="font-size: small;">
                            <telerik:RadAsyncUpload ID="asyncNewDocument" runat="server"
                                UploadedFilesRendering="BelowFileInput"
                                HideFileInput="True"
                                Localization-Select="Select or Drop PDF Here">
                            </telerik:RadAsyncUpload>
                        </div>
                    </div>
                </div>
                <div class="w3-row">
                    <div class="w3-col s8">
                        <div class="w3-padding-small  w3-right">
                            <div style="color: #CC0000">This will overwrite the currently saved data!</div>
                        </div>
                    </div>
                    <div class="w3-col s4">
                        <div class="w3-padding-small w3-right" style="font-size: small;">
                            <telerik:RadButton ID="RadButton1" runat="server" Text="Import" Font-Size="Small" Skin="Black"></telerik:RadButton>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="w3-container">
            <p><strong>Individual Identification Information Record</strong></p>
            <p>Transaction Property Address:</p>
        </div>
        <div class="w3-container">
            <div class="w3-row">
                <div class="w3-col s3">
                    <div class="w3-padding-small">
                        <telerik:RadTextBox ID="txtp_streetnum" runat="server" EmptyMessage="Street Num" Width="100%"></telerik:RadTextBox>
                    </div>
                </div>
                <div class="w3-col s6">
                    <div class="w3-padding-small">
                        <telerik:RadTextBox ID="txtp_street" runat="server" EmptyMessage="Street" Width="100%"></telerik:RadTextBox>
                    </div>
                </div>
                <div class="w3-col s3">
                    <div class="w3-padding-small">
                        <telerik:RadTextBox ID="txtp_unitNumber" runat="server" EmptyMessage="Unit Num" Width="100%"></telerik:RadTextBox>
                    </div>
                </div>
            </div>
            <div class="w3-row">
                <div class="w3-col s3">
                    <div class="w3-padding-small">
                        <telerik:RadTextBox ID="txtp_city" runat="server" EmptyMessage="City" Width="100%"></telerik:RadTextBox>
                    </div>
                </div>
                <div class="w3-col s3">
                    <div class="w3-padding-small">
                        <telerik:RadTextBox ID="txtProvince" runat="server" EmptyMessage="Province" Width="100%"></telerik:RadTextBox>
                    </div>
                </div>
                <div class="w3-col s3">
                    <div class="w3-padding-small">
                        <telerik:RadTextBox ID="txtp_zipcode" runat="server" EmptyMessage="P Code" Width="100%"></telerik:RadTextBox>
                    </div>
                </div>
                <div class="w3-col s3">
                    <div class="w3-padding-small">
                    </div>
                </div>
            </div>
            <div class="w3-row">
                <div class="w3-col s6">
                    <div class="w3-padding-small">
                        <telerik:RadTextBox ID="txtpropAddrLine2" runat="server" EmptyMessage="Add Address" Width="100%"></telerik:RadTextBox>
                    </div>
                </div>
                <div class="w3-col s6">
                    <div class="w3-padding-small">
                    </div>
                </div>
            </div>
            <div class="w3-row">
                <div class="w3-col s3">
                    <div class="w3-padding-small" style="font-size: small">
                        <telerik:RadDropDownList ID="rddClientSource" runat="server" Font-Size="Small" Width="100%" DefaultMessage="[Source of Client]">
                            <Items>
                                <telerik:DropDownListItem runat="server" Text="New Client" Value="New Client" />
                                <telerik:DropDownListItem runat="server" Text="Past Client" Value="Past Client" />
                                <telerik:DropDownListItem runat="server" Text="Referal" Value="Referal" />
                                <telerik:DropDownListItem runat="server" Text="Friend" Value="Friend" />
                                <telerik:DropDownListItem runat="server" Text="Other" Value="Other" />
                            </Items>
                        </telerik:RadDropDownList>
                    </div>
                </div>
                <div class="w3-col s6">
                    <div class="w3-padding-small">
                        <telerik:RadTextBox ID="txtClientSource" runat="server" EmptyMessage="Detail your client relationship" Width="100%"></telerik:RadTextBox>
                    </div>
                </div>
                <div class="w3-col s3">
                    <div class="w3-padding-small">
                        <p style="font-size: small; color: #CC0000">Only for your Managing Broker</p>
                    </div>
                </div>
            </div>

            <p>Brokerage Details:</p>
            <div class="w3-row">
                <div class="w3-col s6">
                    <div class="w3-padding-small">
                        <telerik:RadTextBox ID="txtAgent" runat="server" Width="100%"></telerik:RadTextBox><br />
                        <p style="font-size: x-small; color: #CC0000">Brokerage Agent Name(s) (seperate with ,)</p>
                    </div>
                </div>
                <div class="w3-col s6">
                    <div class="w3-padding-small">
                        <telerik:RadTextBox ID="txtBroker" runat="server" Width="100%"></telerik:RadTextBox>
                        <%-- EmptyMessage="Brokerage Name"--%>
                    </div>
                </div>
            </div>
            <p>Date Verified:<small>(Information or Credit File)</small></p>
            <div class="w3-row">
                <div class="w3-col s3">
                    <div class="w3-padding-small">
                        <telerik:RadDatePicker ID="rdpVerifiedDate" runat="server" DateInput-EmptyMessage="Select Date"></telerik:RadDatePicker>
                    </div>
                </div>
                <div class="w3-col s6">
                    <div class="w3-padding-small">
                        <telerik:RadTextBox ID="txttodaysDated1_yyyy" runat="server" EmptyMessage="Year (yyyy)" Visible="False"></telerik:RadTextBox>
                        <telerik:RadTextBox ID="txttodaysDated1_mmmm" runat="server" EmptyMessage="Month (mm)" Visible="False"></telerik:RadTextBox>
                        <telerik:RadTextBox ID="txttodaysDated1_d" runat="server" EmptyMessage="Day (dd)" Visible="False"></telerik:RadTextBox>
                    </div>
                </div>
                <div class="w3-col s3">
                    <div class="w3-padding-small">
                    </div>
                </div>
            </div>
        </div>
    </telerik:RadPane>
    <telerik:RadSplitBar ID="RadSplitbar1" runat="server">
    </telerik:RadSplitBar>
    <telerik:RadPane ID="EndPane" runat="server" Width="22" Scrolling="None">
        <telerik:RadSlidingZone ID="RadSlidingZone1" runat="server" Width="25" ClickToOpen="True" SlideDirection="Left" RenderMode="Lightweight" ExpandedPaneId="RadSlidingPane1">
            <telerik:RadSlidingPane ID="RadSlidingPane1" Title="RULES" runat="server" Width="300" RenderMode="Lightweight" DockOnOpen="true">

                <uc1:uc_compliancenotes runat="server" id="uc_step_Verification" />

            </telerik:RadSlidingPane>
        </telerik:RadSlidingZone>
    </telerik:RadPane>
</telerik:RadSplitter>