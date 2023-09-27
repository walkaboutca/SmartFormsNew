Imports SendGrid
Imports SendGrid.Helpers.Mail
Imports System
Imports System.Data.SqlClient
Imports System.IO
Imports System.Threading.Tasks

Public Class EmailUtilities

    Dim sql As New SQLdata

    Public Function SendGridSimple(Optional dt As System.Data.DataTable = Nothing) As String

        Try
            Dim emailResponse = Execute(dt)
            Return "Mail Sent!"
        Catch ex As Exception
            Return "Mail NOT Sent!"
        End Try

    End Function

    Public Function IdentEmail(whatemail As String, userid As String, subject As String, body As String) As String
        Try
            Dim unused = Nothing
            Select Case whatemail
                Case "NewUserConfirm"
                    unused = email_NewUserConfirm(userid, subject, body)
                Case Else
                    'unused = Execute()
            End Select

            Return "Mail Sent!"

        Catch ex As Exception
            Return "Mail NOT Sent!"
        End Try


    End Function

    Public Function SendEmail(whatemail As String, content As String, Optional iscopy As Integer = Nothing, Optional attList As System.Data.DataTable = Nothing, Optional tomember As System.Data.DataTable = Nothing, Optional ccmember As System.Data.DataTable = Nothing, Optional reportparameters As System.Data.DataTable = Nothing, Optional accesslevel As String = Nothing, Optional attached As Attachment = Nothing) As String
        Try
            Dim unused = Nothing
            Select Case whatemail
                Case "InviteNewUser"
                    unused = email_AdminForAccess(content, tomember)
                Case "ActionNotice"
                    'unused = mail_NoticeHTML(content, attList)
                Case Else
                    'unused = Execute()
            End Select

            Return "Mail Sent!"

        Catch ex As Exception
            Return "Mail NOT Sent!"
        End Try

    End Function



    Private Function sendgridClient() As SendGridClient

        Dim apiKey = "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"
        Dim client = New SendGridClient(apiKey)
        Return client

    End Function


#Region "Identity E Mail"
    Private Async Function email_NewUserConfirm(userid As String, subject As String, body As String) As Task(Of Object)

        Dim client = sendgridClient()
        Dim from = New EmailAddress("ccrawford@pbstools.ca", "Marquise SPM")

        userid = "ccrawford@pbstools.ca"

        Dim [to] = New EmailAddress(userid)

        Dim plainTextContent = body
        Dim htmlContent = body

        Dim msg = MailHelper.CreateSingleEmail(from, [to], subject, plainTextContent, htmlContent)
        msg.AddCc("ccrawford@pbstools.ca")

        Dim response = Await client.SendEmailAsync(msg)

    End Function
#End Region


    Private Async Function email_AdminForAccess(content As String, dt As DataTable) As Task(Of Object)
        'Dim client = sendgridClient()

        'Dim subject As String = Nothing
        'Dim plainTextContent = Nothing
        'Dim htmlContent = Nothing

        'subject = "[PBS Tools - New User] " & Nothing
        'Dim ds As New dsLoneWolfTableAdapters.LocalTA
        'Try
        '    Dim msg = New SendGridMessage() With {
        '        .From = New EmailAddress(ds.ret_RegistryValue("EMail", "AdminFrom"), "LW Archives"),
        '        .Subject = subject,
        '        .PlainTextContent = content,
        '        .HtmlContent = content.Replace(vbCrLf, "<br />")
        '    }
        '    For Each row As DataRow In dt.Rows
        '        msg.AddTo(New EmailAddress(row.Item("To"), Nothing))
        '    Next

        '    Dim response = Await client.SendEmailAsync(msg)

        'Catch ex As Exception
        '    Return ex.Message
        'End Try
        'Return Nothing

    End Function

    Private Async Function mail_NoticeHTML(Subject As String, Optional dt As System.Data.DataTable = Nothing) As Task

        'Dim client = sendgridClient()

        'Dim from = New EmailAddress("ccrawford@pbstools.ca", "Marquise SPM")

        'Dim sql As New SQLdata

        'Dim ds As New dsLoneWolfTableAdapters.LocalTA
        'Dim toaddress As String = ds.ret_RegistryValue("EMail", "AdminTo")
        'Dim [to] = New EmailAddress(toaddress)

        'Dim plainTextContent = "New User Invitation."
        'Dim htmlContent = "New User Invitation."

        'Dim msg = MailHelper.CreateSingleEmail(from, [to], Subject, plainTextContent, htmlContent)
        'msg.AddCc("pm@cbmarquise.com")

        'Dim response = Await client.SendEmailAsync(msg)


    End Function



    Public Function BuildHTMLTable(dt As System.Data.DataTable, Optional fldList As System.Data.DataTable = Nothing) As String

        Return DatatableToHTML(dt, fldList)

    End Function

    Private Async Function Execute(Optional dt As System.Data.DataTable = Nothing) As Task
        Dim client = sendgridClient()

        Dim from = New EmailAddress("ccrawford@pbstools.ca", "Marquise SPM")

        Dim sql As New SQLdata

        Dim subject = "[" & dt.Rows(0).Item(0).ToString.Trim & "]"

        'Dim ds As New spmDataTableAdapters.GlobalTA
        'Dim toaddress As String = ds.ret_RegistryKeyValue("EMail", "MgrSendTo")
        'Dim [to] = New EmailAddress(toaddress)
        Dim [to] = Nothing
        Dim plainTextContent = "This Is a Security Deposit Bank Transfer notice."
        Dim htmlContent = DatatableToHTML(dt)

        Dim msg = MailHelper.CreateSingleEmail(from, [to], subject, plainTextContent, htmlContent)
        msg.AddCc("pm@cbmarquise.com")

        Dim response = Await client.SendEmailAsync(msg)


    End Function




