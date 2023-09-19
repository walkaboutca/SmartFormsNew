Imports System.Data.Common
Imports System.Data.SqlClient
Imports System.IO
Imports iText.Forms
Imports iText.Forms.Fields
Imports Telerik.Windows.Documents.Fixed.FormatProviders.Pdf
Imports Telerik.Windows.Documents.Fixed.Model
Imports iText.Kernel.Pdf
Imports Microsoft.AspNet.Identity
Imports iText.Layout
Imports iText.IO.Source
Imports iText.Kernel.Pdf.Canvas.Parser.Listener
Imports iText.Kernel.Pdf.Canvas.Parser
Imports iText.StyledXmlParser.Jsoup.Helper

Public Class PDFManager

    Private Shared username As String = HttpContext.Current.User.Identity.Name

    Public Sub NewCatalogForm(pdfDoc As PdfDocument, filestream As FileStream)
        _NewCatalogForm(pdfDoc, filestream)
    End Sub

    Public Sub PDFReadFormData(filestream As FileStream, pdfname As String, Optional removepaging As Boolean = True)
        _PDFReadFormData(filestream, pdfname)
    End Sub

    Public Sub PDFSaveFormData(filestream As FileStream, fileid As Integer)
        _PDFSaveFormData(filestream, fileid)
    End Sub

    Public Sub Empty_FintracCatalog(hashcode As String)
        _Empty_FintracCatalog(hashcode)


    End Sub
    Public Sub View_FintracCatalog(hashcode As String)
        _View_FintracCatalog(hashcode)

    End Sub

    Public Sub Save_FintracData(hashcode As String, formid As Integer, dt As DataTable)
        _Save_FintracData(hashcode, formid, dt)
    End Sub

    Public Function Fill_FintracData(hashcode As String, formid As Integer) As Object

        Return _Fill_FintracData(hashcode, formid)

    End Function

    Private Function _Fill_FintracData(hashcode As String, formid As Integer) As String

        Dim TypeOutput As String = Nothing

        Dim orighash As Integer = hashcode
        Dim origid As Integer = formid

        Dim ds As New smartDataTableAdapters.LocalTA
        Dim targetname As String = ds.usp_getpdffilename(formid, 0)
        'Dim targetname As String = ds.ret_PDFFileLabel(formid) & " " & Now.ToShortDateString & " " & Now.ToShortTimeString

        targetname = Regex.Replace(targetname, "[^\w ]", "-")

        Dim FilePath = HttpContext.Current.Server.MapPath("~/forms/FINTRAC/" & orighash & ".pdf")
        Dim OutputFilepath As String = System.Environment.ExpandEnvironmentVariables("%userprofile%/downloads/" & targetname & ".pdf")

        Dim rd As PdfReader = New PdfReader(HttpContext.Current.Server.MapPath("~/Forms/FINTRAC/" & orighash & ".pdf"))
        rd.SetUnethicalReading(True)

        Try
            Dim writer = New PdfWriter(OutputFilepath)
            Dim template As PdfDocument = New PdfDocument(rd, writer)

            Dim Form As PdfAcroForm = PdfAcroForm.GetAcroForm(template, False)
            Dim dslocals As New smartDataTableAdapters.LocalTA
            Dim fields As IDictionary(Of String, PdfFormField) = Form.GetFormFields
            For Each iKey As String In fields.Keys
                Dim field As PdfFormField = Form.GetField(iKey)
                Dim keyName As String = iKey.ToString
                Dim keyType As String = field.[GetType]().Name

                field.SetValue(IIf(IsNothing(dslocals.usp_SearchValue(origid, keyName)), String.Empty, dslocals.usp_SearchValue(origid, keyName)))
            Next

            Dim document = New Document(template)
            document.Close()
            rd.Close()
            writer.Close()
            template.Close()

            Dim Process As New Process
            Process.StartInfo.FileName = OutputFilepath
            Process.Start()

            Return OutputFilepath

        Catch ex As Exception
            Return Err.Number
        End Try


    End Function


    Private Sub _PDFSaveFormData(filestream As FileStream, fileid As Integer)
        Dim provider As PdfFormatProvider = New PdfFormatProvider()
        Dim document As RadFixedDocument = Nothing

        Dim formdata As New smartDataTableAdapters.data_FormFieldsTA
        formdata.Delete(fileid)

        Dim ds As New smartDataTableAdapters.LocalTA
        Dim pdfname As String = ds.usp_getpdffilename(fileid, 0)

        'Dim smartdata As New DataTable
        'smartdata.Columns.Add("DocType", GetType(String))
        'smartdata.Columns.Add("keyName", GetType(String))
        'smartdata.Columns.Add("keyType", GetType(String))
        'smartdata.Columns.Add("keyValue", GetType(String))
        Dim tempFileName As String = String.Empty
        Try
            tempFileName = filestream.Name

            Dim reader As PdfReader = New PdfReader(tempFileName)
            Dim pdfDoc As PdfDocument = New PdfDocument(reader)
            Dim documentinfo As iText.Kernel.Pdf.PdfDocumentInfo = pdfDoc.GetDocumentInfo
            reader.SetUnethicalReading(True)
            Dim form As PdfAcroForm = PdfAcroForm.GetAcroForm(pdfDoc, True)
            Dim fields As IDictionary(Of String, PdfFormField) = form.GetFormFields

            For Each iKey As String In fields.Keys
                Dim field As PdfFormField = form.GetField(iKey)
                Dim keyName As String = Nothing
                Dim keyType As String = Nothing
                Dim keyValue As String = Nothing

                If field.GetValueAsString <> "" Then
                    keyName = iKey.ToString
                    keyType = field.[GetType]().Name
                    keyValue = field.GetValueAsString
                    formdata.Insert(fileid, keyName, keyType, keyValue, Now, username, Nothing, Nothing)
                End If

            Next
            document = Nothing

        Catch ex As System.IO.FileNotFoundException

        End Try



    End Sub

    Private Sub _Save_FintracData(hashcode As String, formid As Integer, dt As DataTable)

        Dim localds As New smartDataTableAdapters.LocalTA

        For Each row As DataRow In dt.Rows
            Try
                localds.usp_DataFieldsSave(formid, row.Item("KeyName"), row.Item("KeyType"), row.Item("KeyValue"), row.Item("UserName"))
            Catch ex As Exception

            End Try
        Next


    End Sub

    Private Sub _View_FintracCatalog(hashcode As String)

        Dim tempFileName As String = HttpContext.Current.Request.MapPath("~/Forms/FINTRAC/" & hashcode & ".pdf")

        Dim Process As New Process
        Process.StartInfo.FileName = tempFileName
        Process.Start()



    End Sub

    Private Sub _Empty_FintracCatalog(hashcode As String)

        Dim tempFileName As String = HttpContext.Current.Request.MapPath("~/Forms/FINTRAC/" & hashcode & ".pdf")

        Dim provider As PdfFormatProvider = New PdfFormatProvider()
        Dim document As RadFixedDocument = Nothing

        Dim smartdata As New DataTable
        smartdata.Columns.Add("keyName", GetType(String))
        smartdata.Columns.Add("keyType", GetType(String))

        Dim reader As PdfReader = New PdfReader(tempFileName)
        Dim pdfDoc As PdfDocument = New PdfDocument(reader)
        Dim documentinfo As iText.Kernel.Pdf.PdfDocumentInfo = pdfDoc.GetDocumentInfo
        reader.SetUnethicalReading(True)
        Dim form As PdfAcroForm = PdfAcroForm.GetAcroForm(pdfDoc, True)
        Dim fields As IDictionary(Of String, PdfFormField) = form.GetFormFields

        For Each iKey As String In fields.Keys
            Dim field As PdfFormField = form.GetField(iKey)
            If Not iKey.ToString.Contains(".") Then
                Dim keyName As String = iKey.ToString
                Dim keyType As String = field.[GetType]().Name
                smartdata.Rows.Add(keyName, keyType)
            End If
        Next
        document = Nothing
        HttpContext.Current.Session("local_ReturnEmptyFintrac") = smartdata


    End Sub

    Private Sub _PDFReadFormData(filestream As FileStream, pdfname As String, Optional removepaging As Boolean = True)
        Dim provider As PdfFormatProvider = New PdfFormatProvider()
        Dim document As RadFixedDocument = Nothing

        Dim smartdata As New DataTable
        smartdata.Columns.Add("DocType", GetType(String))
        smartdata.Columns.Add("keyName", GetType(String))
        smartdata.Columns.Add("keyType", GetType(String))
        smartdata.Columns.Add("keyValue", GetType(String))
        Dim tempFileName As String = String.Empty
        Try
            tempFileName = filestream.Name

            Dim reader As PdfReader = New PdfReader(tempFileName)
            Dim pdfDoc As PdfDocument = New PdfDocument(reader)
            Dim documentinfo As iText.Kernel.Pdf.PdfDocumentInfo = pdfDoc.GetDocumentInfo
            reader.SetUnethicalReading(True)
            Dim form As PdfAcroForm = PdfAcroForm.GetAcroForm(pdfDoc, True)
            Dim fields As IDictionary(Of String, PdfFormField) = form.GetFormFields

            For Each iKey As String In fields.Keys
                Dim field As PdfFormField = form.GetField(iKey)
                If removepaging Then
                    If Not iKey.ToString.Contains(".") Then
                        Dim keyName As String = iKey.ToString
                        Dim keyType As String = field.[GetType]().Name
                        Dim keyValue As String = field.GetValueAsString
                        smartdata.Rows.Add(pdfname, keyName, keyType, keyValue)
                    End If
                Else
                    Dim keyName As String = iKey.ToString
                    Dim keyType As String = field.[GetType]().Name
                    Dim keyValue As String = field.GetValueAsString
                    smartdata.Rows.Add(pdfname, keyName, keyType, keyValue)
                End If
            Next
            document = Nothing
            HttpContext.Current.Session("local_ReturnDataTable") = smartdata



        Catch ex As System.IO.FileNotFoundException

        End Try



    End Sub

    Private Sub _NewCatalogForm(pdfDoc As PdfDocument, filestream As FileStream)

        Dim documentinfo As iText.Kernel.Pdf.PdfDocumentInfo = pdfDoc.GetDocumentInfo
        Dim form As PdfAcroForm = PdfAcroForm.GetAcroForm(pdfDoc, False)
        Dim fields As IDictionary(Of String, PdfFormField) = form.GetFormFields

        Dim OutputFilepath As String = System.Environment.ExpandEnvironmentVariables("%userprofile%/downloads/ExportNewPdf.pdf")
        Dim rd As PdfReader = New PdfReader(filestream)
        rd.SetUnethicalReading(True)

        Dim writer = New PdfWriter(OutputFilepath)
        Dim template As PdfDocument = New PdfDocument(rd, writer)

        Dim write As PdfAcroForm = PdfAcroForm.GetAcroForm(template, False)
        For Each iKey As String In fields.Keys
            write.GetField(iKey).SetValue(String.Empty)
        Next

        writer.Close()

        Dim fStream As FileStream = File.OpenRead(OutputFilepath)
        Dim contents As Byte() = New Byte(fStream.Length - 1) {}
        fStream.Read(contents, 0, CInt(fStream.Length))
        fStream.Close()

        Dim locds As New smartDataTableAdapters.LocalTA
        Dim newkitid As Integer = locds.ret_WebKitMaxId

        Dim docs As New smartDataTableAdapters.forms_DocumentsTA
        Try
            docs.Insert(newkitid, "Upload", documentinfo.GetTitle, documentinfo.GetTitle, "application/pdf", ".pdf", contents, "Author", documentinfo.GetAuthor, Now, documentinfo.GetMoreInfo("ModDate"), username, Nothing)
        Catch ex As Exception

        End Try

        'exportdoc.Close()
        rd.Close()
        'writer.Close()
        'template.Close()

        'Dim Process As New Process
        'Process.StartInfo.FileName = OutputFilepath
        'Process.Start()



        'Dim buffer As Byte() = New Byte(filestream.Length - 1) {}
        'Using str As Stream = filestream
        '    str.Read(buffer, 0, buffer.Length)
        'End Using


        'Dim locds As New smartDataTableAdapters.LocalTA
        'Dim newkitid As Integer = locds.ret_WebKitMaxId

        'Dim docs As New smartDataTableAdapters.forms_DocumentsTA
        'Try
        '    docs.Insert(newkitid, "Upload", documentinfo.GetTitle, documentinfo.GetTitle, "application/pdf", ".pdf", buffer, "Author", documentinfo.GetAuthor, Now, documentinfo.GetKeywords("LastMod"))
        'Catch ex As Exception

        'End Try

        'Dim address As String = Nothing

        'For Each iKey As String In fields.Keys
        '    Dim field As PdfFormField = form.GetField(iKey)
        '    Dim keyName As String = iKey.ToString
        '    Dim keyType As String = field.[GetType]().Name
        '    Dim keyValue As String = field.GetValueAsString
        'Next



        'Dim strChar As String = "0123456789"
        'Dim rand As New Random
        'Dim NewHash As String = ""
        'For count_chars As Integer = 0 To 8
        '    NewHash += strChar(rand.Next(0, 10))
        'Next count_chars


    End Sub

    Private Function SafeFileName(ByVal nom As String) As String

        'First Trim the raw string
        Dim safe As String = nom.Trim

        'Replace spaces with hyphens
        safe = safe.Replace(" ", "-").ToLower()

        'Replace double spaces with singles
        If safe.IndexOf("--") > 1 Then
            While (safe.IndexOf("--") > -1)
                safe = safe.Replace("--", "-")
            End While
        End If

        'Trim out illegal characters
        safe = Regex.Replace(safe, "[^a-z0-9\\-]", "")

        'Trim Length
        If safe.Length > 50 Then
            safe = safe.Substring(0, 49)
        End If

        'Clean the beginning and end of filename
        Dim replace As Char() = {"-", "."}
        safe = safe.TrimStart(replace)
        safe = safe.TrimEnd(replace)

        Return safe

    End Function
    Private Function GetStreamAsByteArray(ByVal stream As MemoryStream) As Byte()

        Dim streamLength As Integer = Convert.ToInt32(stream.Length)
        Dim fileData As Byte() = New Byte(streamLength) {}
        ' Read the file into a byte array
        stream.Read(fileData, 0, streamLength)
        stream.Flush()
        stream.Close()

        Return fileData

    End Function

End Class
