Imports Telerik.Web.UI
Imports System.Data.Common
Imports System.Data.SqlClient
Imports System.IO
Imports iText.Forms
Imports iText.Forms.Fields
Imports Telerik.Windows.Documents.Fixed.FormatProviders.Pdf
Imports Telerik.Windows.Documents.Fixed.Model
Imports iText.Kernel.Pdf
Imports Microsoft.AspNet.Identity

Public Class web_NewWebKit
    Inherits System.Web.UI.Page
    Const MaxTotalBytes As Integer = 1048576
    Private totalBytes As Long

    Private pdfTargetDoc As PdfDocument
    Private pdfTargetForm As PdfAcroForm
    Private pdfTargetfields As IDictionary(Of String, PdfFormField)

    Dim mngpdf As New PDFManager

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub asyncNewKit_FileUploaded(sender As Object, e As FileUploadedEventArgs) Handles asyncNewKit.FileUploaded

        Dim provider As PdfFormatProvider = New PdfFormatProvider()
        Dim document As RadFixedDocument = Nothing
        Dim renderedBytes As Byte() = Nothing

        Dim smarttdata As New DataTable
        smarttdata.Columns.Add("DocType", GetType(String))
        smarttdata.Columns.Add("keyName", GetType(String))
        smarttdata.Columns.Add("keyType", GetType(String))
        smarttdata.Columns.Add("keyValue", GetType(String))

        For Each file As UploadedFile In asyncNewKit.UploadedFiles
            Dim isTempFileThere As Boolean
            Dim tempFileName As String = String.Empty
            Try
                Using filestream = TryCast(file.InputStream, System.IO.FileStream)
                    tempFileName = filestream.Name

                    Dim reader As PdfReader = New PdfReader(tempFileName)
                    Dim pdfDoc As PdfDocument = New PdfDocument(reader)
                    Dim documentinfo As iText.Kernel.Pdf.PdfDocumentInfo = pdfDoc.GetDocumentInfo
                    reader.SetUnethicalReading(True)
                    Dim form As PdfAcroForm = PdfAcroForm.GetAcroForm(pdfDoc, True)
                    Dim fields As IDictionary(Of String, PdfFormField) = form.GetFormFields

                    Dim documentid As Integer = Nothing
                    Dim localds As New smartDataTableAdapters.LocalTA

                    If IsNothing(localds.ret_SearchFormCatalog(documentinfo.GetTitle.ToString, documentinfo.GetAuthor.ToString)) Then
                        mngpdf.NewCatalogForm(pdfDoc, filestream)
                    Else
                        documentid = localds.ret_SearchFormCatalog(documentinfo.GetTitle.ToString, documentinfo.GetAuthor.ToString)
                    End If
                    Dim newwebkit As Integer = localds.ret_WebKitMaxId

                    Dim keyfields As New smartDataTableAdapters.forms_DocumentFieldsTA
                    For Each iKey As String In fields.Keys
                        Dim field As PdfFormField = form.GetField(iKey)
                        Dim keyName As String = iKey.ToString
                        Dim keyType As String = field.[GetType]().Name
                        Dim keyValue As String = field.GetValueAsString

                        If keyValue <> "" And Not keyName.Contains(".") Then
                            keyfields.Insert(documentid, newwebkit, keyName, keyType, keyValue, Now, Context.User.Identity.Name, Nothing, Nothing)
                        End If

                    Next
                    Dim linesds As New smartDataTableAdapters.data_FormFieldsTA

                    Dim address As String = Nothing
                    address = address & localds.ret_FieldDistinctValue("StreetNum", 1, 1, 1, Nothing) & " "
                    address = address & localds.ret_FieldDistinctValue("Street", 1, 0, 1, Nothing)
                    rtbAddress.Text = address
                    rtbFileName.Text = address
                    rtbAddAddress.Text = localds.ret_FieldDistinctValue("Unit", 1, 1, 1, Nothing)



                    rtbCity.Text = localds.ret_FieldDistinctValue("City", 1, 1, 1, Nothing)
                    rtbProvince.Text = localds.ret_FieldDistinctValue("State", 1, 1, 1, Nothing)
                    rtbPCode.Text = localds.ret_FieldDistinctValue("ZipCode", 1, 1, 1, Nothing)

                    rtbAgent.Text = localds.ret_FieldDistinctValue("agent", 1, 1, 1, Nothing)
                    rtbBrokerage.Text = localds.ret_FieldDistinctValue("broker", 1, 1, 1, Nothing)

                    hfDocumentUser.Value = localds.ret_FieldDistinctValue("currentusername", 1, 1, 1, Nothing)

                    If rcblSide.SelectedValue = "Buyer" Then
                        hfIdent1.Value = localds.ret_FieldDistinctValue("buyer1", 1, 1, 1, Nothing)
                        hfIdent2.Value = localds.ret_FieldDistinctValue("buyer2", 1, 1, 2, Nothing)
                        hfIdent3.Value = localds.ret_FieldDistinctValue("buyer3", 1, 1, 3, Nothing)

                    Else
                        hfIdent1.Value = localds.ret_FieldDistinctValue("seller1", 1, 1, 1, Nothing)
                        hfIdent2.Value = localds.ret_FieldDistinctValue("seller2", 1, 1, 2, Nothing)
                        hfIdent3.Value = localds.ret_FieldDistinctValue("seller3", 1, 1, 3, Nothing)

                    End If





                End Using
                document = Nothing
                renderedBytes = Nothing
            Catch ex As System.IO.FileNotFoundException
                isTempFileThere = False
            End Try
        Next
    End Sub

    Protected Sub rbSave_Click(sender As Object, e As EventArgs) Handles rbSave.Click

        Dim dskit As New smartDataTableAdapters.file_WebKitTA
        dskit.Insert(rtbFileName.Text.Trim, rtbAddress.Text.Trim, rtbAddAddress.Text.Trim, rtbCity.Text.Trim, rtbProvince.Text.Trim, rtbPCode.Text.Trim, IIf(rtbContractDate.Text = "", Nothing, rtbContractDate.Text), rtbMLSNo.Text)

        Dim locals As New smartDataTableAdapters.LocalTA
        Dim newkitid As Integer = locals.ret_WebKitMaxId
        'Dim hashcode As String = locals.ret_FintracHashCode("Individual IIR")
        Dim hashcode As String = Nothing

        Dim dsdoc As New smartDataTableAdapters.data_FormListTA
        If Not (IsNothing(hfIdent1.Value) Or hfIdent1.Value = "") Then dsdoc.Insert(newkitid, hashcode, hfIdent1.Value, Nothing, "FINTRAC", hfDocumentUser.Value, Nothing, rtbAddress.Text, Nothing, Nothing, Nothing, Context.User.Identity.Name, Now, Nothing, Nothing, Nothing)
        If Not (IsNothing(hfIdent2.Value) Or hfIdent2.Value = "") Then dsdoc.Insert(newkitid, hashcode, hfIdent2.Value, Nothing, "FINTRAC", hfDocumentUser.Value, Nothing, rtbAddress.Text, Nothing, Nothing, Context.User.Identity.Name, Now, Nothing, Nothing, Nothing, Nothing)
        If Not (IsNothing(hfIdent3.Value) Or hfIdent3.Value = "") Then dsdoc.Insert(newkitid, hashcode, hfIdent3.Value, Nothing, "FINTRAC", hfDocumentUser.Value, Nothing, Nothing, Nothing, Nothing, Context.User.Identity.Name, Now, Nothing, Nothing, Nothing, Nothing)

        Dim script As String = "window.onload = function() { closeWin(); };"
        ClientScript.RegisterStartupScript(Me.GetType(), "closeWin", script, True)


    End Sub

    Protected Sub rbClose_Click(sender As Object, e As EventArgs) Handles rbClose.Click

        Dim script As String = "window.onload = function() { closeWin(); };"
        ClientScript.RegisterStartupScript(Me.GetType(), "closeWin", script, True)

    End Sub


End Class