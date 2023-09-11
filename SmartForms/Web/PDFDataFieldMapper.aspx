<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Web/forms.Master" CodeBehind="PDFDataFieldMapper.aspx.vb" Inherits="SmartForms.PDFDataFieldMapper" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HiddenField ID="hfSeller1" runat="server" />
    <asp:HiddenField ID="hfSeller2" runat="server" />
    <asp:HiddenField ID="hfSeller3" runat="server" />
    <div class="w3-row">
        <div class="w3-half w3-container w3-padding-small">
            <p class="w3-wide">Forms Field Mapping Utility</p>
        </div>
        <div class="w3-half w3-container w3-padding-small">
            <asp:LinkButton ID="lbShowPanel" runat="server">Show Help Panel</asp:LinkButton>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="lbTestCode" runat="server" PostBackUrl="~/Web/TestPDFViewer.aspx">Test Class Call</asp:LinkButton>
        </div>
    </div>
    <asp:Panel ID="panel_topbar" runat="server" Visible="False">
        <div class="w3-row">
            <div class="w3-twothird w3-container w3-padding-small">
                Drop a Listing Contract or CPS here to import a new Web Kit:<br />
                <small>(As long as you have saved a Listing Contract or the Contract for Sale or Purchase as an 'Editable PDF' we can parse the data from it to create you FINTRAC Kit without re-entering the data.<br />
                    An approach to CREA is in the works to have access to your Web Kits in this UI which will automate this part of the process.)</small>
                <br />
                <br />
            </div>
            <div class="w3-third w3-container w3-padding-small">
            </div>
        </div>
    </asp:Panel>
    <div class="w3-container">
        <div class="w3-half w3-container w3-padding-small">
            <div class="w3-container w3-padding-small">
                <telerik:RadComboBox ID="rcbFintracForm" runat="server" DataSourceID="sqlFintracForms" DataTextField="DisplayName" DataValueField="HashCode" Width="75%" AutoPostBack="True" EmptyMessage="FINTRAC to Map"></telerik:RadComboBox>
                <div class="w3-container w3-padding-small">
                    <asp:LinkButton ID="lbViewFintrac" runat="server">View PDF for reference</asp:LinkButton>
                </div>
            </div>
        </div>

        <div class="w3-half w3-container w3-padding-small">
            <asp:Panel ID="panelUpload" runat="server">
                <telerik:RadAsyncUpload ID="asyncNewDocument" runat="server"
                    UploadedFilesRendering="BelowFileInput"
                    HideFileInput="True"
                    Localization-Select="Select or Drop Contract to Map Here">
                </telerik:RadAsyncUpload>
                <div class="w3-row">
                    <div class="w3-half w3-container w3-padding-small">
                        <telerik:RadButton ID="rbRightLoad" runat="server" Text="Import" Font-Size="Small" Skin="Black"></telerik:RadButton>
                    </div>
                    <div class="w3-half w3-container w3-padding-small">
                        <telerik:RadCheckBox ID="rcbRightPaging" runat="server" Text="Remove Paging" Checked="True" RenderMode="Lightweight"></telerik:RadCheckBox>
                    </div>
                </div>
            </asp:Panel>
            <div class="w3-row">
                <div class="w3-twothird w3-container w3-padding-small">
                    <telerik:RadLabel ID="rlFileUploaded" runat="server" Visible="False"></telerik:RadLabel>
                </div>
                <div class="w3-third w3-container w3-padding-small">
                    <asp:LinkButton ID="lbResetUpload" runat="server" Visible="False">Reset Upload</asp:LinkButton>
                </div>
            </div>



        </div>





    </div>

    <div class="w3-half w3-container w3-padding-small">
        <div class="w3-container w3-padding-small">
            <telerik:RadGrid ID="rgvLeftSide" runat="server" AllowSorting="True" CellSpacing="-1" GridLines="Both">
                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                <ClientSettings EnablePostBackOnRowClick="true">
                    <Selecting AllowRowSelect="True" />
                    <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                </ClientSettings>
                <MasterTableView DataKeyNames="KeyName">
                    <RowIndicatorColumn ShowNoSortIcon="False"></RowIndicatorColumn>
                    <ExpandCollapseColumn ShowNoSortIcon="False"></ExpandCollapseColumn>
                    <EditFormSettings>
                        <EditColumn ShowNoSortIcon="False"></EditColumn>
                    </EditFormSettings>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </div>
    <div class="w3-half w3-container w3-padding-small">
        <div class="w3-container  w3-padding-small">
            <telerik:RadGrid ID="rgvRightSide" runat="server"
                AutoGenerateColumns="False" CellSpacing="-1" GridLines="Both">
                <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                <ClientSettings>
                    <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                </ClientSettings>
                <MasterTableView 
                     DataKeyNames="KeyName"
                    AutoGenerateColumns="False">
                    <RowIndicatorColumn ShowNoSortIcon="False"></RowIndicatorColumn>
                    <ExpandCollapseColumn ShowNoSortIcon="False"></ExpandCollapseColumn>
                    <Columns>
                        <telerik:GridTemplateColumn FilterControlAltText="Filter tmpSelect column" ShowNoSortIcon="False" UniqueName="tmpSelect">
                            <ItemTemplate>
                                <telerik:RadCheckBox ID="rcbSelectItem" runat="server">
                                </telerik:RadCheckBox>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="KeyName" FilterControlAltText="Filter KeyName column" HeaderText="Key Name" ShowNoSortIcon="False" UniqueName="KeyName">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="KeyType" FilterControlAltText="Filter KeyType column" HeaderText="Key Type" ShowNoSortIcon="False" UniqueName="KeyType">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="KeyValue" FilterControlAltText="Filter KeyValue column" HeaderText="Key Value" ShowNoSortIcon="False" UniqueName="KeyValue">
                        </telerik:GridBoundColumn>
                    </Columns>
                    <EditFormSettings>
                        <EditColumn ShowNoSortIcon="False"></EditColumn>
                    </EditFormSettings>
                </MasterTableView>
            </telerik:RadGrid>

        </div>
    </div>





    <asp:SqlDataSource ID="sqlFintracForms" runat="server" ConnectionString="<%$ ConnectionStrings:smartData %>" SelectCommand="SELECT '[Select Fintrac Template]' As [DisplayName], '' As [HashCode] UNION SELECT DisplayName, HashCode FROM dbo.forms_Catalog WHERE (Vertical = N'FINTRAC') ORDER BY DisplayName"></asp:SqlDataSource>
</asp:Content>
