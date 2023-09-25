<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="MobileIdentify.aspx.vb" Inherits="SmartForms.MobileIdentify" %>

<!DOCTYPE html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Smart Mobile</title>

</head>
<body>
    <div class="w3-display-middle">
        <form id="form1" runat="server" style="width: 300px">
            <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
                <Scripts>
                    <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js"></asp:ScriptReference>
                    <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js"></asp:ScriptReference>
                    <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js"></asp:ScriptReference>
                </Scripts>
            </telerik:RadScriptManager>
            <asp:Panel ID="panel_Page1" runat="server">
                <p style="font-size: small">
                    <strong>DEMO</strong>If you choose to text or email either yourself or you client a Mobile Identity Link it will look something like this ....
            <asp:LinkButton ID="lbNext" runat="server">Next</asp:LinkButton>
                </p>
                <div class="w3-row w3-round-large w3-topbar w3-bottombar w3-leftbar w3-rightbar w3-border-grey w3-light-grey">

                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/iPhoneTextMessage.png" Width="100%" />

                </div>

            </asp:Panel>

            <asp:Panel ID="panel_Page2" runat="server" Visible="False">
                <div class="w3-row w3-round-large w3-topbar w3-bottombar w3-leftbar w3-rightbar w3-border-grey w3-light-grey" style="height: 620px">
                    <div class="w3-container">
                        <h3>Smart Mobile</h3>
                        <p style="font-size: small">Invidual IIF</p>
                        <p style="font-size: small">The mobile application is a project in itself.</p>
                        <p style="font-size: small">It will guide either the agent or the client through the collection of data, photo's of IDs 
                            and any data required from the risk assement done in the application.</p>
                        <div class="w3-row">
                            <div class="w3-container w3-threequarter w3-padding-small">
                                <p style="font-size: small">BC ID e.g. DL Front and Back</p>
                            </div>
                            <div class="w3-container w3-quarter w3-padding-small">
                                <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/iPhoneCamera.png" Height="40px" Width="20px" />
                            </div>
                        </div>
                         <div class="w3-row">
                            <div class="w3-container w3-threequarter w3-padding-small">
                                <p style="font-size: small">Selfie</p>
                            </div>
                            <div class="w3-container w3-quarter w3-padding-small">
                                <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/iPhoneCamera.png" Height="40px" Width="20px" />
                            </div>
                        </div>
                        <div class="w3-bottombar">
                            <div class="w3-container w3-padding-small w3-padding-small">
                                <telerik:RadButton ID="rbSend" runat="server" Text="Send" RenderMode="Lightweight" Skin="Black" Width="100%"></telerik:RadButton>
                            </div>
                        </div>
                    </div>

                </div>

            </asp:Panel>

        </form>
    </div>

</body>
</html>
