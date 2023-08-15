Imports System.Data.Common
Imports System.Data.SqlClient
Imports System.IO
Imports iText.Forms
Imports iText.Forms.Fields

Imports iText.Kernel.Pdf
Imports Microsoft.AspNet.Identity
Imports Telerik.Web.UI


Public Class FintracForms
    Inherits System.Web.UI.Page

    Const MaxTotalBytes As Integer = 1048576
    Private totalBytes As Long

    Private pdfTargetDoc As PdfDocument
    Private pdfTargetForm As PdfAcroForm
    Private pdfTargetfields As IDictionary(Of String, PdfFormField)

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not User.Identity.IsAuthenticated Then
            Response.Redirect("~/default.aspx", True)
            Exit Sub
        End If

        If IsPostBack Then

        Else
            hfSelected.Value = 1
        End If

    End Sub
    Protected Sub rbLoadPdf_Click(sender As Object, e As EventArgs) Handles rbLoadPdf.Click

        Dim scr As String = Server.MapPath("~/Forms") & "\" & rcbForm.SelectedValue.ToString
        defineForm(scr)

    End Sub
    Public Sub defineForm(scr As String)

        Dim CurrentUserId As Guid = Guid.Parse(Me.Page.User.Identity.GetUserId())
        Dim renderedBytes As Byte() = Nothing

        Dim reader As PdfReader = New PdfReader(scr)
        Dim pdfDoc As PdfDocument = New PdfDocument(reader)

        Dim dt As New DataTable
        dt.Columns.Add("Id", GetType(Integer))
        dt.Columns.Add("FormName", GetType(String))
        dt.Columns.Add("DataGroup", GetType(String))
        dt.Columns.Add("DataField", GetType(String))
        dt.Columns.Add("DataFieldType", GetType(String))
        dt.Columns.Add("FormField", GetType(String))
        dt.Columns.Add("FormFieldType", GetType(String))
        dt.Columns.Add("[FormFieldTestData]", GetType(String))
        dt.Columns.Add("SourceForm", GetType(String))
        dt.Columns.Add("Selected", GetType(Integer))

        Dim form As PdfAcroForm = PdfAcroForm.GetAcroForm(pdfDoc, True)
        Dim fields As IDictionary(Of String, PdfFormField) = form.GetFormFields()

        Dim pdfFields As IDictionary(Of String, PdfFormField) = fields
        Dim pdfToggleButtonFields As IDictionary(Of String, PdfFormField) = GetPdfToggleButtonFields(pdfFields)
        Dim fieldValue As Object = Nothing

        For Each field As KeyValuePair(Of String, PdfFormField) In pdfToggleButtonFields
            fieldValue = (TryCast(field.Value.GetValue(), PdfName)).GetValue()
        Next

        Dim sourceformname As String = rtbFileTitle.Text

        Dim ds As New CanadaDataTableAdapters.QueriesTA
        ds.delFormDefinitions(sourceformname)

        For Each iKey As String In fields.Keys

            Dim field = form.GetField(iKey)

            If field.[GetType]() = GetType(PdfButtonFormField) Then
                'field.SetCheckType(PdfFormField.TYPE_CHECK)
                'field.SetValue("Yes", True)
            End If
            If iKey.ToString = "chkOpt_CRA" Then

                Dim i As Integer = 0


            End If

            dt.Rows.Add(Nothing, sourceformname, Nothing, Nothing, Nothing, iKey.ToString, field.[GetType]().Name, field.GetValueAsString, scr, 1)

        Next

        Dim consString As String = ConfigurationManager.ConnectionStrings("canadaData").ConnectionString
        Try
            Using con As New SqlConnection(consString)
                Using sqlBulkCopy As New SqlBulkCopy(con)
                    'Set the database table name
                    sqlBulkCopy.DestinationTableName = "dbo.fintrac_FormDefinition"

                    ''[OPTIONAL]: Map the DataTable columns with that of the database table
                    'sqlBulkCopy.ColumnMappings.Add("Id", "CustomerId")
                    'sqlBulkCopy.ColumnMappings.Add("Name", "Name")
                    'sqlBulkCopy.ColumnMappings.Add("Country", "Country")

                    con.Open()
                    sqlBulkCopy.WriteToServer(dt)
                    con.Close()
                End Using
            End Using
        Catch ex As Exception

        End Try


        rgvDefinitions.DataBind()



    End Sub

    'Public Function GetPdfFields() As IDictionary(Of String, PdfFormField)
    '    Try
    '        Dim pdfAcroForm As PdfAcroForm = pdfAcroForm.GetAcroForm(PdfDoc, False)
    '        Return pdfAcroForm.GetFormFields()
    '    Catch ex As Exception
    '        Return Nothing
    '    End Try
    'End Function

    Public Function GetPdfToggleButtonFields(ByVal pdfFields As IDictionary(Of String, PdfFormField)) As IDictionary(Of String, PdfFormField)
        Dim pdfToggleButtonsFields As Dictionary(Of String, PdfFormField) = New Dictionary(Of String, PdfFormField)()
        Try
            For Each field As KeyValuePair(Of String, PdfFormField) In pdfFields
                If (TypeOf field.Value Is PdfButtonFormField) AndAlso ((TryCast(field.Value, PdfButtonFormField)).IsToggleOff()) Then pdfToggleButtonsFields.Add(field.Key, field.Value)
            Next
            Return pdfToggleButtonsFields
        Catch
            Return Nothing
        End Try
    End Function



    Public Sub fillForm(scr As String)

        Dim CurrentUserId As Guid = Guid.Parse(Me.Page.User.Identity.GetUserId())
        Dim renderedBytes As Byte() = Nothing

        Dim reader As PdfReader = New PdfReader(scr)
        Dim pdfDoc As PdfDocument = New PdfDocument(reader)

        Dim dtval As New DataTable
        dtval.Columns.Add("FormId", GetType(String))
        dtval.Columns.Add("FieldName", GetType(String))
        dtval.Columns.Add("FieldValue", GetType(String))



    End Sub

    Public Sub ProcessDirectory(ByVal targetDirectory As String, ByRef dt As DataTable)
        Dim fileEntries As String() = Directory.GetFiles(targetDirectory)
        For Each fileName As String In fileEntries
            Dim fi As FileInfo = New FileInfo(fileName)
            dt.Rows.Add(Nothing, fi.Name, targetDirectory)
        Next

        Dim subdirectoryEntries As String() = Directory.GetDirectories(targetDirectory)
        For Each subdirectory As String In subdirectoryEntries
            ProcessDirectory(subdirectory, dt)
        Next
    End Sub

    Protected Sub rcbForm_SelectedIndexChanged(sender As Object, e As RadComboBoxSelectedIndexChangedEventArgs) Handles rcbForm.SelectedIndexChanged



    End Sub

    Private Sub rcbForm_ItemsRequested(sender As Object, e As RadComboBoxItemsRequestedEventArgs) Handles rcbForm.ItemsRequested

        Dim dt As DataTable = New DataTable("Mydata")
        dt.Columns.Add("ID", GetType(Integer))
        dt.Columns.Add("File", GetType(String))
        dt.Columns.Add("Folder", GetType(String))
        dt.Columns("ID").AutoIncrement = True
        dt.Columns("ID").AutoIncrementSeed = 1
        dt.Columns("ID").AutoIncrementStep = 1
        ProcessDirectory(Server.MapPath("~/Forms"), dt)
        rcbForm.DataSource = dt
        rcbForm.DataTextField = "File"
        rcbForm.DataValueField = "File"
        rcbForm.DataBind()

    End Sub

    Private Sub rgvDefinitions_DataBound(sender As Object, e As EventArgs) Handles rgvDefinitions.DataBound

        If Not (IsNothing(rcbForm.SelectedValue) Or rcbForm.SelectedValue.ToString = "") Then
            Dim scr As String = Server.MapPath("~/Forms") & "\" & rcbForm.SelectedValue.ToString
            displayForm(scr)
        End If

    End Sub

    Private Sub displayForm(scr As String)

        Dim renderedBytes As Byte() = Nothing
        'Dim extention As String = Path.GetExtension(Server.MapPath("~/Forms") & "\" & rcbForm.SelectedValue.Value.ToString)

        Dim reader As PdfReader = New PdfReader(scr)
        Dim dest As String = Server.MapPath("/Forms/Template.pdf")

        reader.SetUnethicalReading(True)
        Dim pdfDoc As PdfDocument = New PdfDocument(reader, New PdfWriter(dest))

        Dim form As PdfAcroForm = PdfAcroForm.GetAcroForm(pdfDoc, True)
        Dim fields As IDictionary(Of String, PdfFormField) = form.GetFormFields()

        Dim ds As New CanadaDataTableAdapters.FormDefinitionDataTA
        Dim dt As DataTable = ds.GetDefinitionData(rcbForm.SelectedValue)

        For Each row As DataRow In dt.Rows

            If Not IsNothing(row.Item("FormFieldTestData")) Then
                Dim testdata = row.Item("FormFieldTestData").ToString
                Dim field = form.GetField(row.Item("FormField").ToString)

                If row.Item("FormField").ToString = "chkOpt_CRA" Then
                    Dim typ As Object = field.GetType
                    'field.GetAppearanceStates("checkbox")
                    field.SetValue(testdata)

                End If
                'If row.Item("FormField").ToString = "chkOpt_CRA.1" Then
                '    'field.GetAppearanceStates("checkbox")
                '    field.SetValue("0")
                'End If
                'If row.Item("FormField").ToString = "chkOpt_CRA.2" Then
                '    'field.GetAppearanceStates("checkbox")
                '    field.SetValue("0")
                'End If



                'If field.[GetType]() = GetType(PdfTextFormField) And field.GetAppearanceStates.Count > 1 Then
                '    field.SetValue(testdata, True)
                'ElseIf field.[GetType]() = GetType(PdfButtonFormField) And field.GetAppearanceStates.Count > 1 Then
                '    'field.SetCheckType(PdfFormField.TYPE_CROSS)
                '    If testdata = "X" Then
                '        field.SetValue(field.GetAppearanceStates(0))
                '    Else
                '        field.SetValue(field.GetAppearanceStates(1))
                '    End If
                'ElseIf field.[GetType]() = GetType(PdfFormField) And field.GetAppearanceStates.Count > 1 Then
                '    'field.SetCheckType(PdfFormField.TYPE_CROSS)
                '    If testdata = "X" Then
                '        field.SetValue(field.GetAppearanceStates(0))
                '    Else
                '        field.SetValue(field.GetAppearanceStates(1))
                '    End If
                'Else
                '    field.SetValue(testdata)
                '    End If
            End If


        Next

        pdfDoc.SetCloseReader(True)
        pdfDoc.SetCloseWriter(True)
        pdfDoc.Close()

        Using fs As FileStream = File.Open(dest, FileMode.Open)
            Dim readBinary As New BinaryReader(fs)
            Using binaryReader As New BinaryReader(fs)
                renderedBytes = binaryReader.ReadBytes(MaxTotalBytes)
                binaryReader.Close()
            End Using
        End Using

        rtbFileTitle.Text = rcbForm.SelectedValue.ToString
        RadPdfViewer1.PdfjsProcessingSettings.FileSettings.Data = Convert.ToBase64String(renderedBytes)


    End Sub

    Protected Sub rcbSelected_Click(sender As Object, e As EventArgs) Handles rcbSelected.Click
        If rcbSelected.Checked Then
            hfSelected.Value = 0
        Else
            hfSelected.Value = 1
        End If
        rgvDefinitions.Rebind()

    End Sub


    Protected Sub cbShow_CheckedChanged(sender As Object, e As EventArgs)

        Dim ds As New CanadaDataTableAdapters.QueriesTA

        Dim item As GridDataItem = CType(sender.NamingContainer, GridDataItem)
        Dim keyvalue As String = item.GetDataKeyValue("Id").ToString()

        Dim ctrl As Control = CType(sender, CheckBox)

        If CType(sender, CheckBox).Checked = True Then
            ds.updDefinitionStatus(1, keyvalue)
        Else
            ds.updDefinitionStatus(0, keyvalue)
        End If
        rgvDefinitions.Rebind()


    End Sub




End Class