Imports Microsoft.AspNet.Identity

Public Class _Default
    Inherits Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

        If User.Identity.IsAuthenticated Then

            Response.Redirect("~/Web/FintracDashboard.aspx", True)


        End If


    End Sub
End Class