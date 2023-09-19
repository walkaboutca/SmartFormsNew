Imports Telerik.Web.UI
Imports System.Data.Common
Imports System.Data.SqlClient
Imports System.IO
Imports iText.Forms
Imports iText.Forms.Fields
Imports Telerik.Windows.Documents.Fixed.FormatProviders.Pdf
Imports Telerik.Windows.Documents.Fixed.Model
Imports iText.Kernel.Pdf
Imports Microsoft.AspNet.Identity

Public Class web_NewWebKit
    Inherits System.Web.UI.Page
    Const MaxTotalBytes As Integer = 1048576
    Private totalBytes As Long

    Private pdfTargetDoc As PdfDocument
    Private pdfTargetForm As PdfAcroForm
    Private pdfTargetfields As IDictionary(Of String, PdfFormField)

    Dim mngpdf As New PDFManager

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub asyncNewKit_FileUploaded(sender As Object, e As FileUploadedEventArgs) Handles asyncNewKit.FileUploaded

        Dim provider As PdfFormatProvider = New PdfFormatProvider()
        Dim document As RadFixedDocument = Nothing
        Dim renderedBytes As Byte() = Nothing

        Dim smartdt As New DataTable
        smartdt.Columns.Add("FormAbbr", GetType(String))
        smartdt.Columns.Add("keyName", GetType(String))
        smartdt.Columns.Add("keyType", GetType(String))
        smartdt.Columns.Add("keyValue", GetType(String))


        For Each file As UploadedFile In asyncNewKit.UploadedFiles
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
                    Dim fields As IDictionary(Of String, PdfFormField) = form.GetFormFields

                    Dim documentid As Integer = Nothing
                    Dim localds As New smartDataTableAdapters.LocalTA
                    If IsNothing(localds.ret_SearchFormCatalog(documentinfo.GetTitle.ToString, documentinfo.GetAuthor.ToString)) Then
                        mngpdf.NewCatalogForm(pdfDoc, filestream)
                    End If
                    documentid = localds.ret_SearchFormCatalog(documentinfo.GetTitle.ToString, documentinfo.GetAuthor.ToString)

                    Dim ds As New smartDataTableAdapters.data_FormCatalogTA
                    Dim header As DataTable = ds.GetCatalogHeaderInfo(documentid)
                    Dim row As DataRow = header.Rows(0)

                    Dim webkittitle As String = Nothing
                    Dim keyfields As New smartDataTableAdapters.data_FormFieldsTA
                    Dim field As PdfFormField = Nothing
                    Dim keyName As String = Nothing
                    Dim keyType As String = Nothing
                    Dim keyValue As String = Nothing

                    Dim dswebkit As New smartDataTableAdapters.file_WebKitTA
                    Dim newwebkit As Integer = dswebkit.ret_NextIdent + 1

                    Dim keycollection As IDictionary(Of String, PdfFormField) = form.GetFormFields

                    Dim dsdocument As New smartDataTableAdapters.forms_DocumentsTA
                    dsdocument.Insert(documentid, row.Item("Abbreviation"), e.File.GetNameWithoutExtension, e.File.GetName, e.File.ContentType, e.File.GetExtension, Nothing, Nothing, Nothing, Nothing, Nothing, User.Identity.Name, Nothing)
                    Dim nextident As Integer = dsdocument.ret_NextIdent

                    Dim dsdoclines As New smartDataTableAdapters.forms_DocumentFieldsTA

                    For Each iKey As String In keycollection.Keys
                        field = form.GetField(iKey)
                        keyName = iKey.ToString
                        keyType = field.[GetType]().Name
                        keyValue = field.GetValueAsString
                        If keyValue <> "" And Not keyName.Contains(".") Then
                            smartdt.Rows.Add(row.Item("Abbreviation"), keyName, keyType, keyValue)
                            dsdoclines.Insert(nextident, newwebkit, keyName, keyType, keyValue)
                        End If
                    Next
                    Session("localData") = smartdt

                    Select Case row.Item("Abbreviation")
                        Case "MLC"
                            webkittitle = webkittitle & row.Item("Abbreviation")
                            field = form.GetField("txtFormDate")
                            If Not IsNothing(field) Then
                                keyType = field.[GetType]().Name
                                keyValue = field.GetValueAsString
                                If keyValue.ToString <> "" Then rtbContractDate.Text = keyValue
                            End If
                            field = form.GetField("txtmlsnumber")
                            If Not IsNothing(field) Then
                                keyType = field.[GetType]().Name
                                keyValue = field.GetValueAsString
                                If keyValue.ToString <> "" Then rtbMLSNo.Text = keyValue
                            End If

                            Dim c1 As String = Nothing
                            Dim c2 As String = Nothing
                            Dim c3 As String = Nothing

                            field = form.GetField("txtseller3")
                            If Not IsNothing(field) Then
                                keyType = field.[GetType]().Name
                                keyValue = field.GetValueAsString
                                If keyValue.ToString <> "" Then
                                    c3 = keyValue.Split(" "c)(0).Substring(0, 1) & " " & keyValue.Split(" "c)(1)
                                    hfIdent3.Value = keyValue
                                End If
                            End If
                            field = form.GetField("txtseller2")
                            If Not IsNothing(field) Then
                                keyType = field.[GetType]().Name
                                keyValue = field.GetValueAsString
                                If keyValue.ToString <> "" Then
                                    c2 = "/" & keyValue.Split(" "c)(0).Substring(0, 1) & " " & keyValue.Split(" "c)(1)
                                    hfIdent2.Value = keyValue
                                End If
                            End If
                            field = form.GetField("txtseller1")
                            If Not IsNothing(field) Then
                                keyType = field.[GetType]().Name
                                keyValue = field.GetValueAsString
                                If keyValue.ToString <> "" Then
                                    If c2 <> "" Then
                                        c1 = keyValue.Split(" "c)(0).Substring(0, 1) & " " & keyValue.Split(" "c)(1)
                                        hfIdent1.Value = keyValue
                                    End If
                                Else
                                    c1 = keyValue
                                End If
                                webkittitle = webkittitle & " - " & c1 & c2 & c3
                            End If

                            Dim paddress As String = Nothing

                            field = form.GetField("txtp_unitNumber")
                            If Not IsNothing(field) Then
                                keyType = field.[GetType]().Name
                                keyValue = field.GetValueAsString
                                If keyValue.ToString <> "" Then
                                    rtbAddAddress.Text = "Unit " & keyValue
                                    webkittitle = webkittitle & " - " & keyValue
                                End If
                            End If
                            field = form.GetField("txtp_streetnum")
                            If Not IsNothing(field) Then
                                keyType = field.[GetType]().Name
                                keyValue = field.GetValueAsString
                                If keyValue.ToString <> "" Then
                                    paddress = paddress & keyValue & " "
                                    webkittitle = webkittitle & " " & keyValue
                                End If
                            End If
                            field = form.GetField("txtp_street")
                            If Not IsNothing(field) Then
                                keyType = field.[GetType]().Name
                                keyValue = field.GetValueAsString
                                If keyValue.ToString <> "" Then
                                    paddress = paddress & keyValue & " "
                                    webkittitle = webkittitle & " " & keyValue
                                End If
                            End If
                            field = form.GetField("txtStreetType")
                            If Not IsNothing(field) Then
                                keyType = field.[GetType]().Name
                                keyValue = field.GetValueAsString
                                If keyValue.ToString <> "" Then
                                    rtbAddress.Text = webkittitle
                                    paddress = paddress & keyValue
                                    webkittitle = webkittitle & " " & keyValue & ", "
                                End If
                            End If
                            field = form.GetField("txtp_city")
                            If Not IsNothing(field) Then
                                keyType = field.[GetType]().Name
                                keyValue = field.GetValueAsString
                                If keyValue.ToString <> "" Then
                                    rtbCity.Text = keyValue
                                    webkittitle = webkittitle & " " & keyValue & " "
                                End If
                            End If
                            field = form.GetField("txtp_state")
                            If Not IsNothing(field) Then
                                keyType = field.[GetType]().Name
                                keyValue = field.GetValueAsString
                                If keyValue.ToString <> "" Then rtbProvince.Text = keyValue
                            End If
                            field = form.GetField("txtp_zipcode")
                            If Not IsNothing(field) Then
                                keyType = field.[GetType]().Name
                                keyValue = field.GetValueAsString
                                If keyValue.ToString <> "" Then rtbPCode.Text = keyValue
                            End If

                            rtbFileName.Text = webkittitle
                            rtbAddress.Text = paddress

                            field = form.GetField("txtl_brkagent")
                            If Not IsNothing(field) Then
                                keyType = field.[GetType]().Name
                                keyValue = field.GetValueAsString
                                If keyValue.ToString <> "" Then rtbAgent.Text = keyValue
                            End If
                            field = form.GetField("txtl_broker")
                            If Not IsNothing(field) Then
                                keyType = field.[GetType]().Name
                                keyValue = field.GetValueAsString
                                If keyValue.ToString <> "" Then rtbBrokerage.Text = keyValue
                            End If
                        Case "CPS"
                        Case Else
                    End Select


                End Using
                document = Nothing
                renderedBytes = Nothing
            Catch ex As System.IO.FileNotFoundException
                isTempFileThere = False
            End Try
        Next
    End Sub

    Protected Sub rbSave_Click(sender As Object, e As EventArgs) Handles rbSave.Click

        Dim dskit As New smartDataTableAdapters.file_WebKitTA
        dskit.Insert(rtbFileName.Text.Trim, rtbAddress.Text.Trim, rtbAddAddress.Text.Trim, rtbCity.Text.Trim, rtbProvince.Text.Trim, rtbPCode.Text.Trim, IIf(rtbContractDate.Text = "", Nothing, rtbContractDate.Text), rtbMLSNo.Text, Now, Context.User.Identity.Name, Nothing, Nothing, Nothing)
        Dim newkitid As Integer = dskit.ret_MaxIdent

        Dim locals As New smartDataTableAdapters.LocalTA
        Dim hashcode As String = locals.ret_FintracHashCode("Individual IIR")

        Dim txtp_streetnum As String = Nothing
        Dim txtp_street As String = Nothing
        Dim txtp_unitNumber As String = Nothing
        Dim txtp_city As String = Nothing
        Dim txtProvince As String = Nothing
        Dim txtp_zipcode As String = Nothing
        Dim txtpropAddrLine2 As String = Nothing
        Dim txtAgent As String = Nothing
        Dim txtBroker As String = Nothing
        Dim txtverifieddate1_mmmm As String = Nothing
        Dim txtverifieddate1_d As String = Nothing
        Dim txtverifieddate1_yyyy As String = Nothing
        Dim txtindividualName As String = Nothing
        Dim txtindividualAddress1 As String = Nothing
        Dim txtindividualAddress2 As String = Nothing


        Dim dsdoc As New smartDataTableAdapters.data_FormListTA
        Dim dsitems As New smartDataTableAdapters.data_FormFieldsTA
        Dim dt As DataTable = Session("localData")


        Select Case hashcode
            Case "885326974"
                txtp_streetnum = locals.ret_FieldDistinctValue("txtp_streetnum", 1, 1, 1, newkitid)
                txtp_street = locals.ret_FieldDistinctValue("txtp_street", 1, 0, 1, newkitid)
                txtp_unitNumber = locals.ret_FieldDistinctValue("txtp_unitnum", 1, 1, 1, newkitid)
                txtp_city = locals.ret_FieldDistinctValue("txtp_city", 1, 1, 1, newkitid)
                txtProvince = locals.ret_FieldDistinctValue("txtp_state", 1, 1, 1, newkitid)
                txtp_zipcode = locals.ret_FieldDistinctValue("txtp_zip", 1, 1, 1, newkitid)
                txtAgent = (locals.ret_FieldDistinctValue("Agent", 1, 1, 1, newkitid) & " " & locals.ret_FieldDistinctValue("Agent", 1, 1, 2, newkitid) & " " & locals.ret_FieldDistinctValue("Agent", 1, 1, 3, newkitid)).ToString.TrimEnd
                txtBroker = locals.ret_FieldDistinctValue("Broker", 1, 1, 1, newkitid)
                txtindividualAddress1 = (locals.ret_FieldDistinctValue("txts_street", 1, 1, 1, newkitid) & " " & locals.ret_FieldDistinctValue("txts_street", 1, 1, 2, newkitid)).ToString.Trim

                If Not IsNothing(locals.ret_FieldDistinctValue("seller1", 1, 1, 1, newkitid)) Then
                    txtindividualName = locals.ret_FieldDistinctValue("seller1", 1, 1, 1, newkitid)
                    dsdoc.Insert(newkitid, hashcode, txtindividualName, Nothing, "Individual IIR", hfDocumentUser.Value, Nothing, rtbAddress.Text, Nothing, Nothing, Context.User.Identity.Name, Now, Nothing, Nothing, Nothing, Nothing)
                    Dim newident = dsdoc.retNewId

                    Dim keytype As String = "PdfTextFormField"

                    dsitems.Insert(newident, "txtindividualName", keytype, txtindividualName, Now, User.Identity.Name, Nothing, Nothing)
                    dsitems.Insert(newident, "txtp_streetnum", keytype, txtp_streetnum, Now, User.Identity.Name, Nothing, Nothing)
                    dsitems.Insert(newident, "txtp_street", keytype, txtp_street, Now, User.Identity.Name, Nothing, Nothing)
                    dsitems.Insert(newident, "txtp_unitNumber", keytype, txtp_unitNumber, Now, User.Identity.Name, Nothing, Nothing)
                    dsitems.Insert(newident, "txtp_city", keytype, txtp_city, Now, User.Identity.Name, Nothing, Nothing)
                    dsitems.Insert(newident, "txtProvince", keytype, txtProvince, Now, User.Identity.Name, Nothing, Nothing)
                    dsitems.Insert(newident, "txtp_zipcode", keytype, txtp_zipcode, Now, User.Identity.Name, Nothing, Nothing)
                    dsitems.Insert(newident, "txtAgent", keytype, txtAgent, Now, User.Identity.Name, Nothing, Nothing)
                    dsitems.Insert(newident, "txtBroker", keytype, txtBroker, Now, User.Identity.Name, Nothing, Nothing)
                    dsitems.Insert(newident, "txtindividualAddress1", keytype, txtindividualAddress1, Now, User.Identity.Name, Nothing, Nothing)
                End If
                If Not IsNothing(locals.ret_FieldDistinctValue("seller2", 1, 1, 1, newkitid)) Then
                    txtindividualName = locals.ret_FieldDistinctValue("seller2", 1, 1, 1, newkitid)
                    dsdoc.Insert(newkitid, hashcode, txtindividualName, Nothing, "Individual IIR", hfDocumentUser.Value, Nothing, rtbAddress.Text, Nothing, Nothing, Context.User.Identity.Name, Now, Nothing, Nothing, Nothing, Nothing)
                    Dim newident = dsdoc.retNewId

                    Dim keytype As String = "PdfTextFormField"

                    dsitems.Insert(newident, "txtindividualName", keytype, txtindividualName, Now, User.Identity.Name, Nothing, Nothing)
                    dsitems.Insert(newident, "txtp_streetnum", keytype, txtp_streetnum, Now, User.Identity.Name, Nothing, Nothing)
                    dsitems.Insert(newident, "txtp_street", keytype, txtp_street, Now, User.Identity.Name, Nothing, Nothing)
                    dsitems.Insert(newident, "txtp_unitNumber", keytype, txtp_unitNumber, Now, User.Identity.Name, Nothing, Nothing)
                    dsitems.Insert(newident, "txtp_city", keytype, txtp_city, Now, User.Identity.Name, Nothing, Nothing)
                    dsitems.Insert(newident, "txtProvince", keytype, txtProvince, Now, User.Identity.Name, Nothing, Nothing)
                    dsitems.Insert(newident, "txtp_zipcode", keytype, txtp_zipcode, Now, User.Identity.Name, Nothing, Nothing)
                    dsitems.Insert(newident, "txtAgent", keytype, txtAgent, Now, User.Identity.Name, Nothing, Nothing)
                    dsitems.Insert(newident, "txtBroker", keytype, txtBroker, Now, User.Identity.Name, Nothing, Nothing)
                    dsitems.Insert(newident, "txtindividualAddress1", keytype, txtindividualAddress1, Now, User.Identity.Name, Nothing, Nothing)
                End If
                If Not IsNothing(locals.ret_FieldDistinctValue("seller3", 1, 1, 1, newkitid)) Then
                    txtindividualName = locals.ret_FieldDistinctValue("seller3", 1, 1, 1, newkitid)
                    dsdoc.Insert(newkitid, hashcode, txtindividualName, Nothing, "Individual IIR", hfDocumentUser.Value, Nothing, rtbAddress.Text, Nothing, Nothing, Context.User.Identity.Name, Now, Nothing, Nothing, Nothing, Nothing)
                    Dim newident = dsdoc.retNewId

                    Dim keytype As String = "PdfTextFormField"

                    dsitems.Insert(newident, "txtindividualName", keytype, txtindividualName, Now, User.Identity.Name, Nothing, Nothing)
                    dsitems.Insert(newident, "txtp_streetnum", keytype, txtp_streetnum, Now, User.Identity.Name, Nothing, Nothing)
                    dsitems.Insert(newident, "txtp_street", keytype, txtp_street, Now, User.Identity.Name, Nothing, Nothing)
                    dsitems.Insert(newident, "txtp_unitNumber", keytype, txtp_unitNumber, Now, User.Identity.Name, Nothing, Nothing)
                    dsitems.Insert(newident, "txtp_city", keytype, txtp_city, Now, User.Identity.Name, Nothing, Nothing)
                    dsitems.Insert(newident, "txtProvince", keytype, txtProvince, Now, User.Identity.Name, Nothing, Nothing)
                    dsitems.Insert(newident, "txtp_zipcode", keytype, txtp_zipcode, Now, User.Identity.Name, Nothing, Nothing)
                    dsitems.Insert(newident, "txtAgent", keytype, txtAgent, Now, User.Identity.Name, Nothing, Nothing)
                    dsitems.Insert(newident, "txtBroker", keytype, txtBroker, Now, User.Identity.Name, Nothing, Nothing)
                    dsitems.Insert(newident, "txtindividualAddress1", keytype, txtindividualAddress1, Now, User.Identity.Name, Nothing, Nothing)
                End If


        End Select

        locals.upd_WebKitSelected(User.Identity.Name, newkitid)

        Dim script As String = "window.onload = function() { closeWin(); };"
        ClientScript.RegisterStartupScript(Me.GetType(), "closeWin", script, True)


    End Sub

    Protected Sub rbClose_Click(sender As Object, e As EventArgs) Handles rbClose.Click

        Dim script As String = "window.onload = function() { closeWin(); };"
        ClientScript.RegisterStartupScript(Me.GetType(), "closeWin", script, True)

    End Sub



End Class