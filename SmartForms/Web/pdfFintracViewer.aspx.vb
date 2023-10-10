Imports Telerik.Web.UI

Public Class pdfFintracViewer
    Inherits System.Web.UI.Page
    Const MaxTotalBytes As Integer = 1048576

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            hfFormId.Value = Request.QueryString("formid")
            hfWebKitId.Value = Request.QueryString("webkitid")

            Dim localds As New smartDataTableAdapters.LocalTA
            Dim hashcode As String = localds.ret_DataFieldsIsStarted(hfFormId.Value)
            If Not IsNothing(hashcode) Then
                Dim ctrlname As String = "Controls/uc_" & hashcode & ".ascx"
                'LoadUserControl(ctrlname)
            Else
                'rcbWhichForm.SelectedIndex = -1
            End If
        End If

    End Sub

    'Private Sub rcbWhichForm_SelectedIndexChanged(sender As Object, e As RadComboBoxSelectedIndexChangedEventArgs) Handles rcbWhichForm.SelectedIndexChanged

    '    'Dim ctrlname As String = "Controls/uc_" & rcbWhichForm.SelectedValue & ".ascx"
    '    'LoadUserControl(ctrlname)


    'End Sub

    'Public Sub LoadUserControl(controlName As String)
    '    ajax_Main.Controls.Clear()
    '    panelTop.Visible = False
    '    Dim userControlID As String = controlName.Split("."c)(0)
    '    Dim userControl As UserControl = CType(Me.LoadControl(controlName), UserControl)
    '    userControl.ID = userControlID.Replace("/", "").Replace("~", "")
    '    ajax_Main.Controls.Add(userControl)

    'End Sub



End Class
