Public Class ClientSizeDetector
    Inherits System.Web.UI.UserControl

    Private _isFirstTime As Boolean = False
    Private _clientWidth As Integer = 0
    Private _clientHeight As Integer = 0
    Public Property ClientWidth() As Integer
        Get
            Return _clientWidth
        End Get
        Set(value As Integer)
            _clientWidth = value
        End Set
    End Property

    Public Property ClientHeight() As Integer
        Get
            Return _clientHeight
        End Get
        Set(value As Integer)
            _clientHeight = value
        End Set
    End Property

    Public Property IsFirstTime() As Boolean
        Get
            Return _isFirstTime
        End Get
        Set(value As Boolean)
            _isFirstTime = value
        End Set
    End Property
    Protected Overrides Sub OnInit(e As EventArgs)

        If (String.IsNullOrEmpty(Request.QueryString("clientHeight")) Or String.IsNullOrEmpty(Request.QueryString("clientWidth"))) Then
            Me._isFirstTime = True
        Else
            Integer.TryParse(Request.QueryString("clientHeight").ToString(), ClientHeight)
            Integer.TryParse(Request.QueryString("clientWidth").ToString(), ClientWidth)

            Session("globalClientWidth") = ClientWidth
            Session("globalClientHeight") = ClientHeight

            Me._isFirstTime = False
        End If
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

End Class