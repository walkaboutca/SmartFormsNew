<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="uc_ComplianceNotes.ascx.vb" Inherits="SmartForms.uc_ComplianceNotes" %>
<style type="text/css">
    .reLeftVerticalSide,
    .reRightVerticalSide,
    .reToolZone,
    .reToolCell {
        background: white !important;
    }

    .reToolCell {
        display: none\9 !important; /* for all versions of IE in order to prevent border bottom disappearing */
    }

    .reContentCell {
        border-width: 0 !important;
    }

    .formInput {
        border: solid 1px black;
    }

    .RadEditor {
        filter: grayscale();
    }

    .reWrapper_corner,
    .reWrapper_center {
        display: none !important; /* for FF */
    }

    td.reWrapper_corner,
    td.reWrapper_center {
        display: block\9 !important; /* for all versions of IE */
    }
</style>
<asp:HiddenField ID="hfWhatForm" runat="server" />
<asp:HiddenField ID="hfWhatControl" runat="server" />
<asp:HiddenField ID="hfNoteHeight" runat="server" />

<div style="font-size: small">
 
    <telerik:RadEditor ID="reEditor" runat="server"
        RenderMode="Lightweight"
        ToolbarMode="ShowOnFocus"
        ToolsFile="~/Classes/BasicTools.xml"
        Width="100%">
    </telerik:RadEditor>
    <asp:LinkButton ID="lbEditor" runat="server" Visible="False" Font-Size="Small">Save</asp:LinkButton>


</div>
