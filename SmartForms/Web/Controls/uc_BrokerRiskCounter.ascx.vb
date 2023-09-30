Imports Telerik.Web.UI

Public Class uc_BrokerRiskCounter
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim wwidth As Integer = Session("globalClientWidth")
        Dim wheight As Integer = Session("globalClientHeight")

        If Not Page.IsPostBack Then
            Dim ds As New smartDataTableAdapters.searchAuditReviewTA
            Dim dt As DataTable = ds.GetAuditSummary

            Dim low As RadLabel = rbSummary_Low.FindControl("rlSummary_Low")
            Dim med As RadLabel = rbSummary_Med.FindControl("rlSummary_med")
            Dim high As RadLabel = rbSummary_High.FindControl("rlSummary_high")

            For Each row As DataRow In dt.Rows
                If row.Item("RiskAssessment") = "Low" Then low.Text = row.Item("Summary")
                If row.Item("RiskAssessment") = "Medium" Then med.Text = row.Item("Summary")
                If row.Item("RiskAssessment") = "High" Then high.Text = row.Item("Summary")
            Next

            rbSummary_High.BackColor = System.Drawing.Color.Silver
            odsFiles.FilterExpression = "[RiskAssessment]='High'"

            reEditor.Height = wheight * 0.25
            RadEditor1.Height = wheight * 0.25


        End If


    End Sub

    Protected Sub rbSummary_Low_Click(sender As Object, e As EventArgs) Handles rbSummary_Low.Click

        rbSummary_High.BackColor = Nothing
        rbSummary_Med.BackColor = Nothing

        rbSummary_Low.BackColor = System.Drawing.Color.Silver
        odsFiles.FilterExpression = "[RiskAssessment]='Low'"
        rgvCurrentFiles.Rebind()



    End Sub

    Protected Sub rbSummary_Med_Click(sender As Object, e As EventArgs) Handles rbSummary_Med.Click

        rbSummary_High.BackColor = Nothing
        rbSummary_Low.BackColor = Nothing

        rbSummary_Med.BackColor = System.Drawing.Color.Silver
        odsFiles.FilterExpression = "[RiskAssessment]='Medium'"
        rgvCurrentFiles.Rebind()
    End Sub

    Protected Sub rbSummary_High_Click(sender As Object, e As EventArgs) Handles rbSummary_High.Click
        rbSummary_Low.BackColor = Nothing
        rbSummary_Med.BackColor = Nothing

        rbSummary_High.BackColor = System.Drawing.Color.Silver
        odsFiles.FilterExpression = "[RiskAssessment]='High'"
        rgvCurrentFiles.Rebind()
    End Sub

    Private Sub rgvCurrentFiles_PreRender(sender As Object, e As EventArgs) Handles rgvCurrentFiles.PreRender
        rgvCurrentFiles.MasterTableView.Font.Size = FontUnit.Small
    End Sub
End Class