Imports System.IO
Imports Telerik.Web.UI

Public Class PropertyFintrac
    Inherits System.Web.UI.Page

    Const MaxTotalBytes As Integer = 1048576
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not User.Identity.IsAuthenticated Then
            Response.Redirect("~/default.aspx", True)
            Exit Sub
        End If
    End Sub

    Protected Sub lbNewRecord_Click(sender As Object, e As EventArgs) Handles lbNewRecord.Click

        Dim dt As DataTable = New DataTable("Mydata")
        dt.Columns.Add("ID", GetType(Integer))
        dt.Columns.Add("File", GetType(String))
        dt.Columns.Add("Folder", GetType(String))
        dt.Columns("ID").AutoIncrement = True
        dt.Columns("ID").AutoIncrementSeed = 1
        dt.Columns("ID").AutoIncrementStep = 1

        dt.Rows.Add(0, "Select Forms", Nothing)

        ProcessDirectory(Server.MapPath("~/Forms"), dt)
        rcbForm.DataSource = dt
        rcbForm.DataTextField = "File"
        rcbForm.DataValueField = "File"
        rcbForm.DataBind()

        rtbMLS.ReadOnly = False
        rtbAgentName.ReadOnly = False
        rtbFileTitle.ReadOnly = False
        rtbPropertyAddress.ReadOnly = False

        rtbAgentName.Text = Me.Page.User.Identity.Name

        rcbForm.Focus()


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

    Private Sub rcbForm_SelectedIndexChanged(sender As Object, e As RadComboBoxSelectedIndexChangedEventArgs) Handles rcbForm.SelectedIndexChanged

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

        rtbPropertyAddress.Text = e.Text

        RadPdfViewer1.PdfjsProcessingSettings.FileSettings.Data = Convert.ToBase64String(renderedBytes)

    End Sub
    Protected Sub lbSearchDDF_Click(sender As Object, e As EventArgs) Handles lbSearchDDF.Click

        Dim ds As New AzureDataTableAdapters.MLSDetailsTA
        Dim dt As DataTable = ds.GetMLSData(rtbMLS.Text)
        If dt.Rows.Count > 0 Then
            rtbPropertyAddress.Text = dt.Rows(0).Item("StreetAddress")
        Else

        End If


    End Sub
End Class