Public Class uc_IIF_StepVerification
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        RadSplitter1.Height = Unit.Pixel((Session("globalClientHeight") * 0.65))
        'RadSplitter1.Width = Unit.Pixel((Session("globalClientwidth") * 0.5))


    End Sub

End Class