Imports Telerik.Web.UI

Public Class MobileIdentify
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub


    Protected Sub lbNext_Click(sender As Object, e As EventArgs) Handles lbNext.Click
        panel_Page1.Visible = False
        panel_Page2.Visible = True

    End Sub
End Class