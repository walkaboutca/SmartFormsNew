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
            hfIsValidated.Value = "False"
            FillForm()


        Else

        End If
    End Sub
    Private Sub rwIdentification_PreRender(sender As Object, e As EventArgs) Handles rwIdentification.PreRender

        rwIdentification.Height = (Request.QueryString("wheight") * 0.66)

        uc_step_Verification.NoteHeight = (Request.QueryString("wheight") * 0.66)
        Uc_step_CreditFile.NoteHeight = (Request.QueryString("wheight") * 0.66)
        Uc_step_DualId.NoteHeight = (Request.QueryString("wheight") * 0.66)
        Uc_step_GovernmentId.NoteHeight = (Request.QueryString("wheight") * 0.66)
        Uc_step_HeaderInfo.NoteHeight = (Request.QueryString("wheight") * 0.66)
        Uc_step_ThirdPartIdent.NoteHeight = (Request.QueryString("wheight") * 0.66)
        Uc_step_ThirdParty.NoteHeight = (Request.QueryString("wheight") * 0.66)
        Uc_step_UnrepresentedParty.NoteHeight = (Request.QueryString("wheight") * 0.66)
        Uc_step_WrapUp.NoteHeight = (Request.QueryString("wheight") * 0.66)



        uc_step_Verification.WhatForm = sender.id
        uc_step_Verification.WhatControl = "step_Verification"
        Uc_step_CreditFile.WhatForm = sender.id
        Uc_step_CreditFile.WhatControl = "step_CreditFile"
        Uc_step_DualId.WhatForm = sender.id
        Uc_step_DualId.WhatControl = "step_DualId"
        Uc_step_GovernmentId.WhatForm = sender.id
        Uc_step_GovernmentId.WhatControl = "step_GovernmentId"
        Uc_step_HeaderInfo.WhatForm = sender.id
        Uc_step_HeaderInfo.WhatControl = "step_HeaderInfo"
        Uc_step_ThirdPartIdent.WhatForm = sender.id
        Uc_step_ThirdPartIdent.WhatControl = "step_ThirdPartIdent"
        Uc_step_ThirdParty.WhatForm = sender.id
        Uc_step_ThirdParty.WhatControl = "step_ThirdParty"
        Uc_step_UnrepresentedParty.WhatForm = sender.id
        Uc_step_UnrepresentedParty.WhatControl = "step_UnrepresentedParty"
        Uc_step_WrapUp.WhatForm = sender.id
        Uc_step_WrapUp.WhatControl = "step_WrapUp"

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

        window_form.Title = "Smart-Fintrac _ Mobile"
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

    Private Sub rwIdentification_NextButtonClick(sender As Object, e As WizardEventArgs) Handles rwIdentification.NextButtonClick

        Dim ps As String = rwIdentification.WizardSteps.Item(rwIdentification.GetPreviousStepIndex).ID
        If Not rcbShowAllSteps.Checked Then

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

    Private Sub rwIdentification_ActiveStepChanged(sender As Object, e As EventArgs) Handles rwIdentification.ActiveStepChanged
        If rwIdentification.ActiveStep.ID = "step_WrapUp" Then
            hfIsValidated.Value = "True"

            If String.IsNullOrEmpty(rrbTransConductedBehalfClient.SelectedValue.ToString) Then
                hfInvalidList.Value = "- You must [Check] a 3rd Party option. (Step 7)"
                hfIsValidated.Value = "False"
            End If



        End If
    End Sub

    Private Sub rwIdentification_FinishButtonClick(sender As Object, e As WizardEventArgs) Handles rwIdentification.FinishButtonClick
        If hfIsValidated.Value = "False" Then
            rlWrapUpMessage.Visible = True
            rlWrapUpMessage.Text = hfInvalidList.Value
            rwIdentification.ActiveStepIndex = 8
        Else
            rlWrapUpMessage.Visible = False
        End If

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

    'Protected Sub lbEdit_Click(sender As Object, e As EventArgs) Handles lbEdit.Click
    '    If lbEdit.Text = "Save" Then

    '        Dim dsNotes As New smartDataTableAdapters.notes_ControlsTA
    '        dsNotes.UpdControlNote(reIndividualIIF_Step1.ID, reIndividualIIF_Step1.Content)

    '        lbEdit.Text = "Edit"
    '    Else
    '        lbEdit.Text = "Save"
    '    End If
    'End Sub
End Class