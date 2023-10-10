<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Account/Admin.Master" CodeBehind="Settings_Global.aspx.vb" Inherits="SmartForms.Settings_Global" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <asp:HiddenField ID="hfUserName" runat="server" />
    <asp:HiddenField ID="hfAppName" runat="server" />
    <asp:HiddenField ID="hfCompanyId" runat="server" />

    <h3 class="w3-wide">System Wide Settings.</h3>
    <div class="w3-row">
        <div class="w3-container">
            <h5 class="w3-wide">Company Access by User</h5>
            <div class="w3-container w3-half">
                <telerik:RadGrid ID="rgvCompanyList" runat="server" DataSourceID="sqlCompanies" AutoGenerateColumns="False" Style="margin-top: 0px">
                    <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                    <MasterTableView DataSourceID="sqlCompanies" CommandItemDisplay="Top">
                        <RowIndicatorColumn ShowNoSortIcon="False"></RowIndicatorColumn>
                        <ExpandCollapseColumn ShowNoSortIcon="False"></ExpandCollapseColumn>
                        <Columns>
                            <telerik:GridTemplateColumn FilterControlAltText="Filter tmpChecked column" ShowNoSortIcon="False" UniqueName="tmpChecked">
                                <ItemTemplate>
                                    <telerik:RadCheckBox ID="rcbSelected" runat="server">
                                    </telerik:RadCheckBox>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="50px" />
                                <ItemStyle HorizontalAlign="Center" Width="50px" />
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="CompanyId" FilterControlAltText="Filter CompanyId column" HeaderText="CompanyId" ShowNoSortIcon="False" SortExpression="CompanyId" UniqueName="CompanyId" Visible="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="CompanyCode" FilterControlAltText="Filter CompanyCode column" HeaderText="CompanyCode" ShowNoSortIcon="False" SortExpression="CompanyCode" UniqueName="CompanyCode" Visible="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="CompanyName" FilterControlAltText="Filter CompanyName column" HeaderText="CompanyName" ShowNoSortIcon="False" SortExpression="CompanyName" UniqueName="CompanyName">
                            </telerik:GridBoundColumn>
                        </Columns>
                        <EditFormSettings EditFormType="Template">
                            <FormTemplate>
                                <div class="w3-row_padding">
                                    <div class="w3-third w3-container w3-padding_small">
                                        Company Name:
                                    </div>
                                    <div class="w3-twothird w3-container w3-padding_small">
                                        <telerik:RadTextBox ID="rtbCompanyName" runat="server" RenderMode="Lightweight" Font-Size="Small" Width="100%" ReadOnlyStyle-HorizontalAlign="Left"></telerik:RadTextBox>
                                    </div>
                                </div>
                                <div class="w3-row_padding">
                                    <div class="w3-third w3-container w3-padding_small">
                                        Short Code:
                                    </div>
                                    <div class="w3-third w3-container w3-padding_small">
                                        <telerik:RadTextBox ID="rtbCompanyCode" runat="server" RenderMode="Lightweight" Font-Size="Small" Width="100%" ReadOnlyStyle-HorizontalAlign="Left"></telerik:RadTextBox>
                                    </div>
                                    <div class="w3-third w3-container w3-padding_small">
                                        
                                    </div>
                                </div>
                                <div class="w3-row">
                                    <div class="w3-third w3-container w3-padding_small">
                                        Address:
                                    </div>
                                    <div class="w3-twothird w3-container w3-padding_small">
                                        <telerik:RadTextBox ID="rtbAddress" runat="server" RenderMode="Lightweight" Font-Size="Small" Width="100%" ReadOnlyStyle-HorizontalAlign="Left"></telerik:RadTextBox><br />
                                        <telerik:RadTextBox ID="rtbAltAddress" runat="server" RenderMode="Lightweight" Font-Size="Small" Width="100%" ReadOnlyStyle-HorizontalAlign="Left"></telerik:RadTextBox>
                                    </div>
                                </div>
                                <div class="w3-row">
                                    <div class="w3-third w3-container w3-padding_small">
                                        City / Prov:
                                    </div>
                                    <div class="w3-third w3-container w3-padding_small">
                                        <telerik:RadTextBox ID="RadTextBox1" runat="server" RenderMode="Lightweight" Font-Size="Small" Width="100%" ReadOnlyStyle-HorizontalAlign="Left"></telerik:RadTextBox>
                                    </div>
                                    <div class="w3-third w3-container w3-padding_small">
                                        <telerik:RadTextBox ID="RadTextBox2" runat="server" RenderMode="Lightweight" Font-Size="Small" Width="100%" ReadOnlyStyle-HorizontalAlign="Left"></telerik:RadTextBox>
                                    </div>
                                </div>
                                <div class="w3-row">
                                    <div class="w3-third w3-container w3-padding_small">
                                        Postal Code:
                                    </div>
                                    <div class="w3-third w3-container w3-padding_small">
                                        <telerik:RadTextBox ID="RadTextBox3" runat="server" RenderMode="Lightweight" Font-Size="Small" Width="100%" ReadOnlyStyle-HorizontalAlign="Left"></telerik:RadTextBox>
                                    </div>
                                    <div class="w3-third w3-container w3-padding_small">
                                    </div>
                                </div>
                                <div class="w3-row">
                                    <div class="w3-third w3-container w3-padding_small">
                                        <asp:Button ID="btnUpdate" Text='<%# IIf((TypeOf (Container) Is GridEditFormInsertItem), "Insert", "Update") %>'
                                            runat="server" CommandName='<%# IIf((TypeOf (Container) Is GridEditFormInsertItem), "PerformInsert", "Update")%>'></asp:Button>&nbsp;
                                        <asp:Button ID="btnCancel" Text="Cancel" runat="server" CausesValidation="False"
                                            CommandName="Cancel"></asp:Button>

                                    </div>
                                    <div class="w3-third w3-container w3-padding_small">
                                    </div>
                                    <div class="w3-third w3-container w3-padding_small">
                                    </div>
                                </div>
                            </FormTemplate>
                        </EditFormSettings>
                    </MasterTableView>
                </telerik:RadGrid>
            </div>
            <div class="w3-container w3-half">
                <telerik:RadGrid ID="rgvUserList" runat="server" DataSourceID="sqlUsers" AutoGenerateColumns="False" CellSpacing="-1" GridLines="Both">
                    <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                    <MasterTableView DataSourceID="sqlUsers">
                        <RowIndicatorColumn ShowNoSortIcon="False"></RowIndicatorColumn>
                        <ExpandCollapseColumn ShowNoSortIcon="False"></ExpandCollapseColumn>
                        <Columns>
                            <telerik:GridTemplateColumn FilterControlAltText="Filter tmpChecked column" ShowNoSortIcon="False" UniqueName="tmpChecked">
                                <ItemTemplate>
                                    <telerik:RadCheckBox ID="rcbSelected" runat="server">
                                    </telerik:RadCheckBox>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Width="50px" />
                                <ItemStyle HorizontalAlign="Center" Width="50px" />
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="UserName" FilterControlAltText="Filter UserName column" HeaderText="UserName" ShowNoSortIcon="False" SortExpression="UserName" UniqueName="UserName">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="UserAbbreviation" FilterControlAltText="Filter UserAbbreviation column" HeaderText="UserAbbreviation" ShowNoSortIcon="False" SortExpression="UserAbbreviation" UniqueName="UserAbbreviation" Visible="False">
                            </telerik:GridBoundColumn>
                        </Columns>
                        <EditFormSettings>
                            <EditColumn ShowNoSortIcon="False"></EditColumn>
                        </EditFormSettings>
                    </MasterTableView>
                </telerik:RadGrid>
            </div>

        </div>

        <br />
        <asp:SqlDataSource ID="sqlUsers" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="usp_UserManagedList" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="hfUserName" Name="username" PropertyName="Value" Type="String" />
                <asp:ControlParameter ControlID="hfAppName" Name="appname" PropertyName="Value" Type="String" />
                <asp:ControlParameter ControlID="hfCompanyId" Name="companyid" PropertyName="Value" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sqlCompanies" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="usp_CompanyManagedList" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="hfUserName" Name="username" PropertyName="Value" Type="String" />
                <asp:ControlParameter ControlID="hfAppName" Name="appname" PropertyName="Value" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
    </div>
</asp:Content>
