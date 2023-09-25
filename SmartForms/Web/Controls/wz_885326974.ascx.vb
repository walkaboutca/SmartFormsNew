Imports Telerik.Web.UI
Imports System.IO
Imports iText.Forms
Imports iText.Forms.Fields
Imports iText.Kernel.Pdf
Imports iText.Kernel.Utils
Imports iText.IO.Source
Imports iText.Layout
Imports iText.Layout.Element
Imports iText.IO.Util
Imports Org.BouncyCastle.Math

Public Class wz_885326974
    Inherits System.Web.UI.UserControl
    Dim pdftools As New PDFManager
    Dim send As New SendUtilities
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then
            hfFormHash.Value = Request.QueryString("hashcode")
            hfFormId.Value = Request.QueryString("FormId")
            FillForm()
        Else

        End If
    End Sub
    Private Sub rwIdentification_PreRender(sender As Object, e As EventArgs) Handles rwIdentification.PreRender

        rwIdentification.Height = (Request.QueryString("wheight") * 0.66)


    End Sub

    Protected Sub butSubmit_Click(sender As Object, e As EventArgs) Handles butSubmit.Click

        SaveForm(sender)

        window_form.Title = "FINTRAC - Risk AI"
        window_form.AutoSize = False
        window_form.Behaviors = WindowBehaviors.Move Or WindowBehaviors.Resize Or WindowBehaviors.Close
        window_form.Height = 400
        window_form.Width = 800
        window_form.VisibleStatusbar = False
        Dim urlargs As String = "?formid=" & hfFormId.Value
        window_form.NavigateUrl = "~/Web/SearchEngine.aspx" & urlargs

        Dim script As String = "function f(){$find(""" + window_form.ClientID + """).show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);"
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "key", script, True)


    End Sub

    Protected Sub FillForm()

        For Each gb In allControls(Page).OfType(Of RadTextBox)
            gb.Text = Nothing
        Next

        Dim ds As New smartDataTableAdapters.data_FormFieldsTA
        Dim dt As DataTable = ds.GetPdfKeyValues(hfFormId.Value)
        For Each row As DataRow In dt.Rows
            If row.Item("KeyType") = "PdfTextFormField" And Not row.Item("KeyValue").ToString = "" Then
                Dim ctrl As Control = Me.FindControl(row.Item("KeyName"))
                If Not IsNothing(ctrl) Then
                    If ctrl.GetType.UnderlyingSystemType.Name = "RadTextBox" Then
                        CType(Me.FindControl(row.Item("KeyName")), RadTextBox).Text = row.Item("KeyValue")
                    End If
                    If ctrl.GetType.UnderlyingSystemType.Name = "RadDateInput" Then
                        CType(Me.FindControl(row.Item("KeyName")), RadDateInput).DbSelectedDate = row.Item("KeyValue")
                    End If
                End If
            End If
        Next

    End Sub
    Protected Sub SaveForm(sender)

        Dim savedt As New DataTable
        savedt.Columns.Add()
        savedt.Columns.Add("KeyName", GetType(String))
        savedt.Columns.Add("KeyType", GetType(String))
        savedt.Columns.Add("KeyValue", GetType(String))
        savedt.Columns.Add("UserName", GetType(String))

        Dim formid As Integer = CType(hfFormId.Value, Integer)
        Dim hashcode As String = hfFormHash.Value
        Dim username As String = Context.User.Identity.Name

        For Each c In sender.parent.Controls

            If TypeName(c) = "RadTextBox" Then
                savedt.Rows.Add(formid, c.id.ToString, TypeName(c).ToString, c.text, username)
            End If

            If TypeName(c) = "RadDatePicker" Then savedt.Rows.Add(formid, c.id, TypeName(c), IIf(IsNothing(c.dbSelectedDate), Nothing, c.dbSelectedDate), username)
            If TypeName(c) = "RadDateInput" Then savedt.Rows.Add(formid, c.id, TypeName(c), IIf(IsNothing(c.dbSelectedDate), Nothing, c.dbSelectedDate), username)
            If TypeName(c) = "RadCheckBox" Then savedt.Rows.Add(formid, c.id, TypeName(c), IIf(IsNothing(c.Checked), Nothing, c.Checked), username)

        Next

        pdftools.Save_FintracData(hashcode, formid, savedt)

    End Sub

    'Protected Sub butDisplayForm_Click(sender As Object, e As EventArgs) Handles butDisplayForm.Click

    '    SaveForm(sender)

    '    Dim hashcode As String = hfFormHash.Value
    '    Dim fileid As Integer = hfFormId.Value
    '    Dim webkitid As Integer = 0

    '    'Dim pdfstream As String = pdftools.Fill_FintracData(hashcode, fileid)
    '    Dim targetname As String = "TestingTargetName"

    '    window_form.Title = "PDF Viewer"
    '    window_form.AutoSize = False
    '    window_form.KeepInScreenBounds = True

    '    window_form.Behaviors = WindowBehaviors.Move Or WindowBehaviors.Resize Or WindowBehaviors.Close
    '    window_form.Height = Request.QueryString("wheight") - 50
    '    window_form.Width = 500
    '    window_form.VisibleStatusbar = False

    '    Dim urlargs As String = "?hashcode=" & hashcode & "&fileid=" & fileid & "&webkitid=" & webkitid
    '    window_form.NavigateUrl = "~/Viewer/pdfViewer.aspx" & urlargs

    '    Dim script As String = "function f(){$find(""" + window_form.ClientID + """).show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);"
    '    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "key", script, True)



    'End Sub

    Protected Sub butSave_Click(sender As Object, e As EventArgs) Handles butSave.Click
        SaveForm(sender)

    End Sub
    Iterator Function allControls(c As Control) As IEnumerable(Of Control)
        Yield c
        For Each cc As Control In c.Controls
            For Each ccc In allControls(cc)
                Yield ccc
            Next
        Next
    End Function
    Private Sub asyncNewDocument_FileUploaded(sender As Object, e As FileUploadedEventArgs) Handles asyncNewDocument.FileUploaded

        Dim TypeOutput As String = Nothing
        Dim formid As Integer = hfFormId.Value

        pdftools.PDFSaveFormData(e.File.InputStream, formid)

        FillForm()



    End Sub

    Protected Sub lbSendText_Click(sender As Object, e As EventArgs) Handles lbSendText.Click
        send.SendText(Nothing)
        SaveForm(sender)

        window_form.Title = "Smart Trak _ Mobile"
        window_form.AutoSize = False
        window_form.Behaviors = WindowBehaviors.Move Or WindowBehaviors.Resize Or WindowBehaviors.Close
        window_form.Height = 800
        window_form.Width = 500
        window_form.VisibleStatusbar = False
        Dim urlargs As String = "?formid=" & hfFormId.Value
        window_form.NavigateUrl = "~/Web/MobileIdentify.aspx" & urlargs

        Dim script As String = "function f(){$find(""" + window_form.ClientID + """).show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);"
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "key", script, True)



    End Sub

    Protected Sub rcbShowMobile_Click(sender As Object, e As EventArgs) Handles rcbShowMobile.Click
        If rcbShowMobile.Checked Then
            panelMobileIdentity.Visible = True
        Else
            panelMobileIdentity.Visible = False

        End If
    End Sub

    Private Sub rwIdentification_NextButtonClick(sender As Object, e As WizardEventArgs) Handles rwIdentification.NextButtonClick

        If Not rcbShowAllSteps.Checked Then
            Dim ps As String = rwIdentification.WizardSteps.Item(rwIdentification.GetPreviousStepIndex).ID

            If ps = "step_HeaderInfo" Then
                If rbGovernmentId.Checked Then rwIdentification.ActiveStepIndex = 2
                If rbCreditMethod.Checked Then rwIdentification.ActiveStepIndex = 3
                If rbDualIdMethod.Checked Then rwIdentification.ActiveStepIndex = 4
                If rbUnidentified.Checked Then rwIdentification.ActiveStepIndex = 5
            End If
            If ps = "step_GovernmentId" Then
                If rbGovernmentId.Checked Then rwIdentification.ActiveStepIndex = 6
            End If
            If ps = "step_CreditFile" Then
                If rbCreditMethod.Checked Then rwIdentification.ActiveStepIndex = 6
            End If
            If ps = "step_DualId" Then
                If rbDualIdMethod.Checked Then rwIdentification.ActiveStepIndex = 6
            End If
            If ps = "step_ThirdParty" Then
                If rrbTransConductedBehalfClient.SelectedValue = "Yes" Then
                    rwIdentification.ActiveStepIndex = 7
                Else
                    If txtReasonActingOn.Text.ToString <> "" Then
                        rwIdentification.ActiveStepIndex = 7
                    Else
                        rwIdentification.ActiveStepIndex = 8
                    End If
                End If
            End If
        End If

        '0 step_Verification
        '1 step_HeaderInfo
        '2 step_GovernmentId
        '3 step_CreditFile
        '4 step_DualId
        '5 step_UnrepresentedParty
        '6 step_ThirdParty
        '  step_ThirdPartIdent
        '7 step_WrapUp

        'rbGovernmentId
        'rbCreditMethod
        'rbDualIdMethod
        'rbUnidentified

    End Sub

    Private Sub rwIdentification_PreviousButtonClick(sender As Object, e As WizardEventArgs) Handles rwIdentification.PreviousButtonClick

        Dim ps As String = rwIdentification.ActiveStep.ID

        If ps = "step_CreditFile" Or ps = "step_DualId" Or ps = "step_UnrepresentedParty" Then
            rwIdentification.ActiveStepIndex = 1
        End If

    End Sub

    Protected Sub rbReviewDoc_Click(sender As Object, e As EventArgs) Handles rbReviewDoc.Click

        window_form.Title = "PDF Viewer"
        window_form.AutoSize = False
        window_form.KeepInScreenBounds = True

        window_form.Behaviors = WindowBehaviors.Move Or WindowBehaviors.Resize Or WindowBehaviors.Close
        window_form.Height = ((Request.QueryString("wheight") * 0.9))
        window_form.Width = ((Request.QueryString("wheight") * 0.8))
        window_form.VisibleStatusbar = False
        Dim urlargs As String = "?hashcode=" & hfFormHash.Value & "&fileid=" & hfFormId.Value & "&webkitid=" & Nothing
        window_form.NavigateUrl = "~/Viewer/pdfViewer.aspx" & urlargs

        Dim script As String = "function f(){$find(""" + window_form.ClientID + """).show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);"
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "key", script, True)

    End Sub
End Class