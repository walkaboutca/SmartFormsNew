Imports System
Imports System.Data
Imports System.IO
Imports System.Web

Public Class userInfo
    Dim _username As String
    Dim _userrole As String
    Dim _workingas As String
    Dim _rolecode As String

    Dim _companyid As String

    Dim _userdata As DataTable

    Public Property membername As String
        Get
            If IsNothing(_username) Then _username = System.Web.HttpContext.Current.User.Identity.Name
            Return _username
        End Get
        Set(ByVal value As String)
            _username = System.Web.HttpContext.Current.User.Identity.Name
        End Set
    End Property
    Public Property userdata As DataTable
        Get
            Dim dt As DataTable = bldtable()

            Dim username As String = Nothing
            Dim companyid As String = Nothing
            Dim companyname As String = Nothing

            If IsNothing(_username) Then
                username = System.Web.HttpContext.Current.User.Identity.Name

                Dim locals As New smartDataTableAdapters.LocalTA
                companyname = locals.ret_LastSelectedCompany(username)
                companyid = locals.ret_LastSelectedCompanyId(username)

            End If
            dt.Rows.Add(username, companyname, companyid)
            Return dt

        End Get
        Set(ByVal value As DataTable)
            _username = System.Web.HttpContext.Current.User.Identity.Name
        End Set
    End Property

    Private Function bldtable() As DataTable
        Dim dt As New DataTable
        dt.Columns.Add("UserName", GetType(String))
        dt.Columns.Add("CompanyName", GetType(String))
        dt.Columns.Add("CompanyId", GetType(String))
        Return dt
    End Function

    Private Function whatApp() As String
        Dim local As New smartDataTableAdapters.LocalTA
        Dim appname As String = local.ret_RegisterGlobal("globalAdmin", "globalApplication")
        Return appname
    End Function

    Public Property userrole() As String
        Get
            Dim ds As New smartSecurityTableAdapters.GlobalVarsTA
            _userrole = ds.ret_User_GetRoleFromUserName(System.Web.HttpContext.Current.User.Identity.Name)
            Return _userrole
        End Get
        Set(ByVal value As String)
            Dim ds As New smartSecurityTableAdapters.GlobalVarsTA
            _rolecode = ds.ret_User_GetRoleFromUserName(System.Web.HttpContext.Current.User.Identity.Name)
        End Set
    End Property


    'Public Property memberguid As String
    '    Get
    '        If IsNothing(_memberguid) Then _memberguid = ds.global_UserGuid(System.Web.HttpContext.Current.User.Identity.Name)
    '        Return _memberguid
    '    End Get
    '    Set(ByVal value As String)
    '        _memberguid = ds.global_UserGuid(System.Web.HttpContext.Current.User.Identity.Name)
    '    End Set
    'End Property
    'Public Property memberid As Integer
    '    Get
    '        If IsNothing(_memberid) Then _memberid = ds.global_UserId(System.Web.HttpContext.Current.User.Identity.Name, Nothing)
    '        Return _memberid
    '    End Get
    '    Set(ByVal value As Integer)
    '        _memberid = ds.global_UserId(System.Web.HttpContext.Current.User.Identity.Name, Nothing)
    '    End Set
    'End Property

    'Public Property userabbr As String
    '    Get
    '        If IsNothing(_userabbr) Then
    '            _userabbr = ds.local_UserAbbreviation(System.Web.HttpContext.Current.User.Identity.Name)
    '        End If
    '        Return _userabbr
    '    End Get
    '    Set(ByVal value As String)
    '        _userabbr = ds.local_UserAbbreviation(System.Web.HttpContext.Current.User.Identity.Name)
    '    End Set
    'End Property

    'Public Property useremail As String
    '    Get
    '        If IsNothing(_useremail) Then
    '            _useremail = ds.local_UserEmail(System.Web.HttpContext.Current.User.Identity.Name)
    '        End If
    '        Return _useremail
    '    End Get
    '    Set(ByVal value As String)
    '        _useremail = ds.local_UserEmail(System.Web.HttpContext.Current.User.Identity.Name)
    '    End Set
    'End Property



End Class
