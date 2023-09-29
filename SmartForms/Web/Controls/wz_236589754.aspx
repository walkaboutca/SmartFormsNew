<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="wz_236589754.aspx.vb" Inherits="SmartForms.wz_236589754" %>

<%@ Register Src="~/Web/Controls/uc_ComplianceNotes.ascx" TagPrefix="uc1" TagName="uc_ComplianceNotes" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
</head>

<body>
    <form id="form1" runat="server">
    <telerik:RadScriptManager ID="RadScriptManager1" Runat="server"></telerik:RadScriptManager>
    <div class="w3-sidebar w3-bar-block w3-collapse w3-card w3-animate-right" style="width: 325px; right: 0;" id="mySidebar">
        <button class="w3-bar-item w3-button w3-large w3-hide-large" onclick="w3_close()">Close &times;</button>
        <h5 class="w3-bar-item w3-black">NOTES / RULES</h5>

        <uc1:uc_ComplianceNotes runat="server" ID="uc_ComplianceNotes" />

    </div>

    <div class="w3-main" style="margin-right: 200px">
        <div class="w3-teal">
            <button class="w3-button w3-teal w3-xlarge w3-right w3-hide-large" onclick="w3_open()">&#9776;
            </button>
            <div class="w3-container">
                <h1>My Page</h1>
            </div>
        </div>

        <div class="w3-container">
            <p>In this example, the side navigation will always be displayed on desktop computers and laptops (screens wider than 992px), and hidden on tablets and mobile phones (screens that are less than 992px wide).</p>
            <p>On tablets and mobile phones the side navigation is replaced with a menu icon that opens the navigation pane when clicked on: it will then overlay/sit on top of the page content.</p>
            <p><b>Resize the browser window to understand how it works.</b></p>
        </div>

    </div>

    <script>
        function w3_open() {
            document.getElementById("mySidebar").style.display = "block";
        }

        function w3_close() {
            document.getElementById("mySidebar").style.display = "none";
        }
    </script>
    </form>
</body>
</html>
