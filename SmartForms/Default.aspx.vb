Imports Microsoft.AspNet.Identity

Public Class _Default
    Inherits Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

        If User.Identity.IsAuthenticated And Not Request.QueryString("showhome") = "yes" Then
            If Page.IsPostBack Then

            Else
                Dim ds As New dsSecureTableAdapters.GlobalVarsTA
                Dim userrole As String = ds.ret_User_GetRoleFromUserName(Context.User.Identity.Name)

                If String.IsNullOrEmpty(userrole) Then
                    Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie)
                    Response.Redirect("~/Account/TroublePage.aspx", True)
                Else
                    Select Case userrole
                        Case "GA"
                            Response.Redirect("~/Web/FintracDashboard.aspx", True)
                        Case "LWA"
                            Response.Redirect("~/Web/FintracDashboard.aspx", True)
                        Case "LWU"
                            Response.Redirect("~/Web/FintracDashboard.aspx", True)
                        Case "LWD"
                            Response.Redirect("~/Web/FintracDashboard.aspx", True)
                    End Select
                End If
            End If

        Else
            Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie)
        End If

    End Sub
End Class