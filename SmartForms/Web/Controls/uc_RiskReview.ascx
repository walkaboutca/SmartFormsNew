<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="uc_RiskReview.ascx.vb" Inherits="SmartForms.uc_RiskReview" %>
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
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.2.2/pdf.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.2.2/pdf.worker.js"></script>
<script>
    window.pdfjsLib.GlobalWorkerOptions.workerSrc = 'https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.2.2/pdf.worker.js';
</script>

<asp:HiddenField ID="hfFormHash" runat="server" />
<asp:HiddenField ID="hfFormId" runat="server" />

<div class="w3-bottombar w3-border-grey w3-light-grey">
    <div class="w3-container">
        <div class="w3-row">
            <div class="w3-col s8">
                <div class="w3-padding-small">
                </div>
            </div>
            <div class="w3-col s4">
                <div class="w3-padding-small w3-right" style="font-size: small;">
                </div>
            </div>
        </div>
        <div class="w3-row">
            <div class="w3-col s8">
                <div class="w3-padding-small  w3-right">
                </div>
            </div>
            <div class="w3-col s4">
                <div class="w3-padding-small w3-right" style="font-size: small;">
                </div>
            </div>
        </div>
    </div>
</div>
<div class="w3-container">
    <p><strong>Individual Identification Information Record</strong></p>
    <p>Transaction Property Address:</p>
</div>
<div class="w3-container">
    <div class="w3-row">
        <div class="w3-col s3">
            <div class="w3-padding-small">
               
            </div>
        </div>
        <div class="w3-col s6">
            <div class="w3-padding-small">
               
            </div>
        </div>
        <div class="w3-col s3">
            <div class="w3-padding-small">
               
            </div>
        </div>
    </div>
</div>
