Imports Telerik.Web.UI

Public Class MobileIdentify
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub rbSend_Click(sender As Object, e As EventArgs) Handles rbSend.Click
        window_iphone.AutoSize = False
        window_iphone.Behaviors = WindowBehaviors.Move Or WindowBehaviors.Resize Or WindowBehaviors.Close
        window_iphone.Height = 667
        window_iphone.Width = 365
        window_iphone.VisibleStatusbar = False
        Dim urlargs As String = Nothing
        window_iphone.NavigateUrl = "~/Web/FakePhone.aspx" & urlargs

        Dim script As String = "function f(){$find(""" + window_iphone.ClientID + """).show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);"
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "key", script, True)
    End Sub
End Class