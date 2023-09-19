Imports iText.Kernel.Pdf
Imports Telerik.Web.UI

Public Class PDFDataFieldMapper
    Inherits System.Web.UI.Page
    Const MaxTotalBytes As Integer = 1048576
    Private totalBytes As Long
    Dim pdftools As New PDFManager

    Private originalValue As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load



        If Not Page.IsPostBack Then
            rcbFintracForm.SelectedIndex = Nothing

        Else

        End If
    End Sub
    Private Sub rgvLeftSide_PreRender(sender As Object, e As EventArgs) Handles rgvLeftSide.PreRender
        If Request.QueryString("clientHeight") > 150 Then
            rgvLeftSide.Height = ((Request.QueryString("clientHeight") - 235) * 0.75)
            rgvRightSide.Height = (Request.QueryString("clientHeight") - 235)
        End If


        rgvLeftSide.MasterTableView.Font.Size = FontUnit.Small
        rgvRightSide.MasterTableView.Font.Size = FontUnit.Small

    End Sub
    Private Sub asyncNewDocument_FileUploaded(sender As Object, e As FileUploadedEventArgs) Handles asyncNewDocument.FileUploaded
        For Each file As UploadedFile In asyncNewDocument.UploadedFiles
            pdftools.PDFReadFormData(TryCast(file.InputStream, System.IO.FileStream), "Hold", rcbRightPaging.Checked)
            Dim ret As DataTable = Session("local_ReturnDataTable")
            rgvRightSide.DataSource = ret
            rgvRightSide.DataBind()

            rlFileUploaded.Text = file.GetName
            panelUpload.Visible = False
            rlFileUploaded.Visible = True
            lbResetUpload.Visible = True
        Next

    End Sub

    Protected Sub rcbFintracForm_SelectedIndexChanged(sender As Object, e As RadComboBoxSelectedIndexChangedEventArgs) Handles rcbFintracForm.SelectedIndexChanged

        If Not rcbFintracForm.SelectedValue = String.Empty Then
            pdftools.Empty_FintracCatalog(rcbFintracForm.SelectedValue)
            Dim ret As DataTable = Session("local_ReturnEmptyFintrac")
            rgvLeftSide.DataSource = ret
            rgvLeftSide.DataBind()
        Else
            rgvLeftSide.DataSource = Nothing
            rgvLeftSide.DataBind()
        End If


    End Sub

    Private Sub lbViewFintrac_Click(sender As Object, e As EventArgs) Handles lbViewFintrac.Click

        pdftools.View_FintracCatalog(rcbFintracForm.SelectedValue)

    End Sub

    Protected Sub lbResetUpload_Click(sender As Object, e As EventArgs) Handles lbResetUpload.Click
        rlFileUploaded.Text = Nothing
        panelUpload.Visible = True
        rlFileUploaded.Visible = False
        lbResetUpload.Visible = False
        rgvRightSide.DataSource = Nothing
        rgvRightSide.DataBind()


    End Sub

    Protected Sub rgvLeftSide_NeedDataSource(sender As Object, e As GridNeedDataSourceEventArgs) Handles rgvLeftSide.NeedDataSource

    End Sub

    Private Sub rgvLeftSide_SelectedIndexChanged(sender As Object, e As EventArgs) Handles rgvLeftSide.SelectedIndexChanged

        Dim ds As New smartDataTableAdapters.forms_CatalogFieldsTA
        Dim catid As Integer = ds.ScalarGetCatalogId(rcbFintracForm.SelectedValue)

        rtbSearchString.Text = ds.ScalarGetSearchString(catid, rgvLeftSide.SelectedValue)


    End Sub

    Private Sub rgvLeftSide_ItemCommand(sender As Object, e As GridCommandEventArgs) Handles rgvLeftSide.ItemCommand

    End Sub

    Protected Sub lbTestCode_Click(sender As Object, e As EventArgs) Handles lbTestCode.Click

        'Dim pdfPath As String = pdftools.Fill_FintracData("885326974", 39)


        'Dim Process As New Process
        'Process.StartInfo.FileName = pdfPath
        'Process.Start()





    End Sub

    Protected Sub rcbResetFields_Click(sender As Object, e As EventArgs) Handles rcbResetFields.Click
        If rcbResetFields.Checked Then

            Dim ds As New smartDataTableAdapters.forms_CatalogFieldsTA
            ds.DeleteFieldsByHashcode(rcbFintracForm.SelectedValue)
            Dim catid As Integer = ds.ScalarGetCatalogId(rcbFintracForm.SelectedValue)

            For Each item As GridDataItem In rgvLeftSide.MasterTableView.Items
                ds.InsertCatalogFields(catid, item.GetDataKeyValue("KeyName"), item.GetDataKeyValue("KeyType"), "|" & item.GetDataKeyValue("KeyName") & "|")

            Next

            rcbResetFields.Checked = False
        End If



    End Sub

    Protected Sub rcbSelectItem_Click(sender As Object, e As EventArgs)
        If sender.checked Then
            Dim ds As New smartDataTableAdapters.forms_CatalogFieldsTA
            Dim catid As Integer = ds.ScalarGetCatalogId(rcbFintracForm.SelectedValue)

            Dim keyname As String = rgvLeftSide.SelectedValue

            Dim row As GridDataItem = sender.parent.parent
            Dim cell As TableCell = row.Item("tmpSelect")
            Dim cb As RadCheckBox = CType(cell.FindControl("rcbSelectItem"), RadCheckBox)
            If cb.Checked Then
                ds.UpdateSearchString(row.Item("KeyName").Text, catid, keyname)
                rtbSearchString.Text = ds.ScalarGetSearchString(catid, keyname)
            End If

            sender.checked = False

        End If

    End Sub

    Protected Sub lbForceSave_Click(sender As Object, e As EventArgs) Handles lbForceSave.Click
        Dim ds As New smartDataTableAdapters.forms_CatalogFieldsTA
        Dim catid As Integer = ds.ScalarGetCatalogId(rcbFintracForm.SelectedValue)
        Dim keyname As String = rgvLeftSide.SelectedValue
        ds.UpdateSearchForceSave(rtbSearchString.Text, catid, keyname)
        rtbSearchString.Text = ds.ScalarGetSearchString(catid, keyname)

    End Sub
End Class