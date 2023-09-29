<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="uc_BrokerRiskCounter.ascx.vb" Inherits="SmartForms.uc_BrokerRiskCounter" %>

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
            <telerik:RadGrid ID="rgvCurrentFiles" runat="server" DataSourceID="odsFiles">
                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>

                <MasterTableView AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="odsFiles">
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

                    <EditFormSettings>
                        <EditColumn ShowNoSortIcon="False"></EditColumn>
                    </EditFormSettings>
                </MasterTableView>
            </telerik:RadGrid>

        </div>
        <div class="w3-container w3-third">
        </div>
    </div>
</div>
<asp:ObjectDataSource ID="odsFiles" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="SmartForms.smartDataTableAdapters.searchAuditFilesTA" UpdateMethod="Update">
    <DeleteParameters>
        <asp:Parameter Name="Original_Id" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="AuditId" Type="Int32" />
        <asp:Parameter Name="WebKitId" Type="Int32" />
        <asp:Parameter Name="FormId" Type="Int32" />
        <asp:Parameter Name="SearchDate" Type="DateTime" />
        <asp:Parameter Name="SearchCriteria" Type="String" />
        <asp:Parameter Name="BingResult" Type="String" />
        <asp:Parameter Name="WikiResult" Type="String" />
        <asp:Parameter Name="RiskAssessment" Type="String" />
        <asp:Parameter Name="NewRiskAssessment" Type="String" />
        <asp:Parameter Name="Active" Type="Int32" />
        <asp:Parameter Name="AdminNotes" Type="String" />
        <asp:Parameter Name="OfficerNotes" Type="String" />
        <asp:Parameter Name="CreatedOn" Type="DateTime" />
        <asp:Parameter Name="LastModBy" Type="String" />
        <asp:Parameter Name="LastModDate" Type="DateTime" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="AuditId" Type="Int32" />
        <asp:Parameter Name="WebKitId" Type="Int32" />
        <asp:Parameter Name="FormId" Type="Int32" />
        <asp:Parameter Name="SearchDate" Type="DateTime" />
        <asp:Parameter Name="SearchCriteria" Type="String" />
        <asp:Parameter Name="BingResult" Type="String" />
        <asp:Parameter Name="WikiResult" Type="String" />
        <asp:Parameter Name="RiskAssessment" Type="String" />
        <asp:Parameter Name="NewRiskAssessment" Type="String" />
        <asp:Parameter Name="Active" Type="Int32" />
        <asp:Parameter Name="AdminNotes" Type="String" />
        <asp:Parameter Name="OfficerNotes" Type="String" />
        <asp:Parameter Name="CreatedOn" Type="DateTime" />
        <asp:Parameter Name="LastModBy" Type="String" />
        <asp:Parameter Name="LastModDate" Type="DateTime" />
        <asp:Parameter Name="Original_Id" Type="Int32" />
    </UpdateParameters>
</asp:ObjectDataSource>
