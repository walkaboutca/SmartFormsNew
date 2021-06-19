<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Web/forms.Master" CodeBehind="FintracForms.aspx.vb" Inherits="SmartForms.FintracForms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.2.2/pdf.js"></script>
    <script>
        window.pdfjsLib.GlobalWorkerOptions.workerSrc = 'https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.2.2/pdf.worker.js';
    </script>


    <div class="w3-container">
        <div class="w3-row w3-margin-top">
            <div class="w3-third w3-container">
                <telerik:RadComboBox ID="rcbForm" runat="server" Width="100%" AutoPostBack="True" EnableLoadOnDemand="True" RenderMode="Lightweight"></telerik:RadComboBox>


                <div class="w3-panel w3-card">
                    <p>FILE CARD</p>
                    <hr />
                    <table style="width: 100%; font-size: small;">
                        <tr>
                            <td style="padding-top: 3px; padding-bottom: 3px; width: 33.3%">File Title
                            </td>
                            <td style="padding-top: 3px; padding-bottom: 3px; width: 66.3%">
                                <telerik:RadTextBox ID="rtbFileTitle" runat="server" Width="90%"></telerik:RadTextBox>
                            </td>

                        </tr>
                        <tr>
                            <td style="padding-top: 3px; padding-bottom: 3px; width: 33.3%">Agent Name
                            </td>
                            <td style="padding-top: 3px; padding-bottom: 3px; width: 66.3%">
                                <telerik:RadTextBox ID="rtbAgentName" runat="server" Width="90%"></telerik:RadTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-top: 3px; padding-bottom: 3px; width: 33.3%"></td>
                            <td style="padding-top: 3px; padding-bottom: 3px; width: 66.3%"></td>

                        </tr>
                    </table>
                </div>

                <telerik:RadButton ID="rbLoadPdf" runat="server" Text="Load">
                </telerik:RadButton>
              
                <hr />
                <telerik:RadCheckBox ID="rcbSelected" runat="server" Text="Show All" CssClass="auto-style1"></telerik:RadCheckBox>
              
                <br />
                <telerik:RadGrid ID="rgvDefinitions" runat="server" AllowAutomaticUpdates="True" DataSourceID="odsDefinitions" AutoGenerateColumns="False" AllowSorting="True">
                    <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                    <MasterTableView CommandItemDisplay="Top" DataKeyNames="Id" DataSourceID="odsDefinitions" EditMode="Batch" AllowSorting="False">
                        <BatchEditingSettings EditType="Cell"  OpenEditingEvent="Click"/>
                        <CommandItemSettings ShowAddNewRecordButton="False" ShowCancelChangesButton="True" ShowSaveChangesButton="True" />
                        <Columns>
                            <telerik:GridBoundColumn DataField="Id" DataType="System.Int32" FilterControlAltText="Filter Id column" HeaderText="Id" ReadOnly="True" SortExpression="Id" UniqueName="Id" Visible="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="FormName" FilterControlAltText="Filter FormName column" HeaderText="FormName" SortExpression="FormName" UniqueName="FormName" Visible="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="DataGroup" FilterControlAltText="Filter DataGroup column" HeaderText="DataGroup" SortExpression="DataGroup" UniqueName="DataGroup">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="DataField" FilterControlAltText="Filter DataField column" HeaderText="DataField" SortExpression="DataField" UniqueName="DataField" Visible="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="DataFieldType" FilterControlAltText="Filter DataFieldType column" HeaderText="DataFieldType" SortExpression="DataFieldType" UniqueName="DataFieldType" Visible="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="FormField" FilterControlAltText="Filter FormField column" HeaderText="FormField" ReadOnly="True" SortExpression="FormField" UniqueName="FormField">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="FormFieldType" FilterControlAltText="Filter FormFieldType column" HeaderText="FormFieldType" SortExpression="FormFieldType" UniqueName="FormFieldType" Visible="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="FormFieldTestData" FilterControlAltText="Filter FormFieldTestData column" HeaderText="FormFieldTestData" SortExpression="FormFieldTestData" UniqueName="FormFieldTestData">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="SourceForm" FilterControlAltText="Filter SourceForm column" HeaderText="SourceForm" SortExpression="SourceForm" UniqueName="SourceForm" Visible="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Selected" DataType="System.Byte" FilterControlAltText="Filter Selected column" HeaderText="Selected" SortExpression="Selected" UniqueName="Selected" Visible="False">
                            </telerik:GridBoundColumn>
                            <telerik:GridTemplateColumn FilterControlAltText="Filter cbSelected column" HeaderText="Show" UniqueName="cbSelected">
                                <ItemTemplate>
                                    <asp:CheckBox ID="cbShow" runat="server" Checked='<%# Bind("Selected") %>' AutoPostBack="True" OnCheckedChanged="cbShow_CheckedChanged" />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
                <asp:ObjectDataSource ID="odsDefinitions" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDefinitions" TypeName="SmartForms.CanadaDataTableAdapters.FormDefinitionTA" UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="FormName" Type="String" />
                        <asp:Parameter Name="DataGroup" Type="String" />
                        <asp:Parameter Name="DataField" Type="String" />
                        <asp:Parameter Name="DataFieldType" Type="String" />
                        <asp:Parameter Name="FormField" Type="String" />
                        <asp:Parameter Name="FormFieldType" Type="String" />
                        <asp:Parameter Name="FormFieldTestData" Type="String" />
                        <asp:Parameter Name="SourceForm" Type="String" />
                        <asp:Parameter Name="Selected" Type="Byte" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="rcbForm" Name="formname" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="hfSelected" DefaultValue="0" Name="selected" PropertyName="Value" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="FormName" Type="String" />
                        <asp:Parameter Name="DataGroup" Type="String" />
                        <asp:Parameter Name="DataField" Type="String" />
                        <asp:Parameter Name="DataFieldType" Type="String" />
                        <asp:Parameter Name="FormField" Type="String" />
                        <asp:Parameter Name="FormFieldType" Type="String" />
                        <asp:Parameter Name="FormFieldTestData" Type="String" />
                        <asp:Parameter Name="SourceForm" Type="String" />
                        <asp:Parameter Name="Selected" Type="Byte" />
                        <asp:Parameter Name="Original_Id" Type="Int32" />
                    </UpdateParameters>
                </asp:ObjectDataSource>
                <%--<asp:SqlDataSource ID="sqlData" runat="server" ConnectionString="<%$ ConnectionStrings:SmartForms.My.MySettings.canadaData %>" 
                    DeleteCommand="DELETE FROM [fintrac_FormDefinition] WHERE [Id] = @Id" 
                    InsertCommand="INSERT INTO [fintrac_FormDefinition] ([FormName], [DataGroup], [DataField], [DataFieldType], [FormField], [FormFieldType], [FormFieldTestData], [SourceForm], [Selected]) VALUES (@FormName, @DataGroup, @DataField, @DataFieldType, @FormField, @FormFieldType, @FormFieldTestData, @SourceForm, @Selected)" 
                    SelectCommand="SELECT * FROM [fintrac_FormDefinition] WHERE ([FormName] = @FormName)" 
                    UpdateCommand="UPDATE [fintrac_FormDefinition] SET [FormName] = @FormName, [DataGroup] = @DataGroup, [DataField] = @DataField, [DataFieldType] = @DataFieldType, [FormField] = @FormField, [FormFieldType] = @FormFieldType, [FormFieldTestData] = @FormFieldTestData, [SourceForm] = @SourceForm, [Selected] = @Selected WHERE [Id] = @Id" ProviderName="<%$ ConnectionStrings:SmartForms.My.MySettings.canadaData.ProviderName %>">
                    
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="FormName" Type="String" />
                        <asp:Parameter Name="DataGroup" Type="String" />
                        <asp:Parameter Name="DataField" Type="String" />
                        <asp:Parameter Name="DataFieldType" Type="String" />
                        <asp:Parameter Name="FormField" Type="String" />
                        <asp:Parameter Name="FormFieldType" Type="String" />
                        <asp:Parameter Name="FormFieldTestData" Type="String" />
                        <asp:Parameter Name="SourceForm" Type="String" />
                        <asp:Parameter Name="Selected" Type="Byte" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="rcbForm" Name="FormName" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="FormName" Type="String" />
                        <asp:Parameter Name="DataGroup" Type="String" />
                        <asp:Parameter Name="DataField" Type="String" />
                        <asp:Parameter Name="DataFieldType" Type="String" />
                        <asp:Parameter Name="FormField" Type="String" />
                        <asp:Parameter Name="FormFieldType" Type="String" />
                        <asp:Parameter Name="FormFieldTestData" Type="String" />
                        <asp:Parameter Name="SourceForm" Type="String" />
                        <asp:Parameter Name="Selected" Type="Byte" />
                        <asp:Parameter Name="Id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>--%>


                <br />
            </div>
            <div class="w3-twothird w3-container">
                <telerik:RadPdfViewer ID="RadPdfViewer1" runat="server" Height="1000px" Width="100%" RenderMode="Lightweight">
                </telerik:RadPdfViewer>
                <%--<asp:Panel ID="Panel1" runat="server"></asp:Panel>--%>
            </div>
        </div>
    </div>

    <asp:HiddenField ID="hfSelected" runat="server" />

    
    <br />
    
    
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style1 {
            left: 0px;
            top: 0px;
        }
    </style>
</asp:Content>

