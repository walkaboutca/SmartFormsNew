Imports System.Data.SqlClient
Imports Telerik.Web.UI

Public Class uc_BrokerRiskCounter
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim wwidth As Integer = Session("globalClientWidth")
        Dim wheight As Integer = Session("globalClientHeight")

        If Not Page.IsPostBack Then

            updateHeader("High")

            reSearchNotes.Height = wheight * 0.25
            reOfficeNotes.Height = wheight * 0.25
            rgvFiltered.Height = wheight * 0.5

        End If

    End Sub
    Private Sub uc_BrokerRiskCounter_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender


    End Sub
    Private Sub updateHeader(whatdefault As String)
        rbSummary_High.BackColor = Nothing
        rbSummary_Med.BackColor = Nothing
        rbSummary_Low.BackColor = Nothing

        Dim low As RadLabel = rbSummary_Low.FindControl("rlSummary_Low")
        Dim med As RadLabel = rbSummary_Med.FindControl("rlSummary_Med")
        Dim high As RadLabel = rbSummary_High.FindControl("rlSummary_High")

        low.Text = Nothing
        med.Text = Nothing
        high.Text = Nothing

        Dim ds As New smartDataTableAdapters.searchAuditReviewTA
        Dim dt As DataTable = ds.GetAuditSummary

        For Each row As DataRow In dt.Rows
            If row.Item("RiskAssessment") = "Low" Then low.Text = row.Item("Summary")
            If row.Item("RiskAssessment") = "Medium" Then med.Text = row.Item("Summary")
            If row.Item("RiskAssessment") = "High" Then high.Text = row.Item("Summary")
        Next
        If whatdefault = "Low" Then
            rbSummary_Low.BackColor = System.Drawing.Color.Silver
            hfRiskFilter.Value = "Low"
            rbSummary_Low_Click(Nothing, Nothing)

        End If
        If whatdefault = "Medium" Then
            rbSummary_Med.BackColor = System.Drawing.Color.Silver
            hfRiskFilter.Value = "Medium"
            rbSummary_Med_Click(Nothing, Nothing)
        End If
        If whatdefault = "High" Then
            rbSummary_High.BackColor = System.Drawing.Color.Silver
            hfRiskFilter.Value = "High"
            rbSummary_High_Click(Nothing, Nothing)
        End If


    End Sub

    Protected Sub rbSummary_Low_Click(sender As Object, e As EventArgs) Handles rbSummary_Low.Click
        rbSummary_High.BackColor = Nothing
        rbSummary_Med.BackColor = Nothing
        rbSummary_Low.BackColor = System.Drawing.Color.Silver
        hfRiskFilter.Value = "Low"
        rgvFiltered.Rebind()


    End Sub

    Protected Sub rbSummary_Med_Click(sender As Object, e As EventArgs) Handles rbSummary_Med.Click
        rbSummary_High.BackColor = Nothing
        rbSummary_Low.BackColor = Nothing
        rbSummary_Med.BackColor = System.Drawing.Color.Silver
        hfRiskFilter.Value = "Medium"
        rgvFiltered.Rebind()

    End Sub

    Protected Sub rbSummary_High_Click(sender As Object, e As EventArgs) Handles rbSummary_High.Click
        rbSummary_Low.BackColor = Nothing
        rbSummary_Med.BackColor = Nothing
        rbSummary_High.BackColor = System.Drawing.Color.Silver
        hfRiskFilter.Value = "High"
        rgvFiltered.Rebind()

    End Sub

    Private Sub rgvFiltered_PreRender(sender As Object, e As EventArgs) Handles rgvFiltered.PreRender
        rgvFiltered.MasterTableView.Font.Size = FontUnit.Small


    End Sub

    Private Sub rgvFiltered_SelectedIndexChanged(sender As Object, e As EventArgs) Handles rgvFiltered.SelectedIndexChanged

        Dim item As GridDataItem = DirectCast(rgvFiltered.SelectedItems(0), GridDataItem)
        Dim formid = item.GetDataKeyValue("FormId")

        rlbAssignRisk.SelectedValue = item.GetDataKeyValue("NewRiskAssessment")

        Dim ds As New smartDataTableAdapters.searchAuditFilesTA
        Dim dt As DataTable = ds.GetSearchAudit(formid)

        reSearchNotes.Content = dt.Rows(0).Item("SearchNotes")
        reOfficeNotes.Content = dt.Rows(0).Item("AuditNotes")

    End Sub

    Private Sub rgvFiltered_ItemCommand(sender As Object, e As GridCommandEventArgs) Handles rgvFiltered.ItemCommand
        If e.CommandName = "Edit" Then

            'Dim item As GridDataItem = DirectCast(rgvFiltered.SelectedItems(0), GridDataItem)
            'Dim formid = item.GetDataKeyValue("FormId")

            'window_form.Title = "Risk Form Viewer"
            'window_form.AutoSize = False
            'window_form.KeepInScreenBounds = True

            'window_form.Behaviors = WindowBehaviors.Move Or WindowBehaviors.Resize Or WindowBehaviors.Close
            'window_form.Height = Unit.Pixel(Session("globalClientHeight") * 0.6)
            'window_form.Width = Unit.Pixel(Session("globalClientWidth") * 0.4)

            'window_form.VisibleStatusbar = False
            'Dim urlargs As String = Nothing
            'window_form.NavigateUrl = "~/Web/PopupViewer.aspx" & urlargs

            'Dim script As String = "function f(){$find(""" + window_form.ClientID + """).show(); Sys.Application.remove_load(f);}Sys.Application.add_load(f);"
            'ScriptManager.RegisterStartupScript(Page, Page.GetType(), "key", script, True)


        End If


    End Sub

    Private Sub rlbAssignRisk_SelectedIndexChanged(sender As Object, e As EventArgs) Handles rlbAssignRisk.SelectedIndexChanged
        If rgvFiltered.SelectedItems.Count > 0 Then
            Dim ds As New smartDataTableAdapters.searchAuditFilesTA
            Dim item As GridDataItem = DirectCast(rgvFiltered.SelectedItems(0), GridDataItem)
            Dim formid = item.GetDataKeyValue("FormId")
            If Not IsNothing(formid) Then
                Try
                    ds.upd_NewRiskAssessment(rlbAssignRisk.SelectedValue, Context.User.Identity.Name, Now, formid)
                Catch ex As SqlException

                End Try
                rgvFiltered.Rebind()
                updateHeader(rlbAssignRisk.SelectedValue)
                notice_Popup.Text = "Any change on Risk Analysis should be annoted with a Compliance Officer note describing why"
                notice_Popup.Show()

            End If
        Else
            notice_Popup.Text = "You have to select a Form (click on it) to apply a Risk Analysis modification."
            notice_Popup.Show()

        End If
    End Sub


End Class