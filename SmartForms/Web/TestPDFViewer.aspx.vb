

Imports System.IO
Imports Telerik.Web.Spreadsheet
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

Public Class TestPDFViewer
    Inherits System.Web.UI.Page

    Dim pdftools As New PDFManager
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load



    End Sub

    Protected Sub RadButton1_Click(sender As Object, e As EventArgs) Handles RadButton1.Click

        Dim pdfstream As String = pdftools.Fill_FintracData("885326974", 39)
        If pdfstream.ToString = "57" Then
            rlWarning.Text = "You have a copy of this PDF open somewhere. </br> Close it and try again."
        End If

        'RadAsyncUpload1_FileUploaded(pdfstream)




    End Sub
    Protected Sub asyncNewDocument_FileUploaded(sender As Object, e As FileUploadedEventArgs) Handles asyncNewDocument.FileUploaded

        Dim renderedBytes As Byte() = Nothing
        Dim pdfProvider As Telerik.Windows.Documents.Flow.FormatProviders.Pdf.PdfFormatProvider = New Telerik.Windows.Documents.Flow.FormatProviders.Pdf.PdfFormatProvider()
        Using ms As MemoryStream = e.File.InputStream
            'pdfProvider.Export(document, ms)
            renderedBytes = ms.ToArray()
        End Using

        RadPdfViewer1.PdfjsProcessingSettings.FileSettings.Data = Convert.ToBase64String(renderedBytes)


    End Sub


    Protected Sub RadAsyncUpload1_FileUploaded(pdfstream As MemoryStream)

        Dim renderedBytes As Byte() = Nothing
        Dim pdfProvider As Telerik.Windows.Documents.Flow.FormatProviders.Pdf.PdfFormatProvider = New Telerik.Windows.Documents.Flow.FormatProviders.Pdf.PdfFormatProvider()
        Using ms As MemoryStream = pdfstream
            'pdfProvider.Export(document, ms)
            renderedBytes = ms.ToArray()
        End Using

        RadPdfViewer1.PdfjsProcessingSettings.FileSettings.Data = Convert.ToBase64String(renderedBytes)



        'Dim extention As String = ".pdf"
        ''RadFlow Documents
        'If Regex.IsMatch(extention, ".docx|.rtf|.html|.txt") Then
        '    Dim provider As IFormatProvider(Of RadFlowDocument) = Nothing
        '    Dim document As RadFlowDocument = Nothing
        '    Select Case extention
        '        Case ".docx"
        '            provider = New DocxFormatProvider()
        '        Case ".rtf"
        '            provider = New RtfFormatProvider()
        '        Case ".html"
        '            provider = New HtmlFormatProvider()
        '        Case ".txt"
        '            provider = New TxtFormatProvider()
        '        Case Else
        '            provider = Nothing
        '    End Select
        '    'document = provider.Import(e.File.InputStream)
        '    Dim pdfProvider As Telerik.Windows.Documents.Flow.FormatProviders.Pdf.PdfFormatProvider = New Telerik.Windows.Documents.Flow.FormatProviders.Pdf.PdfFormatProvider()
        '    Using ms As MemoryStream = pdfstream
        '        pdfProvider.Export(document, ms)
        '        renderedBytes = ms.ToArray()
        '    End Using
        '    'Workbook Documents
        'ElseIf Regex.IsMatch(extention, ".xlsx|.csv") Then
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
        'End If
        ''option 1 - save file locally and set its path to the pdf viewer
        'Dim relativepath As String = "\content\" + e.File.GetNameWithoutExtension() + ".pdf"
        'Dim path As String = AppDomain.CurrentDomain.BaseDirectory + relativepath
        'File.WriteAllBytes(path, renderedBytes)
        'RadPdfViewer1.PdfjsProcessingSettings.File = relativepath
        'option2 -Convert the file to Base64 string And set it as pdfviewer's data

    End Sub


End Class