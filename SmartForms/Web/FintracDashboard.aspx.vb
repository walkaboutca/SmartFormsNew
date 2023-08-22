Imports System.IO
Imports Telerik.Web.UI
Imports iText.Forms
Imports iText.Forms.Fields
Imports iText.Kernel.Pdf
Imports iText.Kernel.Utils
Imports iText.IO.Source
Imports iText.Layout
Imports iText.Layout.Element
Imports Telerik.Windows.Documents.Fixed.FormatProviders.Pdf
Imports Telerik.Windows.Documents.Fixed.Model
Imports System.Net

Public Class FintracDashboard
    Inherits System.Web.UI.Page
    Dim wheight As Integer
    Dim wwidth As Integer
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsNothing(Request.QueryString("clientHeight")) Then
            wheight = ((Request.QueryString("clientHeight") * 0.7))
            wwidth = ((Request.QueryString("clientWidth") * 0.6))
        End If
        If Not Page.IsPostBack Then
            RadTabStrip1.SelectedIndex = 0

        End If

    End Sub

    Private Sub apanel_Left_PreRender(sender As Object, e As EventArgs) Handles apanel_Left.PreRender
        apanel_Left.Height = wheight

    End Sub

    Private Sub apanel_Right_PreRender(sender As Object, e As EventArgs) Handles apanel_Right.PreRender
        apanel_Right.Height = wheight


    End Sub

    Private Sub rgvWebKit_PreRender(sender As Object, e As EventArgs) Handles rgvWebKit.PreRender
        rgvWebKit.MasterTableView.Font.Size = FontUnit.Small
        rgvWebKit.Height = (wheight * 0.4)
    End Sub

    Private Sub rgvForms_PreRender(sender As Object, e As EventArgs) Handles rgvForms.PreRender
        rgvForms.MasterTableView.Font.Size = FontUnit.Small
        rgvForms.Height = (wheight * 0.4)
    End Sub

    Protected Sub asyncForm_FileUploaded(ByVal sender As Object, ByVal e As FileUploadedEventArgs)
        Dim provider As PdfFormatProvider = New PdfFormatProvider()
        Dim document As RadFixedDocument = Nothing
        Dim renderedBytes As Byte() = Nothing

        Dim smarttdata As New DataTable
        smarttdata.Columns.Add("DocType", GetType(String))
        smarttdata.Columns.Add("keyName", GetType(String))
        smarttdata.Columns.Add("keyType", GetType(String))
        smarttdata.Columns.Add("keyValue", GetType(String))

        For Each file As UploadedFile In sender.UploadedFiles
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

                    Dim ds As New smartDataTableAdapters.LocalTA
                    Dim nextid As Integer = ds.ret_DataFile_NextId

                    Dim dsFields As New smartDataTableAdapters.data_FormFieldsTA

                    Dim fields As IDictionary(Of String, PdfFormField) = form.GetFormFields
                    For Each iKey As String In fields.Keys
                        Dim field As PdfFormField = form.GetField(iKey)
                        Dim keyName As String = iKey.ToString
                        Dim keyType As String = field.[GetType]().Name
                        Dim keyValue As String = field.GetValueAsString
                        'If keyValue <> "" Then
                        dsFields.Insert(nextid, keyName, keyType, keyValue, Now, Context.User.Identity.Name, Nothing, Nothing)
                        'End If

                    Next
                End Using
                document = Nothing
                renderedBytes = Nothing
            Catch ex As System.IO.FileNotFoundException
                isTempFileThere = False
            End Try
        Next
    End Sub

    Private Sub rgvForms_ItemCommand(sender As Object, e As GridCommandEventArgs) Handles rgvForms.ItemCommand

        If (e.CommandName = RadGrid.DeleteCommandName) Then
            Dim ds As New smartDataTableAdapters.data_FormListTA
            Dim deliten As GridDataItem = CType(e.Item, GridDataItem)
            ds.Delete(deliten.GetDataKeyValue("Id"))
            rgvForms.DataBind()
            e.Canceled = True

        End If

        If (e.CommandName = RadGrid.PerformInsertCommandName) Then
            e.Canceled = True
            Dim Item As GridEditableItem = CType(e.Item, GridEditableItem)

            Dim webkitid As Integer = rgvWebKit.SelectedValue
            Dim Title As String = CType(Item.FindControl("rcbFormType"), RadComboBox).SelectedItem.Text.Substring(4)
            Dim HashCode As String = CType(Item.FindControl("rcbFormType"), RadComboBox).SelectedValue
            Dim UserName As String = Context.User.Identity.Name
            'Dim PropertyAddress As String = CType(Item.FindControl("rtbPropertyAddress"), RadTextBox).Text
            Dim CreatedBy As String = Context.User.Identity.Name
            Dim CreatedOn As DateTime = Now

            Dim ds As New smartDataTableAdapters.data_FormListTA
            Try
                ds.Insert(webkitid, HashCode, Title, Nothing, Nothing, UserName, Nothing, Nothing, Nothing, Nothing, CreatedBy, CreatedOn, Nothing, Nothing, Nothing, Nothing)
                rgvForms.MasterTableView.IsItemInserted = False
                rgvForms.Rebind()
            Catch ex As Exception

            End Try


        End If
    End Sub

    Private Sub rgvForms_ItemDataBound(sender As Object, e As GridItemEventArgs) Handles rgvForms.ItemDataBound

        If TypeOf e.Item Is GridDataItem Then
            Dim dataItem As GridDataItem = TryCast(e.Item, GridDataItem)

            Dim ib As ImageButton = CType(dataItem.FindControl("ibDocuments"), ImageButton)
            Dim mb As ImageButton = CType(dataItem.FindControl("manDocuments"), ImageButton)
            ib.Height = 15



            ib.ImageUrl = "~/Images/QuestionMark.png"

            'Select Case "i"
            '    Case 1
            '        ib.ImageUrl = "~/Images/pdf_Yellow.png"
            '    Case 2
            '        ib.ImageUrl = "~/Images/pdf_Blue.png"
            '    Case 9
            '        ib.ImageUrl = "~/Images/pdf_Green.png"
            '    Case Else
            '        ib.ImageUrl = "~/Images/pdf_Red.png"
            'End Select

        End If
    End Sub
    Protected Sub ibDocuments_Click(sender As Object, e As ImageClickEventArgs)

        Dim item As GridDataItem = CType(sender.parent.Item, GridDataItem)
        Dim formid As Integer = item.GetDataKeyValue("HashCode")
        Dim origid As Integer = item.GetDataKeyValue("Id")

        window_form.Title = "FINTRAC - Form"
        window_form.AutoSize = False
        window_form.Behaviors = WindowBehaviors.Move Or WindowBehaviors.Resize Or WindowBehaviors.Close
        window_form.Height = ((Request.QueryString("clientHeight") * 0.98))
        window_form.Width = ((Request.QueryString("clientWidth") * 0.6))
        window_form.VisibleStatusbar = False

        Dim urlargs As String = "?hashcode=" & formid & "&formid=" & origid
        window_form.NavigateUrl = "~/Web/pdfFintracViewer.aspx" & urlargs

        Dim script As String = "function f(){$find(""" + window_form.ClientID + """).show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);"
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "key", script, True)

    End Sub
    Protected Sub pdfDocuments_Click(sender As Object, e As ImageClickEventArgs)

        Dim TypeOutput As String = Nothing

        Dim kit As GridDataItem = CType(rgvWebKit.SelectedItems(0), GridDataItem)
        Dim item As GridDataItem = CType(sender.parent.Item, GridDataItem)
        Dim orighash As Integer = item.GetDataKeyValue("HashCode")
        Dim origid As Integer = item.GetDataKeyValue("Id")

        Dim targetname As String = kit.GetDataKeyValue("FileName") & " - " & item.GetDataKeyValue("Title") & " " & Now.ToShortDateString & " " & Now.ToShortTimeString
        targetname = Regex.Replace(targetname, "[^\w ]", "-")

        Dim FilePath = Server.MapPath("~/forms/FINTRAC/" & orighash & ".pdf")
        Dim OutputFilepath As String = System.Environment.ExpandEnvironmentVariables("%userprofile%/downloads/" & targetname & ".pdf")

        Dim rd As PdfReader = New PdfReader(Server.MapPath("~/forms/FINTRAC/" & orighash & ".pdf"))
        rd.SetUnethicalReading(True)

            Dim writer = New PdfWriter(OutputFilepath)
            Dim template As PdfDocument = New PdfDocument(rd, writer)

            Dim Form As PdfAcroForm = PdfAcroForm.GetAcroForm(template, False)
            Dim ds As New smartDataTableAdapters.data_FormFieldsTA
            Dim dt As DataTable = ds.GetPdfKeyValues(origid)

            For Each row As DataRow In dt.Rows
                Form.GetField(row.Item("KeyName")).SetValue(row.Item("KeyValue"))
            Next
            Dim document = New Document(template)
            document.Close()
            rd.Close()
            writer.Close()
            template.Close()

            Dim Process As New Process
            Process.StartInfo.FileName = OutputFilepath
            Process.Start()


    End Sub


End Class