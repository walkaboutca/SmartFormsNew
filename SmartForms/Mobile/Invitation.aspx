<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Invitation.aspx.vb" Inherits="SmartForms.Invitation" %>

<!DOCTYPE html>


<html lang="en">
<head>
    <title>W3.CSS Template</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        html, body, h1, h2, h3, h4, h5, h6 {
            font-family: "Roboto", sans-serif;
        }

        .w3-sidebar {
            z-index: 3;
            width: 250px;
            top: 43px;
            bottom: 0;
            height: inherit;
        }
        .logo-style {
            max-width: 100%;
            height: 40px;
            width: 150px;
        }
    </style>
</head>
<body>

    <form id="form1" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            <Scripts>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js">
                </asp:ScriptReference>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js">
                </asp:ScriptReference>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js">
                </asp:ScriptReference>
            </Scripts>
        </telerik:RadScriptManager>

    <!-- Navbar -->
    <div class="w3-top">
        <div class="w3-bar w3-theme w3-top w3-left-align w3-large">
            <a class="w3-bar-item w3-button w3-right w3-hide-large w3-hover-white w3-large w3-theme-l1" href="javascript:void(0)" onclick="w3_open()"><i class="fa fa-bars"></i></a>
            <a href="#" class="w3-bar-item w3-button w3-theme-l1">Smart Tools</a>
            <a href="#" class="w3-bar-item w3-button w3-hide-small w3-hover-white">About</a>
            <a href="#" class="w3-bar-item w3-button w3-hide-small w3-hover-white">Values</a>
            <a href="#" class="w3-bar-item w3-button w3-hide-small w3-hover-white">News</a>
            <a href="#" class="w3-bar-item w3-button w3-hide-small w3-hover-white">Contact</a>
            <a href="#" class="w3-bar-item w3-button w3-hide-small w3-hide-medium w3-hover-white">Clients</a>
            <a href="#" class="w3-bar-item w3-button w3-hide-small w3-hide-medium w3-hover-white">Partners</a>
        </div>
    </div>

    <!-- Sidebar -->
    <nav class="w3-sidebar w3-bar-block w3-collapse w3-large w3-theme-l5 w3-animate-left" id="mySidebar">
        <a href="javascript:void(0)" onclick="w3_close()" class="w3-right w3-xlarge w3-padding-large w3-hover-black w3-hide-large" title="Close Menu">
            <i class="fa fa-remove"></i>
        </a>
        <h4 class="w3-bar-item"><b>Menu</b></h4>
        <a class="w3-bar-item w3-button w3-hover-black" href="#">Link</a>
        <a class="w3-bar-item w3-button w3-hover-black" href="#">Link</a>
        <a class="w3-bar-item w3-button w3-hover-black" href="#">Link</a>
        <a class="w3-bar-item w3-button w3-hover-black" href="#">Link</a>
    </nav>

    <!-- Overlay effect when opening sidebar on small screens -->
    <div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor: pointer" title="close side menu" id="myOverlay"></div>

    <!-- Main content: shift it to the right by 250 pixels when the sidebar is visible -->
    <div class="w3-main" style="margin-left: 250px">

        <div class="w3-row w3-padding-64">
            <div class="w3-twothird w3-container">
                <img src="../Images/SmartForms_Fintrac Banner.png" alt="Lights" class="logo-style">
                <p>This form has limited function!</p>
                <p>When properly done it will allow the entry of data AND pictures of Id, include facial recognition and DL QR code scanning etc. ... but it's a whole project on it's own.</p>
                <p>For now fill in a few details to see how it flows back to the Fontrac Form.</p>
            </div>
            <div class="w3-row">
                <div class="w3-third w3-container w3-padding-small">
                    Name:
                </div>
                <div class="w3-twothird w3-container w3-padding-small">
                    <telerik:RadTextBox ID="rtbName" runat="server" RenderMode="Lightweight" Width="90%"></telerik:RadTextBox>
                </div>
            </div>
            <div class="w3-row">
                <div class="w3-third w3-container w3-padding-small">
                    File Name:
                </div>
                <div class="w3-twothird w3-container w3-padding-small">
                    <telerik:RadTextBox ID="rtbKit" runat="server" RenderMode="Lightweight" Width="90%"></telerik:RadTextBox>
                </div>
            </div>
            <div class="w3-row">
                <div class="w3-third w3-container w3-padding-small">
                </div>
                <div class="w3-twothird w3-container w3-padding-small">
                    <telerik:RadComboBox ID="rcbIdType" runat="server" EmptyMessage="Identification Type" RenderMode="Lightweight" Width="90%">
                        <Items>
                            <telerik:RadComboBoxItem runat="server" Text="DL Number" Value="DLNumber" />
                            <telerik:RadComboBoxItem runat="server" Text="Passport Number" Value="PassportNumber" />
                            <telerik:RadComboBoxItem runat="server" Text="Other" Value="Other" />
                        </Items>
                    </telerik:RadComboBox>

                </div>
            </div>
        </div>
        
        <!-- END MAIN -->
    </div>
    <asp:HiddenField ID="hfReference" runat="server" />


    <script>
        // Get the Sidebar
        var mySidebar = document.getElementById("mySidebar");

        // Get the DIV with overlay effect
        var overlayBg = document.getElementById("myOverlay");

        // Toggle between showing and hiding the sidebar, and add overlay effect
        function w3_open() {
            if (mySidebar.style.display === 'block') {
                mySidebar.style.display = 'none';
                overlayBg.style.display = "none";
            } else {
                mySidebar.style.display = 'block';
                overlayBg.style.display = "block";
            }
        }

        // Close the sidebar with the close button
        function w3_close() {
            mySidebar.style.display = "none";
            overlayBg.style.display = "none";
        }
    </script>

    </form>

</body>
</html>
