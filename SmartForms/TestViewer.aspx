<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="TestViewer.aspx.vb" Inherits="SmartForms.TestViewer" %>

<%@ Register Assembly="PdfViewer" Namespace="PdfViewer" TagPrefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <cc1:ShowPdf ID="ShowPdf1" runat="server" FilePath="Forms/FINTRAC/885326974.pdf" Height="1000px" Width="800px"  />
        </div>
    </form>
</body>
</html>
