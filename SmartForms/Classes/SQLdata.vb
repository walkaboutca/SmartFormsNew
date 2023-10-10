Imports System.Configuration
Imports System.Data.Entity.Core.Metadata.Edm
Imports System.Data.SqlClient
Imports System.Drawing.Imaging
Imports System.IO
Imports System.Security.Cryptography
Imports Microsoft.Ajax.Utilities
Imports Telerik.Web.UI

Public Class SQLdata
    Private enc As System.Text.UTF8Encoding
    Private encryptor As ICryptoTransform
    Private decryptor As ICryptoTransform


    Public Function SecuredDT(ByVal storedProcedureName As String, ByVal ParamArray arrParam() As SqlParameter) As DataTable
        Dim dt As DataTable

        storedProcedureName = setSchema(storedProcedureName)

        ' Open the connection
        Using cnn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("smartData").ConnectionString)
            cnn.Open()
            ' Define the command
            Using cmd As New SqlCommand
                cmd.Connection = cnn
                cmd.CommandType = CommandType.StoredProcedure
                cmd.CommandText = storedProcedureName
                ' Handle the parameters
                If arrParam IsNot Nothing Then
                    For Each param As SqlParameter In arrParam
                        cmd.Parameters.Add(param)
                    Next
                End If
                ' Define the data adapter and fill the dataset
                Using da As New SqlDataAdapter(cmd)
                    dt = New DataTable
                    da.Fill(dt)

                End Using
            End Using
        End Using

        Return dt
    End Function

    Public Function SelectListDT(ByVal CommandName As String, CmdType As String, ByVal sqlParam As ListItemCollection) As DataTable
        Dim dt As New DataTable
        CommandName = setSchema(CommandName)

        ' Open the connection
        Using cnn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("smartData").ConnectionString)
            cnn.Open()
            ' Define the command
            Using cmd As New SqlCommand
                cmd.Connection = cnn
                If CmdType = "Text" Then cmd.CommandType = CommandType.Text
                If CmdType = "Table" Then cmd.CommandType = CommandType.TableDirect
                If CmdType = "Proc" Then cmd.CommandType = CommandType.StoredProcedure
                cmd.CommandText = CommandName
                ' Handle the parameters
                If sqlParam IsNot Nothing Then
                    For Each param As ListItem In sqlParam
                        cmd.Parameters.Add(New SqlParameter(param.Text, param.Value))
                    Next

                End If
                ' Define the data adapter and fill the dataset
                Try
                    Using da As New SqlDataAdapter(cmd)
                        dt = New DataTable
                        da.Fill(dt)
                    End Using
                Catch ex As Exception
                    Return Nothing
                End Try

            End Using
        End Using

        Return dt
    End Function

    Public Function UpdateDT(ByVal CommandName As String, CmdType As String, ByVal sqlParam As ListItemCollection) As DataTable

        CommandName = setSchema(CommandName)

        ' Open the connection
        Using cnn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("smartData").ConnectionString)
            cnn.Open()
            ' Define the command
            Using cmd As New SqlCommand
                cmd.Connection = cnn
                If CmdType = "Text" Then cmd.CommandType = CommandType.Text
                If CmdType = "Table" Then cmd.CommandType = CommandType.TableDirect
                If CmdType = "Proc" Then cmd.CommandType = CommandType.StoredProcedure
                cmd.CommandText = CommandName
                ' Handle the parameters
                If sqlParam IsNot Nothing Then
                    For Each param As ListItem In sqlParam
                        cmd.Parameters.Add(New SqlParameter(param.Text, param.Value))
                    Next
                End If
                Try
                    cmd.ExecuteNonQuery()
                Catch ex As Exception

                End Try

            End Using
        End Using
        Return Nothing

    End Function
    Public Function ReturnScalar(ByVal CommandName As String, CmdType As String, ByVal sqlParam As ListItemCollection) As Object
        CommandName = setSchema(CommandName)

        ' Open the connection
        Using cnn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("smartData").ConnectionString)
            cnn.Open()
            ' Define the command
            Using cmd As New SqlCommand
                cmd.Connection = cnn
                If CmdType = "Text" Then cmd.CommandType = CommandType.Text
                If CmdType = "Table" Then cmd.CommandType = CommandType.TableDirect
                If CmdType = "Proc" Then cmd.CommandType = CommandType.StoredProcedure
                cmd.CommandText = CommandName
                ' Handle the parameters
                Dim paramstr As String = Nothing
                If sqlParam IsNot Nothing Then
                    For Each param As ListItem In sqlParam
                        cmd.Parameters.Add(New SqlParameter(param.Text, param.Value))
                    Next

                End If

                Return cmd.ExecuteScalar

            End Using
        End Using

    End Function

    Public Function ReturnCurentUserCompanyId(UserName As String) As String
        Using cnn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("smartData").ConnectionString)
            cnn.Open()
            ' Define the command
            Using cmd As New SqlCommand
                cmd.Connection = cnn
                cmd.CommandType = CommandType.StoredProcedure
                cmd.CommandText = "[pbs].[usp_GetCurrentCompanyIdForUserName]"
                cmd.Parameters.Add(New SqlParameter("username", UserName))
                Try
                    Return cmd.ExecuteScalar
                Catch ex As Exception
                    Return Nothing
                End Try
            End Using
        End Using

    End Function

    Private Function setSchema(command As String) As String

        Dim newCmd As String = command
        Return newCmd


    End Function
    Private Sub encryptStart()
        Dim KEY_128 As Byte() = {42, 1, 52, 67, 231, 13, 94, 101, 123, 6, 0, 12, 32, 91, 4, 111, 31, 70, 21, 141, 123, 142, 234, 82, 95, 129, 187, 162, 12, 55, 98, 23}
        Dim IV_128 As Byte() = {234, 12, 52, 44, 214, 222, 200, 109, 2, 98, 45, 76, 88, 53, 23, 78}
        Dim symmetricKey As RijndaelManaged = New RijndaelManaged()
        symmetricKey.Mode = CipherMode.CBC

        Me.enc = New System.Text.UTF8Encoding
        Me.encryptor = symmetricKey.CreateEncryptor(KEY_128, IV_128)
        Me.decryptor = symmetricKey.CreateDecryptor(KEY_128, IV_128)
    End Sub
    Public Function Encrypt_Click(strEncrpyt As String) As String
        Dim sPlainText As String = strEncrpyt

        If Not String.IsNullOrEmpty(sPlainText) Then
            encryptStart()

            Dim memoryStream As MemoryStream = New MemoryStream()
            Dim cryptoStream As CryptoStream = New CryptoStream(memoryStream, Me.encryptor, CryptoStreamMode.Write)
            cryptoStream.Write(Me.enc.GetBytes(sPlainText), 0, sPlainText.Length)
            cryptoStream.FlushFinalBlock()
            Return Convert.ToBase64String(memoryStream.ToArray())
            memoryStream.Close()
            cryptoStream.Close()
        Else
            Return sPlainText
        End If
    End Function
    Public Function Decrypt_Click(strEncrypt As String) As String
        encryptStart()
        Dim cypherTextBytes As Byte() = Convert.FromBase64String(strEncrypt)
        Dim memoryStream As MemoryStream = New MemoryStream(cypherTextBytes)
        Dim cryptoStream As CryptoStream = New CryptoStream(memoryStream, Me.decryptor, CryptoStreamMode.Read)
        Dim plainTextBytes(cypherTextBytes.Length) As Byte
        Dim decryptedByteCount As Integer = cryptoStream.Read(plainTextBytes, 0, plainTextBytes.Length)
        memoryStream.Close()
        cryptoStream.Close()
        Return Me.enc.GetString(plainTextBytes, 0, decryptedByteCount)

    End Function
    Public Function SaveDocument(FileData As UploadedFile, FileDetails As DataTable) As String

        Dim buffer As Byte() = New Byte(FileData.ContentLength - 1) {}
        Using str As Stream = FileData.InputStream
            str.Read(buffer, 0, buffer.Length)
        End Using

        Using cnn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("smartData").ConnectionString)
            cnn.Open()
            ' Define the command
            Using cmd As New SqlCommand
                cmd.Connection = cnn
                cmd.CommandText = "spm.doc_InsertDocument"
                cmd.CommandType = CommandType.StoredProcedure

                Dim paramstr As String = Nothing
                cmd.Parameters.Add(New SqlParameter(“@FileData”, buffer))
                cmd.Parameters.Add(New SqlParameter(“@FileName”, FileData.FileName))
                cmd.Parameters.Add(New SqlParameter(“@FileContentType”, FileData.ContentType))
                cmd.Parameters.Add(New SqlParameter(“@KeyReference”, FileData.GetNameWithoutExtension))

                cmd.Parameters.Add(New SqlParameter(“@periodid”, FileDetails.Rows(0).Item("PeriodId")))
                cmd.Parameters.Add(New SqlParameter(“@SourceId”, FileDetails.Rows(0).Item("SourceId")))
                cmd.Parameters.Add(New SqlParameter(“@SourceType”, FileDetails.Rows(0).Item("SourceType")))
                cmd.Parameters.Add(New SqlParameter(“@DocumentName”, FileDetails.Rows(0).Item("DocumentName")))
                cmd.Parameters.Add(New SqlParameter(“@KeyType”, FileDetails.Rows(0).Item("KeyType")))
                cmd.Parameters.Add(New SqlParameter(“@KeyLabel”, FileDetails.Rows(0).Item("KeyLabel")))
                cmd.Parameters.Add(New SqlParameter(“@KeyDate”, FileDetails.Rows(0).Item("KeyDate")))
                cmd.Parameters.Add(New SqlParameter(“@KeyNotes”, FileDetails.Rows(0).Item("KeyNotes")))
                Try
                    cmd.ExecuteNonQuery()
                    Return "Loaded"
                Catch ex As Exception
                    Return "Failed - " & ex.Message
                End Try

            End Using
        End Using




    End Function
End Class
