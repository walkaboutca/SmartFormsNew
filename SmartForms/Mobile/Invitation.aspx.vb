Public Class Invitation
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            hfReference.Value = Request.QueryString("ref")

        Else

        End If
    End Sub

End Class