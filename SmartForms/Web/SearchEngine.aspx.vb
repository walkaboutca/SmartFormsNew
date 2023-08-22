Public Class SearchEngine
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            hfFormid.Value = Request.QueryString("formid")
        Else

        End If
    End Sub

    Protected Sub rbRisk_SelectedIndexChanged(sender As Object, e As EventArgs) Handles rbRisk.SelectedIndexChanged

        Dim ds As New smartDataTableAdapters.LocalTA
        ds.upd_RiskValue(rbRisk.SelectedValue, hfFormid.Value)


    End Sub
End Class