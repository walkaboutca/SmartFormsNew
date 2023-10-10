Public Class Settings_Global
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            hfUserName.Value = User.Identity.Name

            hfCompanyId.Value = CType(Master.FindControl("hfCompanyId"), HiddenField).Value


            Dim ds As New smartDataTableAdapters.LocalTA
            hfAppName.Value = ds.ret_RegisterGlobal("globalAdmin", "globalApplication")
        End If



    End Sub

    Private Sub Settings_Global_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender

        rgvCompanyList.MasterTableView.Font.Size = FontUnit.Small
        rgvUserList.MasterTableView.Font.Size = FontUnit.Small

    End Sub
End Class