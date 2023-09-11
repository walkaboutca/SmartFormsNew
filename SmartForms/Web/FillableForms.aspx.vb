
Imports System.IO
Imports iText.Kernel.Pdf
Imports Telerik.Web.Spreadsheet
Imports Telerik.Windows.Documents.Common.FormatProviders
Imports Telerik.Windows.Documents.Fixed.FormatProviders.Pdf
Imports Telerik.Windows.Documents.Fixed.Model
Imports Telerik.Windows.Documents.Flow.FormatProviders.Docx
Imports Telerik.Windows.Documents.Flow.FormatProviders.Html
Imports Telerik.Windows.Documents.Flow.FormatProviders.Rtf
Imports Telerik.Windows.Documents.Flow.FormatProviders.Txt
Imports Telerik.Windows.Documents.Flow.Model

Public Class FillableForms
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim maxSize As Integer = 10 * 1024 * 1024 '10MB
        RadAsyncUpload1.MaxFileSize = maxSize

    End Sub

    Protected Sub RadAsyncUpload1_FileUploaded(sender As Object, e As Telerik.Web.UI.FileUploadedEventArgs)
        Dim renderedBytes As Byte() = Nothing
        Dim extention As String = System.IO.Path.GetExtension(e.File.FileName)
        'RadFlow Documents
        Dim document As RadFlowDocument = Nothing
        Dim provider As IFormatProvider(Of RadFlowDocument) = Nothing
        document = Provider.Import(e.File.InputStream)
        Dim pdfProvider As Telerik.Windows.Documents.Flow.FormatProviders.Pdf.PdfFormatProvider = New Telerik.Windows.Documents.Flow.FormatProviders.Pdf.PdfFormatProvider()
        Using ms As MemoryStream = New MemoryStream()
            pdfProvider.Export(document, ms)
            renderedBytes = ms.ToArray()
        End Using
        If Regex.IsMatch(extention, ".docx|.rtf|.html|.txt") Then
            Select Case extention
                Case ".docx"
                    provider = New DocxFormatProvider()
                Case ".rtf"
                    provider = New RtfFormatProvider()
                Case ".html"
                    provider = New HtmlFormatProvider()
                Case ".txt"
                    provider = New TxtFormatProvider()
                Case Else
                    provider = Nothing
            End Select

            'Workbook Documents
        ElseIf Regex.IsMatch(extention, ".xlsx|.csv") Then
            'Dim provider As IWorkbookFormatProvider = Nothing
            'Dim document As Workbook = Nothing
            'Select Case extention
            '    Case ".xlsx"
            '        provider = New XlsxFormatProvider()
            '    Case ".csv"
            '        provider = New CsvFormatProvider()
            '    Case Else
            '        provider = Nothing
            'End Select
            'document = provider.Import(e.File.InputStream)
            'Dim pdfProvider As Telerik.Windows.Documents.Spreadsheet.FormatProviders.Pdf.PdfFormatProvider = New Telerik.Windows.Documents.Spreadsheet.FormatProviders.Pdf.PdfFormatProvider()
            'Using ms As MemoryStream = New MemoryStream()
            '    pdfProvider.Export(document, ms)
            '    renderedBytes = ms.ToArray()
            'End Using
        End If
        ''option 1 - save file locally and set its path to the pdf viewer
        'Dim relativepath As String = "\content\" + e.File.GetNameWithoutExtension() + ".pdf"
        'Dim path As String = AppDomain.CurrentDomain.BaseDirectory + relativepath
        'File.WriteAllBytes(path, renderedBytes)
        'RadPdfViewer1.PdfjsProcessingSettings.File = relativepath
        'option2 -Convert the file to Base64 string And set it as pdfviewer's data
        pdfViewer.PdfjsProcessingSettings.FileSettings.Data = Convert.ToBase64String(renderedBytes)



    End Sub

End Class