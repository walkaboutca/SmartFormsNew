Public Class About_Fintrac
    Inherits System.Web.UI.Page
    Dim wheight As Integer
    Dim wwidth As Integer

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsNothing(Request.QueryString("clientHeight")) Then
            wheight = ((Request.QueryString("clientHeight") * 0.7))
            wwidth = ((Request.QueryString("clientWidth") * 0.6))

            panel_left.Height = Request.QueryString("clientHeight") * 0.5
            panel_middle.Height = Request.QueryString("clientHeight") * 0.5
            panel_right.Height = Request.QueryString("clientHeight") * 0.5

        End If

    End Sub
End Class