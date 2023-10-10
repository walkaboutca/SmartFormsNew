Imports Microsoft.AspNet.Identity
Imports Telerik.Web.UI

Public Class Admin
    Inherits System.Web.UI.MasterPage
    Dim sql As New SQLdata

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        hfUserName.Value = Context.User.Identity.Name
        If Page.IsPostBack Then

        Else
            Dim ds As New smartSecurityTableAdapters.GlobalVarsTA
            Dim userrole As String = ds.ret_User_GetRoleFromUserName(Context.User.Identity.Name)

            If String.IsNullOrEmpty(userrole) Then
                Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie)
                Response.Redirect("~/Account/TroublePage.aspx", True)
            Else
                Select Case userrole
                    Case "GA"
                        panel_admin.Visible = True
                    Case "AGT"
                        If rcbUserName.Items.Count > 1 Then
                            panel_admin.Visible = True
                        Else
                            panel_admin.Visible = False
                        End If
                    Case "MGR"
                        If rcbUserName.Items.Count > 1 Then
                            panel_admin.Visible = True
                        Else
                            panel_admin.Visible = False
                        End If
                    Case Else
                        Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie)
                        Response.Redirect("~/Account/TroublePage.aspx", True)
                End Select
            End If
        End If

    End Sub
    Private Sub forms_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Page.IsPostBack Then

        Else

        End If
    End Sub
    Protected Sub Unnamed_LoggingOut(sender As Object, e As LoginCancelEventArgs)
        Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie)
    End Sub

    Private Sub rcbUserName_Load(sender As Object, e As EventArgs) Handles rcbUserName.Load

    End Sub

    Private Sub rddCompany_DataBound(sender As Object, e As EventArgs) Handles rddCompany.DataBound
        If Not Page.IsPostBack Then
            Dim dsvars As New smartDataTableAdapters.LocalTA
            Dim defCompany As String = dsvars.ret_LastSelectedCompany(hfUserName.Value)
            rddCompany.SelectedText = defCompany
            rddCompany.Items(rddCompany.FindItemByText(defCompany).Index).Selected = True
            hfCompanyId.Value = rddCompany.SelectedValue

            rcbUserName.DataBind()

        End If
    End Sub

    Private Sub rddCompany_SelectedIndexChanged(sender As Object, e As DropDownListEventArgs) Handles rddCompany.SelectedIndexChanged
        Dim localvars As New smartDataTableAdapters.LocalTA
        localvars.upd_LastSelectedCompany(rddCompany.SelectedText, hfUserName.Value)

    End Sub
End Class