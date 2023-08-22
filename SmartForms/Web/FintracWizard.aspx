<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Web/forms.Master" CodeBehind="FintracWizard.aspx.vb" Inherits="SmartForms.FintracWizard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

 

    <telerik:RadWizard ID="rwFintrac" runat="server" DisplayCancelButton="True" Skin="Material">
        <WizardSteps>
            <telerik:RadWizardStep ID="stepTitle" runat="server" Title="Title">
                <div class="w3-half w3-container w3-padding">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/2023-08-16_6-29-12.png" Width="90%" />
                </div>
                <div class="w3-half w3-container w3-padding-small">
                    <telerik:RadLabel ID="rlErrorMsg" runat="server" ForeColor="#CC0000" RenderMode="Lightweight" Visible="False"></telerik:RadLabel>
                    <p style="font-weight: bold">TITLE</p>
                    <p>All titles look a little different. The 'Registered Owners' section describes the Legal Owner(s) Names and must be precisely recorded to start!</p>
                    <telerik:RadGrid RenderMode="Lightweight" ID="rgvOwners" runat="server" 
                        AllowAutomaticDeletes="True"
                        AllowAutomaticInserts="True" 
                        PageSize="3" 
                        AutoGenerateColumns="False" 
                        Skin="Telerik" 
                       >
                        <MasterTableView CommandItemDisplay="Bottom" 
                            HorizontalAlign="NotSet" 
                            EditMode="Batch" 
                            AutoGenerateColumns="False">
                            <BatchEditingSettings EditType="Cell" 
                                HighlightDeletedRows="False" />
                            <Columns>
                                <telerik:GridBoundColumn DataField="OwnerName"  HeaderText="OwnerName" SortExpression="OwnerName"
                                    UniqueName="OwnerName">
                                    <HeaderStyle Width="90%" />
                                    <ItemStyle Width="90%" />
                                </telerik:GridBoundColumn>
                                <telerik:GridButtonColumn ConfirmText="Delete this Name?" ConfirmDialogType="RadWindow"
                                    ConfirmTitle="Delete" HeaderText="Delete" HeaderStyle-Width="50px"
                                    CommandName="Delete" Text="Delete" UniqueName="DeleteColumn">
                                    <HeaderStyle Width="50px" />
                                </telerik:GridButtonColumn>
                            </Columns>
                             <CommandItemSettings ShowSaveChangesButton="false" CancelChangesText="Clear" ShowRefreshButton="False"/>
                        </MasterTableView>
                       
                        <groupingsettings collapsealltooltip="Collapse all groups" />
                        <ClientSettings AllowKeyboardNavigation="true"></ClientSettings>
                        <filtermenu rendermode="Lightweight">
                        </filtermenu>
                        <headercontextmenu rendermode="Lightweight">
                        </headercontextmenu>
                    </telerik:RadGrid>
                    <P></P>
                    <div class="w3-card">
                        <telerik:RadRadioButtonList ID="rblFormType" runat="server" AutoPostBack="False" DataSourceID="sqlFormTypes" Layout="OrderedList" Columns="1">

                            <DataBindings DataTextField="DisplayName" DataValueField="HashCode" />

                        </telerik:RadRadioButtonList>
                        
                    </div>
                </div>
            </telerik:RadWizardStep>
            <telerik:RadWizardStep ID="stepWebForm" runat="server" Title="Web Form">
                <div class="w3-twothird w3-container w3-padding-small">
                   <%-- <telerik:RadGrid ID="rgvSmartData" runat="server"></telerik:RadGrid>--%>


                </div>
                <div class="w3-third w3-container w3-padding-small">
                    If you have a WebForm(c) Fillable PDF Fintrac DROP it here and we will try and load the details!
                         <telerik:RadAsyncUpload ID="async_Fintrac" runat="server" Font-Size="X-Small" HideFileInput="True" RenderMode="Lightweight" UploadedFilesRendering="BelowFileInput"
                             Localization-Select="Drop FINTRAC Here">
                         </telerik:RadAsyncUpload>

                    <asp:Button ID="Button1" runat="server" Text="Button" />

                </div>
            </telerik:RadWizardStep>
            <telerik:RadWizardStep ID="RadWizardStep3" runat="server">
            </telerik:RadWizardStep>
        </WizardSteps>
    </telerik:RadWizard>
   
    <telerik:RadWindow ID="windowViewer" runat="server" 
        NavigateUrl="~/Web/pdfFintracViewer.aspx" DestroyOnClose="True" KeepInScreenBounds="True" Modal="True" RenderMode="Lightweight"></telerik:RadWindow>


    <asp:SqlDataSource ID="sqlFormTypes" runat="server" ConnectionString="<%$ ConnectionStrings:smartData %>" SelectCommand="SELECT DISTINCT [HashCode], [DisplayName] FROM [dbo].[forms_Catalog] ORDER BY [DisplayName]"></asp:SqlDataSource>

</asp:Content>
