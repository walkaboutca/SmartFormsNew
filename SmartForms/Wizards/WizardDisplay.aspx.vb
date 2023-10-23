Imports Telerik.Web.UI

Public Class WizardDisplay
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        If Not Page.IsPostBack Then
            AddStep("uc_PropertyHeader")

        End If
        rwFintrac.ActiveStepIndex = 0


    End Sub
    Private Sub AddStep(stepTitle As String)
        Dim [step] As New RadWizardStep()

        [step].ID = stepTitle
        Select Case [step].ID
            Case "uc_PropertyHeader"
                '[step].ActiveImageUrl = "images/1_active.png"
                '[step].ImageUrl = "images/1_normal.png"
                '[step].ValidationGroup = [step].ID + "Group"
                Exit Select
                'Case "Flight"
                '    [step].ImageUrl = "images/2_normal.png"
                '    [step].ActiveImageUrl = "images/2_active.png"
                '    [step].DisabledImageUrl = "images/2_disable.png"
                '    [step].ValidationGroup = [step].ID + "Group"
                '    Exit Select
                'Case "Passengers"
                '    [step].ImageUrl = "images/3_normal.png"
                '    [step].ActiveImageUrl = "images/3_active.png"
                '    [step].DisabledImageUrl = "images/3_disable.png"
                '    [step].ValidationGroup = [step].ID + "Group"
                '    Exit Select
                'Case "Payment"
                '    [step].ImageUrl = "images/4_normal.png"
                '    [step].ActiveImageUrl = "images/4_active.png"
                '    [step].DisabledImageUrl = "images/4_disable.png"
                '    Exit Select
            Case Else
                Exit Select
        End Select

        rwFintrac.WizardSteps.Add([step])

    End Sub

    Protected Sub rwFintrac_WizardStepCreated(sender As Object, e As WizardStepCreatedEventArgs)

        Dim wizardStepContents As Control = LoadControl("Controls/" & e.RadWizardStep.ID + ".ascx")
        wizardStepContents.ID = e.RadWizardStep.ID + "userControl"
        e.RadWizardStep.Controls.Add(wizardStepContents)


    End Sub

    Private Sub rwFintrac_PreRender(sender As Object, e As EventArgs) Handles rwFintrac.PreRender

        rwFintrac.Height = (Session("globalClientHeight") * 0.75)

        GetAll(Me, GetType(RadSplitter)).ToList.ForEach(
            Sub(c)
                Dim ctrl As RadSplitter = c
                ctrl.Height = (Session("globalClientHeight") * 0.55)
            End Sub)


    End Sub
    Public Function GetAll(ByVal sender As Control, ByVal T As Type) As IEnumerable(Of Control)
        Dim controls = sender.Controls.Cast(Of Control)()
        Return controls.SelectMany(
            Function(ctrl) GetAll(ctrl, T)).Concat(controls).Where(
            Function(c) c.GetType() Is T)
    End Function

    Iterator Function allControls(c As Control) As IEnumerable(Of Control)
        Yield c
        For Each cc As Control In c.Controls
            For Each ccc In allControls(cc)
                Yield ccc
            Next
        Next
    End Function

End Class