#Region "SUPPORT"
    Public Async Function email_DataTableInHTML(content As String, subject As String, body As String, tomember As System.Data.DataTable, ccmember As System.Data.DataTable) As Task

        Dim client = sendgridClient()
        If IsNothing(body) Then body = ""
        Try
            Dim msg = New SendGridMessage() With {
                    .From = New EmailAddress("ccrawford@pbstools.ca", "Marquise SPM")
                }
            For Each torow As DataRow In tomember.Rows
                msg.AddTo(New EmailAddress(torow.Item("toemail"), Nothing))
            Next
            If Not IsNothing(ccmember) Then
                For Each ccrow As DataRow In ccmember.Rows
                    msg.AddTo(New EmailAddress(ccrow.Item("ccemail"), Nothing))
                Next
            End If
            msg.Subject = "[SPM " & subject & "]"
            msg.HtmlContent = body.TrimEnd & vbCrLf & vbCrLf & content

            Dim response = Await client.SendEmailAsync(msg).ConfigureAwait(False)
            msg = Nothing
        Catch ex As Exception
        End Try
    End Function

    Private Async Function email_pmSupportTicket(content As String) As Task(Of Object)
        Dim client = sendgridClient()

        Dim from = New EmailAddress("ccrawford@pbstools.ca", "spmSupport")
        Dim subject = "[PM Support Ticket]"
        Dim [to] = New EmailAddress("ccrawford@pbstools.ca")
        Dim plainTextContent = content
        Dim htmlContent = content
        Dim msg = MailHelper.CreateSingleEmail(from, [to], subject, plainTextContent, htmlContent)

        Dim response = Await client.SendEmailAsync(msg)

    End Function

    Private Async Function email_AdminForAccess(content As String) As Task

        'Dim client = sendgridClient()


        'Dim ds As New dsLoneWolfTableAdapters.LocalTA
        'Dim from = New EmailAddress(ds.ret_RegistryValue("EMail", "AdminFrom"), "PBS Archive")

        'Dim [to] = New EmailAddress("ccrawford@pbstools.ca")

        'Dim ccaddress As String = ds.ret_RegistryValue("EMail", "AdminTo")
        'Dim [cc] = New EmailAddress(ccaddress)

        'Dim subject = "Sending with SendGrid Is Fun"


        'Dim plainTextContent = content
        'Dim htmlContent = content
        'Dim msg = MailHelper.CreateSingleEmail(from, [to], subject, plainTextContent, htmlContent)
        'Dim response = Await client.SendEmailAsync(msg)
    End Function

    Private Async Function email_AcknowledgeAccess(content As String) As Task
        Dim client = sendgridClient()

        Dim from = New EmailAddress("ccrawford@pbstools.ca", "REBA Email")
        Dim subject = "Sending with SendGrid Is Fun"
        Dim [to] = New EmailAddress("ccrawford@pbstools.ca")
        Dim plainTextContent = content
        Dim htmlContent = content
        Dim msg = MailHelper.CreateSingleEmail(from, [to], subject, plainTextContent, htmlContent)
        Dim response = Await client.SendEmailAsync(msg)
    End Function

#End Region
    'Private Shared Function telerikAttachement(result As Telerik.Reporting.Processing.RenderingResult, fileName As String) As Attachment

    '    If Not result.HasErrors Then

    '        Dim ms As MemoryStream = New MemoryStream()
    '        ms.Write(result.DocumentBytes, 0, result.DocumentBytes.Length)
    '        ms.Seek(0, SeekOrigin.Begin)
    '        ms.Flush()

    '        Dim att As New SendGrid.Helpers.Mail.Attachment With {
    '                .Content = Convert.ToBase64String(result.DocumentBytes),
    '                .Filename = fileName,
    '                .Type = "application/pdf",
    '                .Disposition = "attachment"
    '            }
    '        Try
    '            Return att
    '        Catch ex As Exception
    '            Return Nothing
    '        End Try
    '    Else
    '        Return Nothing
    '    End If
    'End Function

    Private Shared Function DatatableToHTML(dt As System.Data.DataTable, Optional fldList As System.Data.DataTable = Nothing) As String

        Dim html As String = "<table cellpadding='5' cellspacing='0' style='border: 1px solid #ccc;font-size: 9pt;font-family:arial'>"

                Dim newdt As New System.Data.DataTable
        If Not IsNothing(fldList) Then
            For Each row As DataRow In fldList.Rows
                newdt.Columns.Add(row.Item("fldName"))
            Next
        Else
            For Each column As DataColumn In dt.Columns
                newdt.Columns.Add(column.ColumnName)
            Next
        End If


        For i As Integer = 0 To dt.Rows.Count - 1
            newdt.ImportRow(dt.Rows(i))
        Next

        Dim sb As StringBuilder = New StringBuilder()

        'Table start.
        sb.Append("<table cellpadding='5' cellspacing='0' style='border: 1px solid #ccc;font-size: 9pt;font-family:Arial'>")
        'Adding HeaderRow.
        sb.Append("<tr>")
        For Each column As DataColumn In newdt.Columns
            sb.Append(("<th style='background-color: #B8DBFD;border: 1px solid #ccc'>" _
                            + (column.ColumnName + "</th>")))
        Next
        sb.Append("</tr>")
        'Adding DataRow.
        For Each row As DataRow In newdt.Rows
            sb.Append("<tr>")
            For Each column As DataColumn In newdt.Columns
                sb.Append(("<td style='border: 1px solid #ccc'>" _
                                + (row(column.ColumnName).ToString + "</td>")))
            Next
            sb.Append("</tr>")
        Next
        'Table end.
        sb.Append("</table>")
        Return sb.ToString


    End Function
End Class
