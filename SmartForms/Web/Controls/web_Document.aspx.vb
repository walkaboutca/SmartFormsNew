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

Public Class web_Document
    Inherits System.Web.UI.Page
    Const MaxTotalBytes As Integer = 1048576
    Private totalBytes As Long
    Dim pdftools As New PDFManager

    Private pdfTargetDoc As PdfDocument
    Private pdfTargetForm As PdfAcroForm
    Private pdfTargetfields As IDictionary(Of String, PdfFormField)

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then
            AddStep("uc_IIF_StepVerification")
            'AddStep("Flight")
            'AddStep("Passengers")
            'AddStep("Payment")
        End If
        rwDisplay.ActiveStepIndex = 0

    End Sub

    'Protected Sub rbSave_Click(sender As Object, e As EventArgs) Handles rbSave.Click

    '    Dim script As String = "window.onload = function() { closeWin(); };"
    '    ClientScript.RegisterStartupScript(Me.GetType(), "closeWin", script, True)

    'End Sub

    'Protected Sub rbClose_Click(sender As Object, e As EventArgs) Handles rbClose.Click

    '    Dim script As String = "window.onload = function() { closeWin(); };"
    '    ClientScript.RegisterStartupScript(Me.GetType(), "closeWin", script, True)

    'End Sub
    Private Sub AddStep(stepTitle As String)
        Dim [step] As New RadWizardStep()

        [step].ID = stepTitle
        Select Case [step].ID
            Case "uc_885326974_Step1"
                '[step].ActiveImageUrl = "images/1_active.png"
                '[step].ImageUrl = "images/1_normal.png"
                '[step].ValidationGroup = [step].ID + "Group"
                Exit Select
            Case "Flight"
                [step].ImageUrl = "images/2_normal.png"
                [step].ActiveImageUrl = "images/2_active.png"
                [step].DisabledImageUrl = "images/2_disable.png"
                [step].ValidationGroup = [step].ID + "Group"
                Exit Select
            Case "Passengers"
                [step].ImageUrl = "images/3_normal.png"
                [step].ActiveImageUrl = "images/3_active.png"
                [step].DisabledImageUrl = "images/3_disable.png"
                [step].ValidationGroup = [step].ID + "Group"
                Exit Select
            Case "Payment"
                [step].ImageUrl = "images/4_normal.png"
                [step].ActiveImageUrl = "images/4_active.png"
                [step].DisabledImageUrl = "images/4_disable.png"
                Exit Select
            Case Else
                Exit Select
        End Select

        rwDisplay.WizardSteps.Add([step])
    End Sub

    Protected Sub rwDisplay_WizardStepCreated(sender As Object, e As WizardStepCreatedEventArgs)

        '~/Web/Controls/wizard_885326974/uc_885326974_Step1.ascx

        Dim wizardStepContents As Control = LoadControl("~/Web/Controls/wizard_885326974/" & e.RadWizardStep.ID + ".ascx")
        wizardStepContents.ID = e.RadWizardStep.ID + "userControl"
        e.RadWizardStep.Controls.Add(wizardStepContents)
    End Sub

End Class