Attribute VB_Name = "dbInsertPumpTest"

'An example of how to use the JSON from the database

' SERVER TEST
' This is a program to test communicating locally with
' the server for the water-utility
Sub makeDbInsert()
    'Set a string to hold the serverURL
    Dim serverURL As String
    
    'An array to hold the query data
   ' Dim queryArray(1 to )
    
    'Create a worsheet to put the response in
    Dim ws As Worksheet: Set ws = Worksheets("PAUTestEntry")
    
    'Set the URL to
    serverURL = ws.[localhost]
   ' serverURL = serverURL & "?testValue=test"
    
    Range("O24") = serverURL
    
    'Form query string
    
    
    'Create a new request and send it
    Dim httpReq As New WinHttpRequest
    httpReq.Open "POST", serverURL, False
                      'protocol, url, async
    'httpReq.SetRequestHeader "Content-type", "application/x-www-form-urlencoded"
    httpReq.Send "testVar=testvalue"
    
    'Create var to hold response
    Dim strResp As String
    strResp = httpReq.ResponseText
    
    Range("O25") = strResp
    
    'Call jsonToExcel(strResp, 24, 15)
        
End Sub

' FORM PUMP TEST DATA
'   Constructs the query string that is sent to the server.
Function formPumpTestData(col As Long) As String
    ' String to hold pump test data
    Dim dataString As String
    
    ' String for date
    Dim TESTDATE As String: TESTDATE = Range(17, 2)
    
    ' Build the data string
    
    

' JSON TO EXCEL
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


























