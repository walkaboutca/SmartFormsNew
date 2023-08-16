Public Class FintracWizard
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsNothing(Request.QueryString("clientHeight")) Then rwFintrac.Height = (Request.QueryString("clientHeight") - 150)



    End Sub

    Protected Sub rgvOwners_NeedDataSource(sender As Object, e As Telerik.Web.UI.GridNeedDataSourceEventArgs) Handles rgvOwners.NeedDataSource
        Dim dt As New DataTable
        dt.Columns.Add("OwnerName", GetType(String))
        dt.Rows.Add("")
        rgvOwners.DataSource = dt



    End Sub

    Private Sub rgvOwners_PreRender(sender As Object, e As EventArgs) Handles rgvOwners.PreRender
        rgvOwners.MasterTableView.Font.Size = FontUnit.Small
    End Sub
End Class