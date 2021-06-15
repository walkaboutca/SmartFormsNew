Imports System.IO
Imports iText.Forms
Imports iText.Forms.Fields
Imports iText.Kernel.Pdf
Imports Microsoft.AspNet.Identity
Imports Telerik.Web.UI
Imports Telerik.Windows.Documents.Common.FormatProviders
Imports Telerik.Windows.Documents.Flow.FormatProviders.Docx
Imports Telerik.Windows.Documents.Flow.FormatProviders.Html
Imports Telerik.Windows.Documents.Flow.FormatProviders.Rtf
Imports Telerik.Windows.Documents.Flow.FormatProviders.Txt
Imports Telerik.Windows.Documents.Flow.Model
Imports Telerik.Windows.Documents.Spreadsheet.FormatProviders
Imports Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.Xlsx
Imports Telerik.Windows.Documents.Spreadsheet.FormatProviders.TextBased.Csv
Imports Telerik.Windows.Documents.Spreadsheet.Model
Public Class FillableForms
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim maxSize As Integer = 10 * 1024 * 1024
        RadAsyncUpload1.MaxFileSize = maxSize
        RadPdfViewer1.MaxSerializerLength = maxSize

    End Sub

    'Protected Sub RadAsyncUpload1_FileUploaded(ByVal sender As Object, ByVal e As FileUploadedEventArgs)
    '    Dim renderedBytes As Byte() = Nothing
    '    Dim extention As String = Path.GetExtension(e.File.FileName)

    '    If Regex.IsMatch(extention, ".docx|.rtf|.html|.txt") Then
    '        Dim provider As IFormatProvider(Of RadFlowDocument) = Nothing
    '        Dim document As RadFlowDocument = Nothing

    '        Select Case extention
    '            Case ".docx"
    '                provider = New DocxFormatProvider()
    '            Case ".rtf"
    '                provider = New RtfFormatProvider()
    '            Case ".html"
    '                provider = New HtmlFormatProvider()
    '            Case ".txt"
    '                provider = New TxtFormatProvider()
    '            Case Else
    '                provider = Nothing
    '        End Select

    '        document = provider.Import(e.File.InputStream)
    '        Dim pdfProvider As Telerik.Windows.Documents.Flow.FormatProviders.Pdf.PdfFormatProvider = New Telerik.Windows.Documents.Flow.FormatProviders.Pdf.PdfFormatProvider()

    '        Using ms As MemoryStream = New MemoryStream()
    '            pdfProvider.Export(document, ms)
    '            renderedBytes = ms.ToArray()
    '        End Using
    '        'ElseIf Regex.IsMatch(extention, ".xlsx|.csv") Then
    '        '    Dim provider As IWorkbookFormatProvider = Nothing
    '        '    Dim document As Workbook = Nothing

    '        '    Select Case extention
    '        '        Case ".xlsx"
    '        '            provider = New XlsxFormatProvider()
    '        '        Case ".csv"
    '        '            provider = New CsvFormatProvider()
    '        '        Case Else
    '        '            provider = Nothing
    '        '    End Select

    '        '    document = provider.Import(e.File.InputStream)
    '        '    'Dim pdfProvider As Telerik.Windows.Documents.Spreadsheet.FormatProviders.Pdf.PdfFormatProvider = New Telerik.Windows.Documents.Spreadsheet.FormatProviders.Pdf.PdfFormatProvider()

    '        '    Using ms As MemoryStream = New MemoryStream()
    '        '        pdfProvider.Export(document, ms)
    '        '        renderedBytes = ms.ToArray()
    '        '    End Using
    '    End If

    '    rlSourceForm.Text = "Displayed Document: <b>" & e.File.FileName & "</b>"
    '    RadPdfViewer1.PdfjsProcessingSettings.FileSettings.Data = Convert.ToBase64String(renderedBytes)
    'End Sub

End Class