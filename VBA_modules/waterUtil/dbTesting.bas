Attribute VB_Name = "dbTesting"

'An example of how to use the JSON from the database

' SERVER TEST
' This is a program to test communicating locally with
' the server for the water-utility
Sub main()
    'Set a string to hold the serverURL
    Dim serverURL As String
          
    'Create a worsheet to put the response in
    Dim ws As Worksheet: Set ws = Worksheets("serverTest")
    
    'Set the URL to
    serverURL = ws.[serverURL]
    
    'Create a new request and send it
    Dim httpReq As New WinHttpRequest
    httpReq.Open "GET", serverURL, False
                      'protocol, url, async
    httpReq.Send
    
    'Create var to hold response
    Dim strResp As String
    strResp = httpReq.ResponseText
    
    Range("B3") = strResp
    
    Call jsonToExcel(strResp, 5, 1)
        
End Sub


Sub jsonToExcel(jsonText As String, rowStart As Long, colStart As Long)
    ' To hold the whole response
    Dim jsonObj As Object
    
    ' To hold each row in
    Dim row As Object, item As Variant
    
    ' An index
    Dim r As Long
    Dim c As Long
        
    ' A worksheet
    Dim ws As Worksheet
    
    Set ws = Worksheets("serverTest")
    
    Set jsonObj = JsonConverter.ParseJson(jsonText)
    
    r = rowStart
    c = colStart
    
    ws.Cells(r, 1) = "model"
    ws.Cells(r, 2) = "motor hp"
    ws.Cells(r, 3) = "stages"
    ws.Cells(r, 4) = "voltage"
    
    r = r + 1
    
    ' Iterate through rows
    For Each row In jsonObj
        
        ws.Cells(r, c + 0) = row("stages")
        ws.Cells(r, c + 1) = row("motor_hp")
        ws.Cells(r, c + 2) = row("stages")
        ws.Cells(r, c + 3) = row("voltage")
                                        
        'r = r + 1
        
        'For Each item In row
          '  ws.Cells(10, 5) = item.Value
       ' Next
        
    Next
    
End Sub


























