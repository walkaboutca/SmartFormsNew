Public Class pdfViewer2
    Inherits System.Web.UI.Page
    Dim pdftools As New PDFManager
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim hashcode As String = Request.QueryString("hashcode")
        Dim fileid As String = Request.QueryString("fileid")
        Dim webkitid As String = Request.QueryString("webkitid")


        Dim bytedata As Byte() = pdftools.CreatePdfByte(hashcode, fileid)
        Response.ContentType = "Application/pdf"
        Call Response.BinaryWrite(bytedata)
        Response.End()

    End Sub

End Class