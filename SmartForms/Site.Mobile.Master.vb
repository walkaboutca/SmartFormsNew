Public Class Site_Mobile
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Page.IsPostBack Then

        Else
            Response.Redirect("~/Mobile/FakePhone.aspx", True)

        End If

    End Sub

End Class