Imports System
Imports Twilio
Imports Twilio.Rest.Api.V2010.Account

Public Class SendUtilities

    Public Sub SendText(ByVal args As String())

        Dim accountSid As String = "ACad6efa2552b6b2d3539b9805a03b73ec"
        Dim authToken As String = "34a85caf285090cc62972010434ea84c"

        TwilioClient.Init(accountSid, authToken)

        Dim message = MessageResource.Create(body:="Click Link to get your invtation https://smart.pbstools.net/Mobile/Invitation.aspx?ref=987654321", from:=New Twilio.Types.PhoneNumber("+17192662519"), [to]:=New Twilio.Types.PhoneNumber("+16047898394"))
        Console.WriteLine(message.Sid)

    End Sub

    Public Sub SendNewUserConfirm(userid As String, subject As String, body As String)

        Dim accountSid As String = "ACad6efa2552b6b2d3539b9805a03b73ec"
        Dim authToken As String = "34a85caf285090cc62972010434ea84c"

        TwilioClient.Init(accountSid, authToken)

        '   Dim bodytxt As String = "body:=" & body & ", from:=New Twilio.Types.PhoneNumber(" + 17192662519"), [to]:=New Twilio.Types.PhoneNumber("+16047898394") "
        '   body:="Click Link to get your invtation https://smart.pbstools.net/Mobile/Invitation.aspx?ref=987654321", from:=New Twilio.Types.PhoneNumber("+17192662519"), [to]:=New Twilio.Types.PhoneNumber("+16047898394")
        Dim bodytxt As String = "body:=" & body
        '   & ", from:=New Twilio.Types.PhoneNumber(" + 17192662519"), [to]:=New Twilio.Types.PhoneNumber("+16047898394") "



        Dim message = MessageResource.Create(bodytxt)
        Console.WriteLine(message.Sid)


    End Sub



End Class



