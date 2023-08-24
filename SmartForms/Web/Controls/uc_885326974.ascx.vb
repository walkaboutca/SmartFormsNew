Imports Telerik.Web.UI
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

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            hfFormHash.Value = Request.QueryString("hashcode")
            hfFormId.Value = Request.QueryString("FormId")
            FillForm()

        Else

        End If
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

        Dim ds As New smartDataTableAdapters.data_FormFieldsTA
        Dim dt As DataTable = ds.GetPdfKeyValues(hfFormId.Value)
        For Each row As DataRow In dt.Rows
            If row.Item("KeyType") = "PdfTextFormField" And Not row.Item("KeyValue") = "" Then

                Dim ctrl As Control = Me.FindControl(row.Item("KeyName"))
                If ctrl.GetType.UnderlyingSystemType.Name = "RadTextBox" Then
                    CType(Me.FindControl(row.Item("KeyName")), RadTextBox).Text = row.Item("KeyValue")
                End If
                If ctrl.GetType.UnderlyingSystemType.Name = "RadDateInput" Then
                    CType(Me.FindControl(row.Item("KeyName")), RadDateInput).DbSelectedDate = row.Item("KeyValue")
                End If



            End If
        Next

    End Sub
    Protected Sub SaveForm(sender)
        Dim ds As New smartDataTableAdapters.data_FormFieldsTA

        For Each c In sender.parent.Controls
            If TypeName(c) = "RadTextBox" Then
                Dim label As String = CType(c, RadTextBox).ID
                If CType(c, RadTextBox).Text <> "" Then
                    Dim textval As String = CType(c, RadTextBox).Text
                    ds.UpdateDataField(textval, Now, Context.User.Identity.Name, hfFormId.Value, label)
                End If
            End If
            If TypeName(c) = "RadDateInput" Then
                Dim label As String = CType(c, RadDateInput).ID
                If CType(c, RadDateInput).Text <> "" Then
                    Dim textval As String = CType(c, RadDateInput).Text.Substring(0, 10)
                    ds.UpdateDataField(textval, Now, Context.User.Identity.Name, hfFormId.Value, label)
                End If
            End If
            'If TypeName(c) = "RadCheckBox" Then
            '    Dim label As String = CType(c, RadCheckBox).ID
            '    If CType(c, RadCheckBox).Checked <> "" Then
            '        Dim textval As String = CType(c, RadCheckBox).Checked
            '        ds.UpdateDataField(textval, Now, Context.User.Identity.Name, hfFormId.Value, label)
            '    End If
            'End If


        Next

        'Date PICKERS

        If Not IsNothing(Me.FindControl("rdpVerifiedDate")) Then
            Dim dp As RadDatePicker = CType(Me.FindControl("rdpVerifiedDate"), RadDatePicker)
            If Not IsNothing(dp.DbSelectedDate) Then
                ds.UpdateDataField(Month(dp.DbSelectedDate).ToString, Now, Context.User.Identity.Name, hfFormId.Value, "txttodaysDated1_mmmm")
                ds.UpdateDataField(Day(dp.DbSelectedDate).ToString, Now, Context.User.Identity.Name, hfFormId.Value, "txttodaysDated1_d")
                ds.UpdateDataField(Year(dp.DbSelectedDate).ToString, Now, Context.User.Identity.Name, hfFormId.Value, "txttodaysDated1_yyyy")
            End If

        End If

        If Not IsNothing(Me.FindControl("rdpascertainIdentityDate")) Then
            Dim dp As RadDatePicker = CType(Me.FindControl("rdpascertainIdentityDate"), RadDatePicker)
            If Not IsNothing(dp.DbSelectedDate) Then
                ds.UpdateDataField(Month(dp.DbSelectedDate).ToString, Now, Context.User.Identity.Name, hfFormId.Value, "txtascertainIdentityDated1_mmmm")
                ds.UpdateDataField(Day(dp.DbSelectedDate).ToString, Now, Context.User.Identity.Name, hfFormId.Value, "txtascertainIdentityDated1_d")
                ds.UpdateDataField(Year(dp.DbSelectedDate).ToString, Now, Context.User.Identity.Name, hfFormId.Value, "txtascertainIdentityDated1_yyyy")
            End If

        End If



    End Sub

    Protected Sub butDisplayForm_Click(sender As Object, e As EventArgs) Handles butDisplayForm.Click
        SaveForm(sender)

        Dim TypeOutput As String = Nothing

        Dim orighash As Integer = hfFormHash.Value
        Dim origid As Integer = hfFormId.Value

        Dim ds As New smartDataTableAdapters.LocalTA

        Dim targetname As String = ds.ret_PDFFileLabel(hfFormId.Value) & " " & Now.ToShortDateString & " " & Now.ToShortTimeString
        targetname = Regex.Replace(targetname, "[^\w ]", "-")

        Dim FilePath = Server.MapPath("~/forms/FINTRAC/" & orighash & ".pdf")
        Dim OutputFilepath As String = System.Environment.ExpandEnvironmentVariables("%userprofile%/downloads/" & targetname & ".pdf")

        Dim rd As PdfReader = New PdfReader(Server.MapPath("~/forms/FINTRAC/" & orighash & ".pdf"))
        rd.SetUnethicalReading(True)

        Dim writer = New PdfWriter(OutputFilepath)
        Dim template As PdfDocument = New PdfDocument(rd, writer)

        Dim Form As PdfAcroForm = PdfAcroForm.GetAcroForm(template, False)
        Dim dsfields As New smartDataTableAdapters.data_FormFieldsTA
        Dim dt As DataTable = dsfields.GetPdfKeyValues(origid)

        For Each row As DataRow In dt.Rows
            Form.GetField(row.Item("KeyName")).SetValue(row.Item("KeyValue"))
        Next
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
End Class