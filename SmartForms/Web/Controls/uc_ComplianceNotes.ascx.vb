Imports Microsoft.AspNet.Identity

Public Class uc_ComplianceNotes
    Inherits System.Web.UI.UserControl
    Public Property WhatForm As String
        Get
            Return hfWhatForm.Value
        End Get
        Set(ByVal value As String)
            hfWhatForm.Value = value
        End Set
    End Property
    Public Property WhatControl As String
        Get
            Return hfWhatControl.Value
        End Get
        Set(ByVal value As String)
            hfWhatControl.Value = value
        End Set
    End Property
    Public Property NoteHeight As Integer
        Get
            Return hfNoteHeight.Value
        End Get
        Set(ByVal value As Integer)
            hfNoteHeight.Value = value
        End Set
    End Property


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub uc_ComplianceNotes_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender

        Dim whatform As String = hfWhatForm.Value
        Dim whatcontrol As String = hfWhatControl.Value
        Dim noteheight As Integer = hfNoteHeight.Value

        reEditor.Height = noteheight - 230

        If Context.User.Identity.IsAuthenticated Then
            lbEditor.Visible = True
            reEditor.EditModes = Telerik.Web.UI.EditModes.Design
        Else
            lbEditor.Visible = False
            reEditor.EditModes = Telerik.Web.UI.EditModes.Preview
        End If


        Dim ds As New smartDataTableAdapters.notes_ControlsTA
        Dim content As String = ds.retControlNote(whatcontrol, whatform)
        reEditor.Content = content




    End Sub

    Protected Sub lbEditor_Click(sender As Object, e As EventArgs) Handles lbEditor.Click

        Dim ds As New smartDataTableAdapters.notes_ControlsTA
        Try
            ds.UpdControlNote(reEditor.Content, hfWhatControl.Value, hfWhatForm.Value)

        Catch ex As Exception

        End Try

    End Sub
End Class