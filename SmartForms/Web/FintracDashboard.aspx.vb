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

    Dim pdftools As New PDFManager

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsNothing(Request.QueryString("clientHeight")) Then
            wheight = ((Request.QueryString("clientHeight") * 0.7))
            wwidth = ((Request.QueryString("clientWidth") * 0.6))
        End If

        Dim ds As New smartDataTableAdapters.LocalTA

        If Not Page.IsPostBack Then
            RadTabStrip1.SelectedIndex = 0
            Dim recid As Integer = IIf(IsNothing(ds.ret_WebkitLastSelected(User.Identity.Name)), 0, ds.ret_WebkitLastSelected(User.Identity.Name))


        Else
            If rgvWebKit.SelectedValue = -1 Then
            End If
        End If

    End Sub
    Private Sub FintracDashboard_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender

        reRiskMessage.Height = (wheight * 0.4)

        reRiskMessage.Content = "Tracy Redies is a public servant and the current President & CEO of Science World British Columbia 1. She has over 25 years of experience as a high-growth organization builder with a strong commitment to serving the province and its communities. Prior to joining Science World, she was the CEO of Coast Capital Savings Credit Union 1."


        If hfWebKitId.Value = "" Then
            hfWebKitId.Value = rgvWebKit.SelectedValue
            rgvForms.Rebind()

        End If


    End Sub
    Private Sub rgvWebKit_PreRender(sender As Object, e As EventArgs) Handles rgvWebKit.PreRender
        rgvWebKit.MasterTableView.Font.Size = FontUnit.Small
        rgvWebKit.Height = (wheight * 0.4)

    End Sub

    Private Sub rgvForms_PreRender(sender As Object, e As EventArgs) Handles rgvForms.PreRender
        rgvForms.MasterTableView.Font.Size = FontUnit.Small
        rgvForms.Height = (wheight * 0.4)

    End Sub
    Private Sub rgvBrokerKits_PreRender(sender As Object, e As EventArgs) Handles rgvBrokerCurrent.PreRender
        rgvBrokerCurrent.MasterTableView.Font.Size = FontUnit.Small
        rgvBrokerCurrent.Height = (wheight * 0.4)

    End Sub
    Private Sub rgvBrokerForms_PreRender(sender As Object, e As EventArgs) Handles rgvBrokerHistorical.PreRender
        rgvBrokerHistorical.MasterTableView.Font.Size = FontUnit.Small
        rgvBrokerHistorical.Height = (wheight * 0.4)

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
    Private Sub rgvWebKit_SelectedIndexChanged(sender As Object, e As EventArgs) Handles rgvWebKit.SelectedIndexChanged

        hfWebKitId.Value = rgvWebKit.SelectedValue
        rgvForms.DataBind()

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

            'Dim ctrl As RadComboBox = CType(Item.FindControl("rcbFormType"), RadComboBox)

            Dim Title As String = CType(Item.FindControl("rtbTitle"), RadTextBox).Text
            Dim HashCode As String = CType(Item.FindControl("rcbFormType"), RadComboBox).SelectedValue
            Dim FormType As String = CType(Item.FindControl("rcbFormType"), RadComboBox).Attributes("FormType")
            Dim UserName As String = Context.User.Identity.Name
            Dim CreatedBy As String = Context.User.Identity.Name
            Dim CreatedOn As DateTime = Now

            Dim ds As New smartDataTableAdapters.data_FormListTA
            Try
                ds.Insert(webkitid, HashCode, Title, Nothing, FormType, UserName, Nothing, Nothing, Nothing, Nothing, CreatedBy, CreatedOn, Nothing, Nothing, Nothing, Nothing)
                rgvForms.MasterTableView.IsItemInserted = False
                rgvForms.Rebind()
            Catch ex As Exception

            End Try


        End If
    End Sub

    Private Sub rgvForms_ItemDataBound(sender As Object, e As GridItemEventArgs) Handles rgvForms.ItemDataBound

        If TypeOf e.Item Is GridDataItem Then
            Dim dataItem As GridDataItem = TryCast(e.Item, GridDataItem)

            e.Item.Attributes("FormType") = dataItem("FormType").Text
            Dim locals As New smartDataTableAdapters.LocalTA
            Dim isdata As Integer = IIf(IsNothing(locals.ret_DataFieldsIsStarted(dataItem.GetDataKeyValue("Id"))), 0, 1)

            Dim ib As ImageButton = CType(dataItem.FindControl("ibDocuments"), ImageButton)
            Dim pdf As ImageButton = CType(dataItem.FindControl("pdfDocuments"), ImageButton)
            ib.Height = 15
            pdf.Height = 15

            If dataItem.GetDataKeyValue("RiskValue").ToString = "" Then
                If dataItem.GetDataKeyValue("FormType").ToString <> "" Then
                    ib.ImageUrl = "~/Images/QuestionMark.png"
                    If isdata > 0 Then
                        pdf.ImageUrl = "~/Images/pdf_Green_Icon.png"
                    Else
                        pdf.ImageUrl = "~/Images/pdf_Red.png"
                    End If

                Else
                    ib.Visible = False
                    pdf.Visible = False
                End If

            Else
                ib.ImageUrl = "~/Images/" & dataItem.GetDataKeyValue("RiskValue").ToString & ".png"
                pdf.ImageUrl = "~/Images/pdf_Green_Icon.png"
            End If


        End If
    End Sub
    Protected Sub ibDocuments_Click(sender As Object, e As ImageClickEventArgs)

        Dim item As GridDataItem = CType(sender.parent.Item, GridDataItem)
        Dim formid As Integer = IIf(item.GetDataKeyValue("HashCode").ToString = "", -1, item.GetDataKeyValue("HashCode"))
        Dim origid As Integer = item.GetDataKeyValue("Id")
        Dim webkitid As Integer = item.GetDataKeyValue("WebKitId")


        window_form.Title = "FINTRAC - Form"
        window_form.AutoSize = False
        window_form.Behaviors = WindowBehaviors.Move Or WindowBehaviors.Resize Or WindowBehaviors.Close
        window_form.Height = ((Request.QueryString("clientHeight") * 0.98))
        window_form.Width = ((Request.QueryString("clientWidth") * 0.6))
        window_form.VisibleStatusbar = False

        Dim urlargs As String = "?hashcode=" & formid & "&formid=" & origid & "&webkitid=" & webkitid & "&wheight=" & ((Request.QueryString("clientHeight") * 0.98))
        window_form.NavigateUrl = "~/Web/pdfFintracViewer.aspx" & urlargs

        Dim script As String = "function f(){$find(""" + window_form.ClientID + """).show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);"
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "key", script, True)

    End Sub
    Protected Sub pdfDocuments_Click(sender As Object, e As ImageClickEventArgs)

        Dim item As GridDataItem = CType(sender.parent.Item, GridDataItem)
        Dim hashcode As Integer = IIf(item.GetDataKeyValue("HashCode").ToString = "", -1, item.GetDataKeyValue("HashCode"))
        Dim fileid As Integer = item.GetDataKeyValue("Id")
        Dim webkitid As Integer = rgvWebKit.SelectedValue

        'Dim pdfstream As String = pdftools.Fill_FintracData(hashcode, fileid)
        Dim targetname As String = "TestingTargetName"

        window_form.Title = "PDF Viewer"
        window_form.AutoSize = False
        window_form.KeepInScreenBounds = True

        window_form.Behaviors = WindowBehaviors.Move Or WindowBehaviors.Resize Or WindowBehaviors.Close
        window_form.Height = ((Request.QueryString("clientHeight")))
        window_form.Width = ((Request.QueryString("clientWidth") * 0.8))
        window_form.VisibleStatusbar = False

        Dim urlargs As String = "?hashcode=" & hashcode & "&fileid=" & fileid & "&webkitid=" & webkitid
        window_form.NavigateUrl = "~/Viewer/pdfViewer.aspx" & urlargs

        Dim script As String = "function f(){$find(""" + window_form.ClientID + """).show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);"
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "key", script, True)

        'Dim byteinfo As Byte() = pdftools.CreatePdfByte(hashcode, fileid)

        'If byteinfo IsNot Nothing Then
        '    Response.ContentType = "application/pdf"
        '    Response.AddHeader("Content-Disposition", "attachment; filename=" + targetname + ".pdf")
        '    Response.AddHeader("content-length", byteinfo.Length.ToString())
        '    Response.BinaryWrite(byteinfo)

        'End If


    End Sub


    Private Sub rgvWebKit_ItemCommand(sender As Object, e As GridCommandEventArgs) Handles rgvWebKit.ItemCommand
        If (e.CommandName = RadGrid.DeleteCommandName) Then
            Dim ds As New smartDataTableAdapters.file_WebKitTA
            Dim deliten As GridDataItem = CType(e.Item, GridDataItem)
            ds.Delete(deliten.GetDataKeyValue("Id"))
            rgvWebKit.DataBind()
            e.Canceled = True

        End If

        If (e.CommandName = RadGrid.InitInsertCommandName) Then
            e.Canceled = True
            window_form.Title = "WEB KIT - Add / Edit"
            window_form.AutoSize = False
            window_form.Behaviors = WindowBehaviors.Move Or WindowBehaviors.Resize Or WindowBehaviors.Close
            window_form.Height = ((Request.QueryString("clientHeight") * 0.8))
            window_form.Width = ((Request.QueryString("clientWidth") * 0.4))
            window_form.VisibleStatusbar = False

            Dim urlargs As String = Nothing
            window_form.NavigateUrl = "~/Web/Controls/web_NewWebKit.aspx" & urlargs

            Dim script As String = "function f(){$find(""" + window_form.ClientID + """).show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);"
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "key", script, True)

        End If

        If (e.CommandName = RadGrid.PerformInsertCommandName) Then
            e.Canceled = True
            Dim Item As GridEditableItem = CType(e.Item, GridEditableItem)



        End If
    End Sub

    Private Sub rgvForms_ColumnCreated(sender As Object, e As GridColumnCreatedEventArgs) Handles rgvForms.ColumnCreated
        If e.Column.UniqueName = "AutoGeneratedDeleteColumn" Then
            e.Column.ItemStyle.Width = 50
            e.Column.HeaderStyle.Width = 50
        End If
        If e.Column.UniqueName = "AutoGeneratedEditColumn" Then
            e.Column.ItemStyle.Width = 50
            e.Column.HeaderStyle.Width = 50
        End If

    End Sub

    Private Sub rgvBrokerCurrent_ItemDataBound(sender As Object, e As GridItemEventArgs) Handles rgvBrokerCurrent.ItemDataBound
        If TypeOf e.Item Is GridDataItem Then
            Dim dataItem As GridDataItem = TryCast(e.Item, GridDataItem)

            e.Item.Attributes("FormType") = dataItem("FormType").Text
            Dim locals As New smartDataTableAdapters.LocalTA
            Dim isdata As Integer = IIf(IsNothing(locals.ret_DataFieldsIsStarted(dataItem.GetDataKeyValue("Id"))), 0, 1)
            Dim ib As ImageButton = CType(dataItem.FindControl("ibDocuments"), ImageButton)
            ib.Height = 15
            If dataItem.GetDataKeyValue("RiskValue").ToString = "" Then
                ib.ImageUrl = "~/Images/QuestionMark.png"
            Else
                ib.ImageUrl = "~/Images/" & dataItem.GetDataKeyValue("RiskValue").ToString & ".png"
            End If

        End If
    End Sub

    Private Sub rgvBrokerHistorical_ItemDataBound(sender As Object, e As GridItemEventArgs) Handles rgvBrokerHistorical.ItemDataBound
        If TypeOf e.Item Is GridDataItem Then
            Dim dataItem As GridDataItem = TryCast(e.Item, GridDataItem)

            e.Item.Attributes("FormType") = dataItem("FormType").Text
            Dim locals As New smartDataTableAdapters.LocalTA
            Dim isdata As Integer = IIf(IsNothing(locals.ret_DataFieldsIsStarted(dataItem.GetDataKeyValue("Id"))), 0, 1)
            Dim ib As ImageButton = CType(dataItem.FindControl("ibDocuments"), ImageButton)
            ib.Height = 15
            If dataItem.GetDataKeyValue("RiskValue").ToString = "" Then
                ib.ImageUrl = "~/Images/QuestionMark.png"
            Else
                ib.ImageUrl = "~/Images/" & dataItem.GetDataKeyValue("RiskValue").ToString & ".png"
            End If

        End If
    End Sub

    Private Sub LinkButton1_Click(sender As Object, e As EventArgs) Handles LinkButton1.Click

        window_form.Title = "PDF Viewer"
        window_form.AutoSize = False
        window_form.KeepInScreenBounds = True

        window_form.Behaviors = WindowBehaviors.Move Or WindowBehaviors.Resize Or WindowBehaviors.Close
        window_form.Height = ((Request.QueryString("clientHeight")))
        window_form.Width = ((Request.QueryString("clientWidth") * 0.8))
        window_form.VisibleStatusbar = False

        Dim urlargs As String = Nothing
        window_form.NavigateUrl = "~/Viewer/pdfViewer.aspx" & urlargs

        Dim script As String = "function f(){$find(""" + window_form.ClientID + """).show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);"
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "key", script, True)

    End Sub

    Protected Sub rbRisk_Click(sender As Object, e As EventArgs)



    End Sub
End Class

