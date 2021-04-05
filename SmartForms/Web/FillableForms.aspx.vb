Imports System.IO
Imports iText.Forms
Imports iText.Forms.Fields
Imports iText.Kernel.Pdf
Imports Microsoft.AspNet.Identity
Imports Telerik.Web.UI
Imports Telerik.Windows.Documents.Flow.Model

Public Class FillableForms
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub RadButton1_Click(sender As Object, e As EventArgs) Handles RadButton1.Click
        Dim CurrentUserId As Guid = Guid.Parse(Me.Page.User.Identity.GetUserId())
        Dim renderedBytes As Byte() = Nothing

        Dim scr As String = "https://www.recbc.ca/pdf/forms/Disclosure-of-Representation-in-Trading-Services.pdf"

        Dim reader As PdfReader = New PdfReader(scr)
        Dim pdfDoc As PdfDocument = New PdfDocument(reader)

        Dim dt As New DataTable
        dt.Columns.Add("Key", GetType(String))
        dt.Columns.Add("Value", GetType(String))

        Dim form As PdfAcroForm = PdfAcroForm.GetAcroForm(pdfDoc, True)
        Dim fields As IDictionary(Of String, PdfFormField) = form.GetFormFields()

        For Each iKey As String In fields.Keys
            dt.Rows.Add(iKey.ToString, Nothing)
        Next
        rgFields.DataSource = dt
        rgFields.Rebind()

        pdfFormView.d

    End Sub


End Class