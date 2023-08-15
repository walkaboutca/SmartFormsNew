<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="ClientSizeDetector.ascx.vb" Inherits="SmartForms.ClientSizeDetector" %>
<%If (IsFirstTime) Then%>
<script type="text/javascript">
    var pageURL = window.location.href.search(/\?/) > 0 ? "&" : "?";
    window.location.href = window.location.href + pageURL + "clientHeight=" + window.innerHeight + "&clientWidth=" + window.innerWidth;
</script>
<%End If%>
