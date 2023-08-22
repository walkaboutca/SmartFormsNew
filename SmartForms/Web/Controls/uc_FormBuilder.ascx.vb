Imports Telerik.Web.UI
Public Class uc_FormBuilder
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            hfFormHash.Value = Request.QueryString("hashcode")
            hfFormId.Value = Request.QueryString("FormId")
            'FillForm()

        Else

        End If
    End Sub
    Protected Sub SaveForm(sender As Object)

        Dim ds As New smartDataTableAdapters.data_FormFieldsTA

        For Each c In sender.parent.Controls
            If TypeName(c) = "RadTextBox" Then
                Dim label As String = CType(c, RadTextBox).UniqueID
                If CType(c, RadTextBox).Text <> "" Then
                    Dim textval As String = CType(c, RadTextBox).Text
                    ds.Insert(0, CType(c, RadTextBox).UniqueID, TypeName(c), CType(c, RadTextBox).Text, Now, Context.User.Identity.Name, Nothing, Nothing)
                End If
            End If
        Next
        For Each c In sender.parent.Controls
            If TypeName(c) = "RadDatePicker" Then
                Dim dp As RadDatePicker = CType(c, RadDatePicker)
                If Not IsNothing(dp.DbSelectedDate) Then
                    If dp.UniqueID = "rdpVerifiedDate" Then
                        ds.Insert(0, "txttodaysDated1_mmmm", TypeName(c) & "_mth", Month(dp.DbSelectedDate).ToString, Now, Context.User.Identity.Name, Nothing, Nothing)
                        ds.Insert(0, "txttodaysDated1_d", TypeName(c) & "_day", Day(dp.DbSelectedDate).ToString, Now, Context.User.Identity.Name, Nothing, Nothing)
                        ds.Insert(0, "txttodaysDated1_yyyy", TypeName(c) & "_year", Year(dp.DbSelectedDate).ToString, Now, Context.User.Identity.Name, Nothing, Nothing)
                    End If
                End If


            End If
        Next


    End Sub




End Class