<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="pdfViewer.aspx.vb" Inherits="SmartForms.pdfViewer2" %>

<%@ Register Assembly="PdfViewer" Namespace="PdfViewer" TagPrefix="cc1" %>

<%@ Import Namespace="SmartForms" %>
<%@ Import Namespace="Microsoft.AspNet.Identity" %>
<%@ Register Src="~/ClientSizeDetector.ascx" TagPrefix="uc1" TagName="ClientSizeDetector" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title></title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
</head>

<body>
    <uc1:ClientSizeDetector runat="server" ID="ClientSizeDetector" />
    <form id="form1" runat="server">
        <div>
          
        </div>
    </form>
</body>
</html>
