<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Web/forms.Master" CodeBehind="PropertyFintrac.aspx.vb" Inherits="SmartForms.PropertyFintrac" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.2.2/pdf.js"></script>
    <script>
        window.pdfjsLib.GlobalWorkerOptions.workerSrc = 'https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.2.2/pdf.worker.js';
    </script>


    <div class="w3-container">
        <div class="w3-row w3-margin-top">
            <div class="w3-third w3-container">
                <asp:Panel ID="panelNewCard" runat="server">
                    <div class="w3-panel w3-card">
                        <telerik:RadComboBox ID="rcbForm" runat="server" Width="100%" AutoPostBack="True" EnableLoadOnDemand="True" RenderMode="Lightweight"></telerik:RadComboBox>
                        <br />
                       
                        <hr />
                        <p style="text-decoration: underline">FILE CARD</p>
                       
                        <table style="width: 100%; font-size: small;">
                             <tr>
                                <td style="padding-top: 3px; padding-bottom: 3px; width: 33.3%">MLS</td>
                                <td style="padding-top: 3px; padding-bottom: 3px; width: 66.3%">
                                    <telerik:RadTextBox ID="rtbMLS" runat="server" Width="50%" ReadOnly="True"></telerik:RadTextBox>
                                    &nbsp;&nbsp;
                                    <asp:LinkButton ID="lbSearchDDF" runat="server">Search MLS</asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-top: 3px; padding-bottom: 3px; width: 33.3%">Property Address</td>
                                <td style="padding-top: 3px; padding-bottom: 3px; width: 66.3%">
                                    <telerik:RadTextBox ID="rtbPropertyAddress" runat="server" Width="90%" ReadOnly="True"></telerik:RadTextBox>
                                    <telerik:RadTextBox ID="rtbFileTitle" runat="server" Width="90%" ReadOnly="True" Visible="False"></telerik:RadTextBox>
                                    
                                </td>

                            </tr>
                            <tr>
                                <td style="padding-top: 3px; padding-bottom: 3px; width: 33.3%">Agent E Mail</td>
                                <td style="padding-top: 3px; padding-bottom: 3px; width: 66.3%">
                                    <telerik:RadTextBox ID="rtbAgentName" runat="server" Width="90%" ReadOnly="True"></telerik:RadTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-top: 3px; padding-bottom: 3px; width: 33.3%"></td>
                                <td style="padding-top: 3px; padding-bottom: 3px; width: 66.3%">
                                     <asp:LinkButton ID="lbNewRecord" runat="server">New</asp:LinkButton>

                                </td>

                            </tr>
                        </table>
                    </div>
                </asp:Panel>
               
                <%--<telerik:RadButton ID="rbLoadPdf" runat="server" Text="Load">
                </telerik:RadButton>
                <hr />--%>
                        <telerik:RadGrid ID="rgFieldList" runat="server" DataSourceID="sqlFieldDataList" CellSpacing="-1" GridLines="Both">
                            <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                            <MasterTableView AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="sqlFieldDataList">
                                <Columns>
                                    <telerik:GridBoundColumn DataField="Id" DataType="System.Int32" FilterControlAltText="Filter Id column" HeaderText="Id" ReadOnly="True" SortExpression="Id" UniqueName="Id">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="FormGUID" FilterControlAltText="Filter FormGUID column" HeaderText="FormGUID" SortExpression="FormGUID" UniqueName="FormGUID" DataType="System.Guid">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="FormName" FilterControlAltText="Filter FormName column" HeaderText="FormName" SortExpression="FormName" UniqueName="FormName">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="UserName" FilterControlAltText="Filter UserName column" HeaderText="UserName" SortExpression="UserName" UniqueName="UserName">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="DealId" FilterControlAltText="Filter DealId column" HeaderText="DealId" SortExpression="DealId" UniqueName="DealId">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="DataGroup" FilterControlAltText="Filter DataGroup column" HeaderText="DataGroup" SortExpression="DataGroup" UniqueName="DataGroup">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="FormField" FilterControlAltText="Filter FormField column" HeaderText="FormField" SortExpression="FormField" UniqueName="FormField">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="FormValue" FilterControlAltText="Filter FormValue column" HeaderText="FormValue" SortExpression="FormValue" UniqueName="FormValue">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="LastModOn" DataType="System.DateTime" FilterControlAltText="Filter LastModOn column" HeaderText="LastModOn" SortExpression="LastModOn" UniqueName="LastModOn">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="LastModBy" FilterControlAltText="Filter LastModBy column" HeaderText="LastModBy" SortExpression="LastModBy" UniqueName="LastModBy">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="CreatedOn" DataType="System.DateTime" FilterControlAltText="Filter CreatedOn column" HeaderText="CreatedOn" SortExpression="CreatedOn" UniqueName="CreatedOn">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="CreatedBy" FilterControlAltText="Filter CreatedBy column" HeaderText="CreatedBy" SortExpression="CreatedBy" UniqueName="CreatedBy">
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>

                <asp:SqlDataSource ID="sqlFieldDataList" runat="server" ConnectionString="<%$ ConnectionStrings:canadaData %>" SelectCommand="SELECT * FROM [fintrac_FormData] WHERE ([FormName] = @FormName)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="rtbFileTitle" Name="FormName" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
            </div>
            <div class="w3-twothird w3-container">
                <telerik:RadPdfViewer ID="RadPdfViewer1" runat="server" Height="1000px" Width="100%" RenderMode="Lightweight">
                </telerik:RadPdfViewer>
                <%--<asp:Panel ID="Panel1" runat="server"></asp:Panel>--%>
            </div>
        </div>
    </div>


</asp:Content>
