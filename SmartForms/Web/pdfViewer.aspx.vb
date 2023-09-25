Imports System.IO
Imports System.Net
Imports iText.Forms
Imports iText.Forms.Fields
Imports iText.Kernel.Pdf
Imports iText.Kernel.Utils
Imports iText.IO.Source
Imports iText.Layout
Imports iText.Layout.Element
Imports Microsoft.AspNetCore.Mvc

Public Class pdfViewer
    Inherits System.Web.UI.Page
    Dim pdftools As New PDFManager
    Private pdfProvider As Object

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            pdfStream()
        Else

        End If
    End Sub

    Private Sub pdfStream()

        Dim orighash As String = "885326974"

        Dim filename As String
        filename = Server.MapPath("~/forms/FINTRAC/" & orighash & ".pdf")
        Dim OutputFilepath As String = Server.MapPath("~/forms/FINTRAC/Output/" & orighash & ".pdf")

        Dim rd As PdfReader = New PdfReader(Server.MapPath("~/forms/FINTRAC/" & orighash & ".pdf"))
        rd.SetUnethicalReading(True)

        Dim targetname As String = orighash & " " & Now.ToShortDateString & " " & Now.ToShortTimeString
        targetname = Regex.Replace(targetname, "[^\w ]", "-")

        Dim ms As MemoryStream = New MemoryStream()
        Dim writer = New PdfWriter(ms)
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

            'field.SetValue(IIf(IsNothing(dslocals.usp_SearchValue(origid, keyName)), String.Empty, dslocals.usp_SearchValue(origid, keyName)))


        Next

        writer.SetCloseStream(False)
        template.Close()
        Dim byteinfo As Byte() = ms.ToArray()

        If byteinfo IsNot Nothing Then
            Response.ContentType = "application/pdf"
            Response.AddHeader("Content-Disposition", "attachment; filename=" + targetname + ".pdf")
            Response.AddHeader("content-length", byteinfo.Length.ToString())
            Response.BinaryWrite(byteinfo)

        End If

    End Sub



End Class

