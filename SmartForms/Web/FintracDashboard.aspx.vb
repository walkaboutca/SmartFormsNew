Imports System.IO

Public Class FintracDashboard
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If IsPostBack Then

        Else
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



        End If

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
End Class