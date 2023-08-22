Imports System.Data.SqlClient
Imports iText.Forms
Imports iText.Forms.Fields
Imports iText.Kernel.Pdf
Imports Telerik.Web.UI
Imports Telerik.Windows.Documents.Fixed.FormatProviders.Pdf
Imports Telerik.Windows.Documents.Fixed.Model
Public Class FintracWizard
    Inherits System.Web.UI.Page
    Dim wheight As Integer
    Dim wwidth As Integer
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsNothing(Request.QueryString("clientHeight")) Then
            rwFintrac.Height = Unit.Pixel(Request.QueryString("clientHeight") * 0.75)
            wheight = ((Request.QueryString("clientHeight") * 0.9))
            wwidth = ((Request.QueryString("clientWidth") * 0.6))
        End If


    End Sub

    Protected Sub rgvOwners_NeedDataSource(sender As Object, e As Telerik.Web.UI.GridNeedDataSourceEventArgs) Handles rgvOwners.NeedDataSource
        Dim dt As New DataTable
        dt.Columns.Add("OwnerName", GetType(String))
        dt.Rows.Add("")
        rgvOwners.DataSource = dt



    End Sub

    Private Sub rgvOwners_PreRender(sender As Object, e As EventArgs) Handles rgvOwners.PreRender
        rgvOwners.MasterTableView.Font.Size = FontUnit.Small
    End Sub
    Private Sub async_Fintrac_FileUploaded(sender As Object, e As FileUploadedEventArgs) Handles async_Fintrac.FileUploaded

        Dim provider As PdfFormatProvider = New PdfFormatProvider()
        Dim document As RadFixedDocument = Nothing
        Dim renderedBytes As Byte() = Nothing

        Dim smarttdata As New DataTable
        smarttdata.Columns.Add("DocType", GetType(String))
        smarttdata.Columns.Add("keyName", GetType(String))
        smarttdata.Columns.Add("keyType", GetType(String))
        smarttdata.Columns.Add("keyValue", GetType(String))

        For Each file As UploadedFile In async_Fintrac.UploadedFiles
            Dim isTempFileThere As Boolean
            Dim tempFileName As String = String.Empty
            Try
                Using filestream = TryCast(file.InputStream, System.IO.FileStream)
                    tempFileName = filestream.Name

                    Dim reader As PdfReader = New PdfReader(tempFileName)
                    Dim pdfDoc As PdfDocument = New PdfDocument(reader)
                    Dim documentinfo As iText.Kernel.Pdf.PdfDocumentInfo = pdfDoc.GetDocumentInfo
                    reader.SetUnethicalReading(True)
                    Dim form As PdfAcroForm = PdfAcroForm.GetAcroForm(pdfDoc, True)

                    Dim dscatelog As New smartDataTableAdapters.forms_CatalogTA

                    dscatelog.Insert(Nothing, documentinfo.GetTitle, Nothing, documentinfo.GetAuthor, documentinfo.GetMoreInfo("CreationDate"), documentinfo.GetMoreInfo("ModDate"), Now, Context.User.Identity.Name, Nothing, Nothing)
                    Dim retvalue As Integer = dscatelog.Adapter.InsertCommand.Parameters("@RETURN_VALUE").Value

                    Dim dsFields As New smartDataTableAdapters.forms_CatalogFieldsTA

                    Dim fields As IDictionary(Of String, PdfFormField) = form.GetFormFields
                    For Each iKey As String In fields.Keys
                        Dim field As PdfFormField = form.GetField(iKey)
                        Dim keyName As String = iKey.ToString
                        Dim keyType As String = field.[GetType]().Name
                        Dim keyValue As String = field.GetValueAsString
                        dsFields.Insert(retvalue, keyName, keyType, keyValue, Nothing, Nothing, Now, Context.User.Identity.Name, Nothing, Nothing)
                        smarttdata.Rows.Add(documentinfo.GetTitle, keyName, keyType, keyValue)
                    Next
                End Using
                'rgvSmartData.DataSource = smarttdata
                'rgvSmartData.DataBind()
                document = Nothing
                renderedBytes = Nothing
            Catch ex As System.IO.FileNotFoundException
                isTempFileThere = False
            End Try
        Next
    End Sub

    Private Sub rwFintrac_ActiveStepChanged(sender As Object, e As EventArgs) Handles rwFintrac.ActiveStepChanged

        If IsNothing(rblFormType.SelectedValue) Then
            rlErrorMsg.Text = "You MUST chooses a FINTRAC Form Type to Proceed"
            rlErrorMsg.Visible = True
            Exit Sub
        Else
            rlErrorMsg.Text = Nothing
            rlErrorMsg.Visible = False
        End If

        windowViewer.AutoSize = False
        windowViewer.Behaviors = WindowBehaviors.Move Or WindowBehaviors.Resize Or WindowBehaviors.Close
        windowViewer.VisibleStatusbar = True

        windowViewer.Height = wheight
        windowViewer.Width = wwidth
        Dim urlargs As String = Nothing

        Select Case rblFormType.SelectedValue
            Case "885326974"

                For Each item As GridDataItem In rgvOwners.Items

                    urlargs = "?formtype=" & rblFormType.SelectedValue
                    windowViewer.NavigateUrl = "~/Web/pdfFintracViewer.aspx" & urlargs

                    Dim script As String = "function f(){$find(""" + windowViewer.ClientID + """).show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);"
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "key", script, True)

                Next

            Case "JointTenants"
                urlargs = ""
            Case "TenantsCommon"
                urlargs = ""
            Case "CorporateOwner"
                urlargs = ""
            Case "ForeignOwner"
                urlargs = ""
        End Select



    End Sub
End Class