<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="SearchEngine.aspx.vb" Inherits="SmartForms.SearchEngine" %>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
    html, body, h1, h2, h3, h4, h5, h6 {
        font-family: "Roboto", sans-serif
    }

    p {
        font-size: small;
    }

    html .RadSearchBox .rsbInput {
        height: 20px;
    }

    .table-style {
        width: 100%;
        font-size: small;
        vertical-align: top;
    }

    .td-style {
        vertical-align: top;
    }
</style>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>AI Engine Alert</title>
</head>
   



<body>
    <form id="form1" runat="server">

        <asp:HiddenField ID="hfFormid" runat="server" />

        <div class="w3-container w3-twothird w3-padding">
            <p>This is where the magic happens!</p>
            <p>When you submit the record the system will automatically go out and use AI to search the public domain for 'risk factors'.</p>
            <p>Depending on those factors a 'Low', 'Medium' or 'High' risk will be assigned.</p>
            <p>High (and MB choice Medium) risks would go to the MB office. If required by the MB a 'Suspicious Transaction' report can be completed and submitted autoatically.</p>
            <hr />
            For now, to see how this will look ... pick one:
                    <asp:RadioButtonList ID="rbRisk" runat="server" CellPadding="2" CellSpacing="2" AutoPostBack="True">
                        <asp:ListItem Value="Green">Low</asp:ListItem>
                        <asp:ListItem Value="Yellow">Medium</asp:ListItem>
                        <asp:ListItem Value="Red">High</asp:ListItem>
                    </asp:RadioButtonList>
        </div>
        <div class="w3-container w3-third w3-padding-small" style="vertical-align: middle; text-align: center">
            <p><i class="fa fa-spinner w3-spin" style="font-size: 64px"></i></p>
        </div>

        <div>
        </div>
    </form>
</body>
</html>
