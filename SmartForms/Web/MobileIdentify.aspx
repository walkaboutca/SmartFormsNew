<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="MobileIdentify.aspx.vb" Inherits="SmartForms.MobileIdentify" %>

<!DOCTYPE html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Smart Mobile</title>

</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            <Scripts>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js"></asp:ScriptReference>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js"></asp:ScriptReference>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js"></asp:ScriptReference>
            </Scripts>
        </telerik:RadScriptManager>
        <div class="w3-container">
            <h2>Smart Mobile</h2>
            <p><strong>DEMO</strong> If you choose to text or email either yourself or you client a Mobile Identity Link it will look something like this ....</p>

            <p>Invidual IIF</p>
            <div class="w3-row">
                <div class="w3-container w3-half w3-padding-small">
                    <p>Client Name:</p>
                </div>
                <div class="w3-container w3-half w3-padding-small">
                </div>
            </div>
            <div class="w3-row">
                <div class="w3-container w3-half w3-padding-small">
                    <p>Client Phone:</p>
                </div>
                <div class="w3-container w3-half w3-padding-small">
                </div>
            </div>
            <div class="w3-row">
                <div class="w3-container w3-half w3-padding-small">
                    <p>Client Email:</p>
                </div>
                <div class="w3-container w3-half w3-padding-small">
                </div>
            </div>
            <div class="w3-row">
                <div class="w3-container w3-half w3-padding-small">
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" Font-Size="Small">
                        <asp:ListItem Value="toMe">To Me</asp:ListItem>
                        <asp:ListItem Value="toClient">To Client</asp:ListItem>
                    </asp:RadioButtonList>
                </div>
                <div class="w3-container w3-half w3-padding-small">
                    <telerik:RadCheckBoxList ID="RadCheckBoxList1" runat="server" Font-Size="Small">
                        <Items>
                            <telerik:ButtonListItem Text="By SMS / Text" Value="byText" />
                            <telerik:ButtonListItem Text="By E Mail" Value="byEmail" />
                        </Items>
                    </telerik:RadCheckBoxList>
                </div>
            </div>
             <div class="w3-row">
                <div class="w3-container w3-half w3-padding-small">
                    <telerik:RadButton ID="rbSend" runat="server" Text="Send"></telerik:RadButton>
                </div>
                <div class="w3-container w3-half w3-padding-small">
                  
                </div>
            </div>

        </div>


        <telerik:RadWindowManager ID="window_mobile" runat="server"
            KeepInScreenBounds="True"
            RenderMode="Lightweight"
            DestroyOnClose="True">
            <Windows>
                <telerik:RadWindow ID="window_iphone" runat="server"
                    Modal="True"
                    RenderMode="Lightweight"
                    Overlay="False"
                    VisibleStatusbar="False"
                    ShowContentDuringLoad="False">
                </telerik:RadWindow>
            </Windows>
        </telerik:RadWindowManager>


    </form>


</body>
</html>
