Imports System
Imports Twilio
Imports Twilio.Rest.Api.V2010.Account

Public Class SendUtilities

    Public Sub SendText(ByVal args As String())

        Dim accountSid As String = "ACad6efa2552b6b2d3539b9805a03b73ec"
        Dim authToken As String = "34a85caf285090cc62972010434ea84c"



        TwilioClient.Init(accountSid, authToken)

        Dim message = MessageResource.Create(body:="Join Earth's mightiest heroes. Like Kevin Bacon.", from:=New Twilio.Types.PhoneNumber("+17192662519"), [to]:=New Twilio.Types.PhoneNumber("+16047898394"))
        Console.WriteLine(message.Sid)



    End Sub




End Class



