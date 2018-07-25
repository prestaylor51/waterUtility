Attribute VB_Name = "testDateLoader"
''''''''''''''''''''''''''''''''''''''''''''''''''''
' CONSTANTS
'   Constants to help make the utility make flexable
''''''''''''''''''''''''''''''''''''''''''''''''''''''
Public Const SERVER_URL As String = "https://pump-assessment-utility.herokuapp.com/RetrieveTestDates"
Public Const LOCALHOST As String = "http://localhost:3000/RetrieveTestDates"
'

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' LOAD TEST DATES
'   Loads all possible test dates for the pump specified
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Sub loadTestDates()
    Dim serverURL As String
    Dim dataString As String
    Dim ws As Worksheet: Set ws = Worksheets("PAUEngineerTemplate")
    Dim respString As String

    dataString = buildDataString(ws)

    serverURL = SERVER_URL & dataString
    
    'MsgBox serverURL
    
    Dim httpReq As New WinHttpRequest
    httpReq.Open "GET", serverURL, False
                      'protocol, url, async
    httpReq.Send
    
    respString = httpReq.ResponseText
    
    'MsgBox respString
    
    Call populateListBox(respString, ws)
    
End Sub

''''''''''''''''''''''''''''''''''''''''''''''''''
' BUILD DATA STRING
''''''''''''''''''''''''''''''''''''''''''''''''''
Function buildDataString(ws As Worksheet) As String
    
    Dim dataString As String
    
    ' Build String
    dataString = "?pumpModel=" & ws.[pumpModel] _
    & "&pumpStation=" & ws.[pumpStation] _
    & "&pumpNumber=" & ws.[pumpNumber] _
    & "&pumpSerial=" & ws.[pumpSerial]
    
    buildDataString = dataString
    Exit Function
        
End Function

'''''''''''''''''''''''''''''''''''''''''''''''''''''
'   POPULATE LIST BOX
'''''''''''''''''''''''''''''''''''''''''''''''''''''
Sub populateListBox(respString As String, ws As Worksheet)
    
    Dim jsonObj As Object
    Dim row As Object
    
    Set jsonObj = JsonConverter.ParseJson(respString)
    
    ws.[dateListbox].RemoveAllItems
    
    For Each row In jsonObj
        ws.[dateListbox].AddItem row("test_date")
    Next
    
End Sub






















