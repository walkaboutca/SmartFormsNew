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

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not User.Identity.IsAuthenticated Then
            Response.Redirect("~/default.aspx", True)
            Exit Sub
        End If

        If IsPostBack Then

        Else

        End If


    End Sub
    Protected Sub rbLoadPdf_Click(sender As Object, e As EventArgs) Handles rbLoadPdf.Click
        Dim scr As String = Server.MapPath("~/Forms") & "\" & rcbForm.SelectedValue.ToString
        fillForm(scr)
    End Sub


    Public Sub fillForm(scr As String)

        Dim CurrentUserId As Guid = Guid.Parse(Me.Page.User.Identity.GetUserId())
        Dim renderedBytes As Byte() = Nothing

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

        rgFieldList.DataSource = dt


        rgFieldList.DataBind()

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

        Dim scr As String = Server.MapPath("~/Forms") & "\" & e.Value.ToString
        Dim renderedBytes As Byte() = Nothing
        Dim extention As String = Path.GetExtension(Server.MapPath("~/Forms") & "\" & e.Value.ToString)

        Using fs As FileStream = File.Open(scr, FileMode.Open)
            Dim readBinary As New BinaryReader(fs)
            Using binaryReader As New BinaryReader(fs)
                renderedBytes = binaryReader.ReadBytes(MaxTotalBytes)
                binaryReader.Close()
            End Using
        End Using
        RadPdfViewer1.PdfjsProcessingSettings.FileSettings.Data = Convert.ToBase64String(renderedBytes)

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


End Class