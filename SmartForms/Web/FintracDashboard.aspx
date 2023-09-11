﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Web/forms.Master" CodeBehind="FintracDashboard.aspx.vb" Inherits="SmartForms.FintracDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <script>         
        function getRadWindow() {
            var oWindow = null;
            if (window.radWindow)
                oWindow = window.radWindow;
            else if (window.frameElement.radWindow)
                oWindow = window.frameElement.radWindow;
            return oWindow;
        }
        function closeWin() {
            GetRadWindow().close();
        }
        // Reload parent page
        function refreshParentPage() {
            getRadWindow().BrowserWindow.location.reload();
            getRadWindow().close();
        }
    </script>


    <style>
        html, body, h1, h2, h3, h4, h5, h6 {
            font-family: "Roboto", sans-serif
        }

        p {
            font-size: small;
        }

        html .RadSearchBox .rsbInput {
            height: 30px;
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
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function RowDblClick(sender, eventArgs) {
                sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
            }

            function onPopUpShowing(sender, args) {
                args.get_popUp().className += " popUpEditForm";
            }
        </script>
    </telerik:RadCodeBlock>

    <telerik:RadAjaxLoadingPanel ID="ajaxNotice" runat="server" Skin="Default"></telerik:RadAjaxLoadingPanel>

    <telerik:RadTabStrip ID="RadTabStrip1" runat="server" MultiPageID="mpForms" SelectedIndex="0">
        <Tabs>
            <telerik:RadTab runat="server" Text="WEB FORMS" PageViewID="Webforms" Selected="True" SelectedIndex="0">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="FINTRAC" PageViewID="Fintrac" SelectedIndex="1">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>

    <telerik:RadMultiPage ID="mpForms" runat="server" MultiPageID="mpForms" SelectedIndex="0">
        <telerik:RadPageView ID="WebForms" runat="server">

            <div class="w3-row-padding w3-margin-top">
                <div class="w3-half">
                    <div class="w3-card w3-container">
                        <telerik:RadAjaxPanel ID="apanel_Left" runat="server" LoadingPanelID="ajaxNotice">
                            <div class="w3-row">
                                <div class="w3-col w3-padding-small" style="width: 180px">
                                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/SmartForms_Logo.png" />
                                </div>
                                <div class="w3-rest w3-padding-small">
                                </div>
                            </div>
                            <hr />
                            <p>This is a Proof of Concept (POC).</p>
                            <p>You have been invited to this site to review the content of this effort but PLEASE be aware that the contents, the processes, even the idea, is confidential.</p>
                            <p>Don't share this with anyone unless you discuss it with the Dev Team first.</p>
                            <p>
                                The two panels you see here are similar to, and made to replicate, the list of Web Kits and Forms you see in Transaction Desk when you use CREA Web Forms&copy;.
                            </p>
                            <p>
                                We are in conversation now with CREA to have access to this same list DIRECTLY from Web Forms&copy;. So the data withing any of the forms you have from Web Forms&copy; will be available automatically.
                            </p>
                            <p>
                                By &#39;dragging&#39; a &#39;fillable&#39; PDF from Web Forms&copy; onto the approriate item here you have, in effect, re-created what we hope to do automatically.
                            </p>
                            <p>
                                &nbsp;
                            </p>
                            <p>
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Web/SearchEngine.aspx" Target="_blank">HyperLink</asp:HyperLink>
                            </p>
                        </telerik:RadAjaxPanel>
                    </div>
                </div>

                <div class="w3-half">
                    <div class="w3-card w3-container">
                        <telerik:RadAjaxPanel ID="apanel_Right" runat="server" LoadingPanelID="ajaxNotice">
                            <p><strong>Web Forms Kit</strong></p>
                            <telerik:RadGrid RenderMode="Lightweight" ID="rgvWebKit" runat="server"
                                AllowSorting="True"
                                AutoGenerateColumns="False"
                                ShowStatusBar="True"
                                DataSourceID="odsWebKit" 
                                AutoGenerateDeleteColumn="True">
                                <MasterTableView Width="100%"
                                    CommandItemDisplay="Top"
                                    DataKeyNames="Id"
                                    DataSourceID="odsWebKit">
                                    <RowIndicatorColumn ShowNoSortIcon="False" Visible="False">
                                    </RowIndicatorColumn>
                                    <ExpandCollapseColumn ShowNoSortIcon="False" Created="True">
                                    </ExpandCollapseColumn>
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="Id" DataType="System.Int32" FilterControlAltText="Filter Id column" HeaderText="Id" ReadOnly="True" ShowNoSortIcon="False" SortExpression="Id" UniqueName="Id" Visible="False">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="FileName" FilterControlAltText="Filter FileName column" HeaderText="FileName" ShowNoSortIcon="False" SortExpression="FileName" UniqueName="FileName">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Address" FilterControlAltText="Filter Address column" HeaderText="Address" ShowNoSortIcon="False" SortExpression="Address" UniqueName="Address">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="AddAddress" FilterControlAltText="Filter AddAddress column" HeaderText="AddAddress" ShowNoSortIcon="False" SortExpression="AddAddress" UniqueName="AddAddress" Visible="False">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="City" FilterControlAltText="Filter City column" HeaderText="City" ShowNoSortIcon="False" SortExpression="City" UniqueName="City" Visible="False">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Province" FilterControlAltText="Filter Province column" HeaderText="Province" ShowNoSortIcon="False" SortExpression="Province" UniqueName="Province" Visible="False">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="PCode" FilterControlAltText="Filter PCode column" HeaderText="PCode" ShowNoSortIcon="False" SortExpression="PCode" UniqueName="PCode" Visible="False">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridEditCommandColumn ShowNoSortIcon="False">
                                            <HeaderStyle Width="50px" />
                                            <ItemStyle Width="50px" />
                                        </telerik:GridEditCommandColumn>
                                    </Columns>
                                    <EditFormSettings>
                                        <EditColumn ShowNoSortIcon="False">
                                        </EditColumn>
                                    </EditFormSettings>
                                </MasterTableView>
                                <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                                <ClientSettings 
                                    EnablePostBackOnRowClick="true">
                                    <Selecting AllowRowSelect="True" />
                                </ClientSettings>
                                <FilterMenu RenderMode="Lightweight">
                                </FilterMenu>
                                <HeaderContextMenu RenderMode="Lightweight">
                                </HeaderContextMenu>
                            </telerik:RadGrid>

                            <hr />
                            <p><strong>Web Kit Documents</strong></p>
                            <telerik:RadLabel ID="rlWarning" runat="server" ForeColor="#CC0000" RenderMode="Lightweight" Visible="False"></telerik:RadLabel>
                            <telerik:RadGrid ID="rgvForms" runat="server"
                                AutoGenerateColumns="False"
                                CellSpacing="-1"
                                GridLines="Both"
                                DataSourceID="odsFormsList"
                                AutoGenerateDeleteColumn="True" Height="209px">
                                <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                                <ClientSettings>
                                    <Selecting AllowRowSelect="True" />
                                    <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                                    
                                </ClientSettings>
                                <MasterTableView
                                    DataKeyNames="Id,RiskValue,FormType,HashCode"
                                    CommandItemDisplay="Bottom"
                                    DataSourceID="odsFormsList">
                                    <RowIndicatorColumn ShowNoSortIcon="False">
                                    </RowIndicatorColumn>
                                    <ExpandCollapseColumn ShowNoSortIcon="False">
                                    </ExpandCollapseColumn>
                                     <Columns>
                                        <telerik:GridTemplateColumn FilterControlAltText="Filter tmpSelect column" ShowNoSortIcon="False" UniqueName="tmpSelect">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="pdfDocuments" runat="server" ImageAlign="Middle" OnClick="pdfDocuments_Click" />
                                            </ItemTemplate>
                                            <HeaderStyle Width="40px" HorizontalAlign="Center" />
                                            <ItemStyle Width="40px" HorizontalAlign="Center" />
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridBoundColumn DataField="Id" DataType="System.Int32" FilterControlAltText="Filter Id column" HeaderText="Id" ReadOnly="True" ShowNoSortIcon="False" SortExpression="Id" UniqueName="Id" Visible="False">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="WebKitId" DataType="System.Int32" FilterControlAltText="Filter WebKitId column" HeaderText="WebKitId" ShowNoSortIcon="False" SortExpression="WebKitId" UniqueName="WebKitId" Visible="False">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="HashCode" FilterControlAltText="Filter HashCode column" HeaderText="HashCode" ShowNoSortIcon="False" SortExpression="HashCode" UniqueName="HashCode" Visible="False">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Title" FilterControlAltText="Filter Title column" HeaderText="Title" ShowNoSortIcon="False" SortExpression="Title" UniqueName="Title">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Description" FilterControlAltText="Filter Description column" HeaderText="Description" ShowNoSortIcon="False" SortExpression="Description" UniqueName="Description" Visible="False">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="FormType" FilterControlAltText="Filter FormType column" HeaderText="FormType" ShowNoSortIcon="False" SortExpression="FormType" UniqueName="FormType">
                                            <HeaderStyle Width="120px" />
                                            <ItemStyle Width="120px" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="UserName" FilterControlAltText="Filter UserName column" HeaderText="UserName" ShowNoSortIcon="False" SortExpression="UserName" UniqueName="UserName" Visible="False">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="CompOfficerId" DataType="System.Guid" FilterControlAltText="Filter CompOfficerId column" HeaderText="CompOfficerId" ShowNoSortIcon="False" SortExpression="CompOfficerId" UniqueName="CompOfficerId" Visible="False">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="PropertyAddress" FilterControlAltText="Filter PropertyAddress column" HeaderText="PropertyAddress" ShowNoSortIcon="False" SortExpression="PropertyAddress" UniqueName="PropertyAddress" Visible="False">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="RiskValue" FilterControlAltText="Filter RiskValue column" HeaderText="RiskValue" ShowNoSortIcon="False" SortExpression="RiskValue" UniqueName="RiskValue" Visible="False">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="CompFileReference" FilterControlAltText="Filter CompFileReference column" HeaderText="CompFileReference" ShowNoSortIcon="False" SortExpression="CompFileReference" UniqueName="CompFileReference" Visible="False">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="CreatedBy" FilterControlAltText="Filter CreatedBy column" HeaderText="CreatedBy" ShowNoSortIcon="False" SortExpression="CreatedBy" UniqueName="CreatedBy" Visible="False">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="CreatedOn" DataType="System.DateTime" FilterControlAltText="Filter CreatedOn column" HeaderText="CreatedOn" ShowNoSortIcon="False" SortExpression="CreatedOn" UniqueName="CreatedOn" Visible="False">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="LastModBy" FilterControlAltText="Filter LastModBy column" HeaderText="LastModBy" ShowNoSortIcon="False" SortExpression="LastModBy" UniqueName="LastModBy" Visible="False">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="LastModOn" DataType="System.DateTime" FilterControlAltText="Filter LastModOn column" HeaderText="LastModOn" ShowNoSortIcon="False" SortExpression="LastModOn" UniqueName="LastModOn" Visible="False">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="CompanyId" DataType="System.Guid" FilterControlAltText="Filter CompanyId column" HeaderText="CompanyId" ShowNoSortIcon="False" SortExpression="CompanyId" UniqueName="CompanyId" Visible="False">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="JurisdictionId" DataType="System.Guid" FilterControlAltText="Filter JurisdictionId column" HeaderText="JurisdictionId" ShowNoSortIcon="False" SortExpression="JurisdictionId" UniqueName="JurisdictionId" Visible="False">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridTemplateColumn FilterControlAltText="Filter tmpSelect column" ShowNoSortIcon="False" UniqueName="tmpSelect" HeaderText="Edit">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ibDocuments" runat="server" ImageAlign="Middle" OnClick="ibDocuments_Click" />
                                            </ItemTemplate>
                                            <HeaderStyle Width="40px" HorizontalAlign="Center" />
                                            <ItemStyle Width="40px" HorizontalAlign="Center" />
                                        </telerik:GridTemplateColumn>

                                    </Columns>
                                    <EditFormSettings>
                                        <EditColumn ShowNoSortIcon="False">
                                        </EditColumn>
                                    </EditFormSettings>
                                </MasterTableView>
                            </telerik:RadGrid>


                            <telerik:RadWindowManager ID="window_mgr" runat="server"
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

                        </telerik:RadAjaxPanel>
                    </div>
                </div>


            </div>


        </telerik:RadPageView>
        <telerik:RadPageView ID="Fintrac" runat="server">
        </telerik:RadPageView>
    </telerik:RadMultiPage>
    <asp:HiddenField ID="hfWebKitId" runat="server" />


    <asp:ObjectDataSource ID="odsWebKit" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="SmartForms.smartDataTableAdapters.file_WebKitTA" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="FileName" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="AddAddress" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="Province" Type="String" />
            <asp:Parameter Name="PCode" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="FileName" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="AddAddress" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="Province" Type="String" />
            <asp:Parameter Name="PCode" Type="String" />
            <asp:Parameter Name="Original_Id" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>

    <asp:ObjectDataSource ID="odsFormsList" runat="server" 
        DeleteMethod="Delete" 
        InsertMethod="Insert" 
        OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetSingleKit" 
        TypeName="SmartForms.smartDataTableAdapters.data_FormListTA" 
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="WebKitId" Type="Int32" />
            <asp:Parameter Name="HashCode" Type="String" />
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="FormType" Type="String" />
            <asp:Parameter Name="UserName" Type="String" />
            <asp:Parameter DbType="Guid" Name="CompOfficerId" />
            <asp:Parameter Name="PropertyAddress" Type="String" />
            <asp:Parameter Name="RiskValue" Type="String" />
            <asp:Parameter Name="CompFileReference" Type="String" />
            <asp:Parameter Name="CreatedBy" Type="String" />
            <asp:Parameter Name="CreatedOn" Type="DateTime" />
            <asp:Parameter Name="LastModBy" Type="String" />
            <asp:Parameter Name="LastModOn" Type="DateTime" />
            <asp:Parameter DbType="Guid" Name="CompanyId" />
            <asp:Parameter DbType="Guid" Name="JurisdictionId" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="hfWebKitId" Name="webkitid" PropertyName="Value" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="WebKitId" Type="Int32" />
            <asp:Parameter Name="HashCode" Type="String" />
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="FormType" Type="String" />
            <asp:Parameter Name="UserName" Type="String" />
            <asp:Parameter DbType="Guid" Name="CompOfficerId" />
            <asp:Parameter Name="PropertyAddress" Type="String" />
            <asp:Parameter Name="RiskValue" Type="String" />
            <asp:Parameter Name="CompFileReference" Type="String" />
            <asp:Parameter Name="CreatedBy" Type="String" />
            <asp:Parameter Name="CreatedOn" Type="DateTime" />
            <asp:Parameter Name="LastModBy" Type="String" />
            <asp:Parameter Name="LastModOn" Type="DateTime" />
            <asp:Parameter DbType="Guid" Name="CompanyId" />
            <asp:Parameter DbType="Guid" Name="JurisdictionId" />
            <asp:Parameter Name="Original_Id" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>

    <asp:SqlDataSource ID="sqlFormTypes" runat="server" ConnectionString="<%$ ConnectionStrings:smartData %>"
        SelectCommand="SELECT 0 As [Id], '' As [Vertical], '[Select a Form Type]' As  [DisplayName], '' As [HashCode] UNION SELECT [Id],[Vertical], [DisplayName], [HashCode]  FROM [dbo].[forms_Catalog] ORDER BY [DisplayName]"></asp:SqlDataSource>

</asp:Content>
