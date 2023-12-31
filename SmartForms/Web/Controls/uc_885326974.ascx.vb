﻿Imports Telerik.Web.UI
Imports System.IO
Imports iText.Forms
Imports iText.Forms.Fields
Imports iText.Kernel.Pdf
Imports iText.Kernel.Utils
Imports iText.IO.Source
Imports iText.Layout
Imports iText.Layout.Element

Public Class uc_885326974
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
    Protected Sub butSubmit_Click(sender As Object, e As EventArgs) Handles butSubmit.click

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
    Protected Sub butMobile_Click(sender As Object, e As EventArgs) Handles butMobile.Click
        SaveForm(sender)

        window_form.Title = "FAAS _ Mobile"
        window_form.AutoSize = False
        window_form.Behaviors = WindowBehaviors.Move Or WindowBehaviors.Resize Or WindowBehaviors.Close
        window_form.Height = 300
        window_form.Width = 700
        window_form.VisibleStatusbar = False
        Dim urlargs As String = "?formid=" & hfFormId.Value
        window_form.NavigateUrl = "~/Web/MobileIdentify.aspx" & urlargs

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

    Protected Sub butDisplayForm_Click(sender As Object, e As EventArgs) Handles butDisplayForm.Click

        SaveForm(sender)

        Dim TypeOutput As String = Nothing

        Dim orighash As Integer = hfFormHash.Value
        Dim origid As Integer = hfFormId.Value

        Dim ds As New smartDataTableAdapters.LocalTA

        Dim targetname As String = ds.ret_PDFFileLabel(hfFormId.Value, 0)
        '& " " & Now.ToShortDateString & " " & Now.ToShortTimeString
        targetname = Regex.Replace(targetname, "[^\w ]", "-")

        Dim FilePath = Server.MapPath("~/forms/FINTRAC/" & orighash & ".pdf")
        Dim OutputFilepath As String = System.Environment.ExpandEnvironmentVariables("%userprofile%/downloads/" & targetname & ".pdf")

        Dim rd As PdfReader = New PdfReader(Server.MapPath("~/forms/FINTRAC/" & orighash & ".pdf"))
        rd.SetUnethicalReading(True)

        pdftools.Empty_FintracCatalog(hfFormHash.Value)

        Dim writer = New PdfWriter(OutputFilepath)
        Dim template As PdfDocument = New PdfDocument(rd, writer)

        Dim Form As PdfAcroForm = PdfAcroForm.GetAcroForm(template, False)
        'Dim dsfields As New smartDataTableAdapters.data_FormFieldsTA
        'Dim dt As DataTable = dsfields.GetPdfKeyValues(origid)

        Dim dslocals As New smartDataTableAdapters.LocalTA

        Dim fields As IDictionary(Of String, PdfFormField) = Form.GetFormFields
        For Each iKey As String In fields.Keys
            Dim field As PdfFormField = Form.GetField(iKey)
            Dim keyName As String = iKey.ToString
            Dim keyType As String = field.[GetType]().Name

            field.SetValue(IIf(IsNothing(dslocals.usp_SearchValue(origid, keyName)), String.Empty, dslocals.usp_SearchValue(origid, keyName)))


        Next

        'For Each row As DataRow In dt.Rows
        '    If Not IsNothing(Form.GetField(row.Item("KeyName"))) Then
        '        Form.GetField(row.Item("KeyName")).SetValue(row.Item("KeyValue"))
        '    End If
        'Next
        Dim document = New Document(template)
        document.Close()
        rd.Close()
        writer.Close()
        template.Close()

        Dim Process As New Process
        Process.StartInfo.FileName = OutputFilepath
        Process.Start()


    End Sub

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

        window_form.Title = "FAAS _ Mobile"
        window_form.AutoSize = False
        window_form.Behaviors = WindowBehaviors.Move Or WindowBehaviors.Resize Or WindowBehaviors.Close
        window_form.Height = 750
        window_form.Width = 350
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
End Class