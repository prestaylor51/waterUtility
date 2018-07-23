Attribute VB_Name = "EngineerQuerySuite"

''''''''''''''''''''''''''''''''''''''''''''''''''''''
' CONSTANTS
'   Constants to help make the utility make flexable
''''''''''''''''''''''''''''''''''''''''''''''''''''''
Public Const DATA_START_COL = 2
Public Const DATA_START_ROW = 21
Public Const SERVER_URL As String = "https://pump-assessment-utility.herokuapp.com/RetrievePumpData"
Public Const LOCALHOST As String = "http://localhost:3000/RetrievePumpData"

'An example of how to use the JSON from the database

' SERVER TEST
' This is a program to test communicating locally with
' the server for the water-utility
Sub retrievePumpData()
    'Set a string to hold the serverURL
    Dim serverURL As String
          
    'Create a worsheet to put the response in
    Dim ws As Worksheet: Set ws = Worksheets("PAUEngineerTemplate")
            
    'Get the data string
    Dim dataString As String
    
    dataString = buildDataString(ws)
    
    MsgBox dataString
    
    ' Add query params to GET req
    serverURL = SERVER_URL & dataString
    
    MsgBox serverURL
    
    'Create a new request and send it
    Dim httpReq As New WinHttpRequest
    httpReq.Open "GET", serverURL, False
                      'protocol, url, async
    httpReq.Send
    
    'Create var to hold response
    Dim strResp As String
    strResp = httpReq.ResponseText
    
    Range("O23") = strResp
    
    Call outputData(strResp)
        
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
    & "&pumpSerial=" & ws.[pumpSerial] _
    & "&testDate=" & ws.[testDate]
    
    buildDataString = dataString
    Exit Function
        
End Function

''''''''''''''''''''''''''''''''''''''''''''''''''
' JSON TO EXCEL
''''''''''''''''''''''''''''''''''''''''''''''''''
Sub outputData(jsonText As String)
    ' To hold the whole response
    Dim jsonObj As Object
    
    ' To hold each row in
    Dim row As Object
    
    ' An index
    Dim r As Long
    Dim c As Long
        
    ' A worksheet
    Dim ws As Worksheet
    
    Set ws = Worksheets("PAUEngineerTemplate")
    
    Set jsonObj = JsonConverter.ParseJson(jsonText)
    
    r = DATA_START_ROW
    c = DATA_START_COL
    
    ' Iterate through rows
    For Each row In jsonObj
        
        ws.Cells(r, c) = row("test_date")
        ws.Cells(r + 1, c) = row("speed_percent")
        ws.Cells(r + 3, c) = row("pmp_flg_psi")
        ws.Cells(r + 4, c) = row("header_psi")
        ws.Cells(r + 5, c) = row("dis_flow_mgd")
        ws.Cells(r + 6, c) = row("amps_1")
        ws.Cells(r + 7, c) = row("amps_2")
        ws.Cells(r + 8, c) = row("amps_3")
        ws.Cells(r + 9, c) = row("volts_1")
        ws.Cells(r + 10, c) = row("volts_2")
        ws.Cells(r + 11, c) = row("volts_3")
        
        c = c + 1
        
    Next
    
End Sub


























