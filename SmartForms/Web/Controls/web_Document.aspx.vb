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

Public Class web_Document
    Inherits System.Web.UI.Page
    Const MaxTotalBytes As Integer = 1048576
    Private totalBytes As Long
    Dim pdftools As New PDFManager

    Private pdfTargetDoc As PdfDocument
    Private pdfTargetForm As PdfAcroForm
    Private pdfTargetfields As IDictionary(Of String, PdfFormField)

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub rbSave_Click(sender As Object, e As EventArgs) Handles rbSave.Click

        Dim script As String = "window.onload = function() { closeWin(); };"
        ClientScript.RegisterStartupScript(Me.GetType(), "closeWin", script, True)

    End Sub

    Protected Sub rbClose_Click(sender As Object, e As EventArgs) Handles rbClose.Click

        Dim script As String = "window.onload = function() { closeWin(); };"
        ClientScript.RegisterStartupScript(Me.GetType(), "closeWin", script, True)

    End Sub

    Private Sub asyncNewDocument_FileUploaded(sender As Object, e As FileUploadedEventArgs) Handles asyncNewDocument.FileUploaded





    End Sub
End Class