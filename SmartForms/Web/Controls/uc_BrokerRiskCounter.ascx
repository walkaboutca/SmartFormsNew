<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="uc_BrokerRiskCounter.ascx.vb" Inherits="SmartForms.uc_BrokerRiskCounter" %>
<style type="text/css">
    .reLeftVerticalSide,
    .reRightVerticalSide,
    .reToolZone,
    .reToolCell {
        background: white !important;
    }

    .reToolCell {
        display: none\9 !important; /* for all versions of IE in order to prevent border bottom disappearing */
    }

    .reContentCell {
        border-width: 0 !important;
    }

    .formInput {
        border: solid 1px black;
    }

    .RadEditor {
        filter: grayscale();
    }

    .reWrapper_corner,
    .reWrapper_center {
        display: none !important; /* for FF */
    }

    td.reWrapper_corner,
    td.reWrapper_center {
        display: block\9 !important; /* for all versions of IE */
    }
</style>
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



<div class="w3-row">
    <div class="w3-container w3-twothird">
        <div class="w3-panel w3-border w3-border-teal w3-padding-small" style="vertical-align: middle">

            <div class="w3-row" style="vertical-align: middle">
                <div class="w3-col s6" style="font-size: medium">
                    <p class="w3-wide" style="padding-top: 10px">Risk Managment</p>
                </div>
                <div class="w3-col s2">
                    <telerik:RadPushButton ID="rbSummary_Low" runat="server" Width="100px">
                        <ContentTemplate>
                            <div class="w3-round-xxlarge w3-green">
                                <telerik:RadLabel ID="rlSummary_Low" runat="server" Font-Size="Medium"></telerik:RadLabel>
                            </div>
                        </ContentTemplate>
                    </telerik:RadPushButton>
                    <telerik:RadToolTip ID="RadToolTip1" runat="server" Text="O/S vs Active Files" TargetControlID="rbSummary_Low"></telerik:RadToolTip>
                </div>
                <div class="w3-col s2">
                    <telerik:RadPushButton ID="rbSummary_Med" runat="server" Width="100px">
                        <ContentTemplate>
                            <div class="w3-round-xxlarge w3-yellow">
                                <telerik:RadLabel ID="rlSummary_Med" runat="server" Font-Size="Medium"></telerik:RadLabel>
                            </div>
                        </ContentTemplate>
                    </telerik:RadPushButton>
                    <telerik:RadToolTip ID="RadToolTip2" runat="server" Text="O/S vs Active Files" TargetControlID="rbSummary_Med"></telerik:RadToolTip>
                </div>
                <div class="w3-col s2">
                    <telerik:RadPushButton ID="rbSummary_High" runat="server" Width="100px">
                        <ContentTemplate>
                            <div class="w3-round-xxlarge w3-red">
                                <telerik:RadLabel ID="rlSummary_High" runat="server" Font-Size="Medium"></telerik:RadLabel>
                            </div>
                        </ContentTemplate>
                    </telerik:RadPushButton>
                    <telerik:RadToolTip ID="RadToolTip3" runat="server" Text="O/S vs Active Files" TargetControlID="rbSummary_High"></telerik:RadToolTip>
                </div>
            </div>
        </div>

    </div>
    <div class="w3-container w3-third">
    </div>

    <div class="w3-row">
        <div class="w3-container w3-twothird">
            <div>
                <telerik:RadGrid ID="rgvFiltered" runat="server" AutoGenerateEditColumn="True" DataSourceID="sqlRiskFiltered">
                    <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                    <ClientSettings EnablePostBackOnRowClick="true">
                        <Selecting AllowRowSelect="True" />
                    </ClientSettings>
                    <MasterTableView AutoGenerateColumns="False" DataKeyNames="Id,FormId,RiskAssessment,NewRiskAssessment" DataSourceID="sqlRiskFiltered">
                        <RowIndicatorColumn ShowNoSortIcon="False"></RowIndicatorColumn>
                        <ExpandCollapseColumn ShowNoSortIcon="False"></ExpandCollapseColumn>
                        <Columns>
                        <telerik:GridBoundColumn DataField="Id" DataType="System.Int32" FilterControlAltText="Filter Id column" HeaderText="Id" ReadOnly="True" ShowNoSortIcon="False" SortExpression="Id" UniqueName="Id" Visible="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="AuditId" DataType="System.Int32" FilterControlAltText="Filter AuditId column" HeaderText="AuditId" ShowNoSortIcon="False" SortExpression="AuditId" UniqueName="AuditId" Visible="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="WebKitId" DataType="System.Int32" FilterControlAltText="Filter WebKitId column" HeaderText="WebKitId" ShowNoSortIcon="False" SortExpression="WebKitId" UniqueName="WebKitId" Visible="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="FormId" DataType="System.Int32" FilterControlAltText="Filter FormId column" HeaderText="FormId" ShowNoSortIcon="False" SortExpression="FormId" UniqueName="FormId" Visible="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SearchDate" DataType="System.DateTime" FilterControlAltText="Filter SearchDate column" HeaderText="SearchDate" ShowNoSortIcon="False" SortExpression="SearchDate" UniqueName="SearchDate" DataFormatString="{0:d}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Title" FilterControlAltText="Filter Title column" HeaderText="Title" ShowNoSortIcon="False" SortExpression="Title" UniqueName="Title">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="FormType" FilterControlAltText="Filter FormType column" HeaderText="FormType" ShowNoSortIcon="False" SortExpression="FormType" UniqueName="FormType">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SearchCriteria" FilterControlAltText="Filter SearchCriteria column" HeaderText="SearchCriteria" ShowNoSortIcon="False" SortExpression="SearchCriteria" UniqueName="SearchCriteria" Visible="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="BingResult" FilterControlAltText="Filter BingResult column" HeaderText="BingResult" ShowNoSortIcon="False" SortExpression="BingResult" UniqueName="BingResult" Visible="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="WikiResult" FilterControlAltText="Filter WikiResult column" HeaderText="WikiResult" ShowNoSortIcon="False" SortExpression="WikiResult" UniqueName="WikiResult" Visible="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="RiskAssessment" FilterControlAltText="Filter RiskAssessment column" HeaderText="AI" ShowNoSortIcon="False" SortExpression="RiskAssessment" UniqueName="RiskAssessment">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="NewRiskAssessment" FilterControlAltText="Filter NewRiskAssessment column" HeaderText="Broker" ShowNoSortIcon="False" SortExpression="NewRiskAssessment" UniqueName="NewRiskAssessment">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Active" DataType="System.Int32" FilterControlAltText="Filter Active column" HeaderText="Active" ShowNoSortIcon="False" SortExpression="Active" UniqueName="Active" Visible="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="AdminNotes" FilterControlAltText="Filter AdminNotes column" HeaderText="AdminNotes" ShowNoSortIcon="False" SortExpression="AdminNotes" UniqueName="AdminNotes" Visible="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="OfficerNotes" FilterControlAltText="Filter OfficerNotes column" HeaderText="OfficerNotes" ShowNoSortIcon="False" SortExpression="OfficerNotes" UniqueName="OfficerNotes" Visible="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="CreatedOn" DataType="System.DateTime" FilterControlAltText="Filter CreatedOn column" HeaderText="CreatedOn" ShowNoSortIcon="False" SortExpression="CreatedOn" UniqueName="CreatedOn" Visible="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="LastModBy" FilterControlAltText="Filter LastModBy column" HeaderText="LastModBy" ShowNoSortIcon="False" SortExpression="LastModBy" UniqueName="LastModBy" Visible="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="LastModDate" DataType="System.DateTime" FilterControlAltText="Filter LastModDate column" HeaderText="LastModDate" ShowNoSortIcon="False" SortExpression="LastModDate" UniqueName="LastModDate" Visible="False">
                        </telerik:GridBoundColumn>
                        </Columns>
                        <EditFormSettings EditFormType="Template">
                            <EditColumn ShowNoSortIcon="False" UniqueName="EditCommandColumn1" FilterControlAltText="Filter EditCommandColumn1 column"></EditColumn>
                            <FormTemplate>
                                <table id="Table2" cellspacing="2" cellpadding="1" width="100%" border="0" rules="none"
                                    style="border-collapse: collapse;">
                                    <tr class="EditFormHeader">
                                        <td colspan="2">
                                            <b>Risk Form Details</b>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>

                                            <asp:LinkButton ID="lbEditEdit" CommandName="PerformInsert" runat="server">Save and Close</asp:LinkButton>&nbsp;&nbsp;
                                    <asp:LinkButton ID="lbEditClose" CommandName="Cancel" runat="server" CausesValidation="False">Cancel</asp:LinkButton>

                                        </td>
                                    </tr>
                                </table>
                            </FormTemplate>
                        </EditFormSettings>
                    </MasterTableView>
                </telerik:RadGrid>
              


            </div>
            
            <div class="w3-panel w3-topbar w3-border-teal">
                <asp:Panel ID="panel_Options" runat="server">
                    <div class="w3-container w3-padding-small">
                        <telerik:RadListBox ID="rlbAssignRisk" runat="server" Font-Size="Small" AutoPostBack="True" RenderMode="Lightweight">
                            <ButtonSettings TransferButtons="All" />
                            <Items>
                                <telerik:RadListBoxItem runat="server" ImageUrl="~/Images/Green_25X25.png" Text="Low" Value="Low" />
                                <telerik:RadListBoxItem runat="server" ImageUrl="~/Images/Yellow_25X25.png" Text="Medium" Value="Medium" />
                                <telerik:RadListBoxItem runat="server" ImageUrl="~/Images/Red_25X25.png" Text="High" Value="High" />

                            </Items>
                        </telerik:RadListBox>
                    </div>

                </asp:Panel>
            </div>


        </div>
        <div class="w3-container w3-third">

            <div style="font-size: small">

                <telerik:RadEditor ID="reSearchNotes" runat="server"
                    RenderMode="Lightweight"
                    ToolbarMode="ShowOnFocus"
                    ToolsFile="~/Classes/BasicTools.xml"
                    Width="100%" 
                    EmptyMessage="No Notes currently on file." 
                    EditModes="Preview" 
                    NewLineMode="Br" 
                    ContentAreaMode="Div">
                </telerik:RadEditor>
              
            </div>
            <hr />
            <div style="font-size: small">

                <telerik:RadEditor ID="reOfficeNotes" runat="server"
                    RenderMode="Lightweight"
                    ToolbarMode="ShowOnFocus"
                    ToolsFile="~/Classes/BasicTools.xml"
                    Width="100%"
                    EmptyMessage="No Notes currently on file." 
                    EditModes="Design" 
                    NewLineMode="Br" 
                    ContentAreaMode="Div">
                </telerik:RadEditor>
              

            </div>
        </div>
    </div>
</div>

<asp:HiddenField ID="hfRiskFilter" runat="server" />

<asp:SqlDataSource ID="sqlRiskFiltered" runat="server" ConnectionString="<%$ ConnectionStrings:smartData %>" SelectCommand="usp_SearchAuditFiltered" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:ControlParameter ControlID="hfRiskFilter" DefaultValue="High" Name="filter" PropertyName="Value" Type="String" />
    </SelectParameters>
</asp:SqlDataSource>


<telerik:RadNotification RenderMode="Lightweight" ID="notice_Popup" runat="server" 
    Position="BottomRight"
    AutoCloseDelay="2000" 
    Width="400" 
    Height="150" 
    Title="Smart Messages" 
    EnableRoundedCorners="true" 
    Skin="Office2010Black">
</telerik:RadNotification>


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
