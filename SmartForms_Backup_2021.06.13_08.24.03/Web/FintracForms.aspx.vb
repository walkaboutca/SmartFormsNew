Imports System.IO
Imports Telerik.Web.UI
Imports Telerik.Windows.Documents.Common.FormatProviders
Imports Telerik.Windows.Documents.Flow.Model

Public Class FintracForms
    Inherits System.Web.UI.Page

    Const MaxTotalBytes As Integer = 1048576
    Private totalBytes As Long

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim maxSize As Integer = 10 * 1024 * 1024
        RadAsyncUpload1.MaxFileSize = maxSize


    End Sub

    Public Sub RadAsyncUpload1_FileUploaded(sender As Object, e As FileUploadedEventArgs)

        Dim renderedBytes As Byte() = Nothing
        Dim extention As String = Path.GetExtension(e.File.FileName)

        Dim liItem = New HtmlGenericControl("li")
        liItem.InnerText = e.File.FileName

        Using binaryReader As New BinaryReader(e.File.InputStream)
            renderedBytes = binaryReader.ReadBytes(binaryReader.BaseStream.Length)
            binaryReader.Close()
        End Using

        RadPdfViewer1.PdfjsProcessingSettings.FileSettings.Data = Convert.ToBase64String(renderedBytes)


    End Sub




End Class