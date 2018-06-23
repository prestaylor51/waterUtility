Attribute VB_Name = "dbInsertPumpTest"
''''''''''''''''''''''''''''''''''''''''''''''''''''''
' CONSTANTS
'   Constants to help make the utility make flaexable
''''''''''''''''''''''''''''''''''''''''''''''''''''''
Public Const DATA_START_COL = 2
Public Const DATA_START_ROW = 22
'

'''''''''''''''''''''''''''''''''''''''''''''''''''''''
' INSERT PUMP TEST
'   This is a program to test communicating locally with
'   the server for the water-utility
'''''''''''''''''''''''''''''''''''''''''''''''''''''''
Sub insertPumpTest()

    ' Create Variables
    Dim ws As Worksheet: Set ws = Worksheets("PAUTestEntry")    'Set worksheet
    Dim serverURL As String: serverURL = ws.[localhost]         'Set servel URL
    Dim dataString As String: dataString = ""                   'Initialize data string
    Dim failedTests As String                                   'Which inserts failed?
    
    Dim i As Integer
    
    ' Make INSERTs one by one
    For i = 0 To 0
        
        dataString = formPumpTestData(ws, i)
        
        ' Create a new request and send it
        Dim httpReq As New WinHttpRequest
        httpReq.Open "POST", serverURL, False
                          'protocol, url, async
        httpReq.SetRequestHeader "Content-type", "application/x-www-form-urlencoded"
        httpReq.Send dataString
        
        MsgBox dataString
        
        ' Create var to hold response
        Dim strResp As String
        strResp = httpReq.ResponseText
        
        ' Record failed tests
        If strResp = "FAILED" Then
            If failedTests <> "" Then
                failedTests = failedTests & ", "
            End If
            failedTests = failedTests & CStr(i)
            
        End If
    
    Next i
    
    ' For debugging
    Range("O24") = serverURL
    Range("O25") = strResp
    
    ' Print Failed Tests
    Range("M27") = failedTests
    
    'Call jsonToExcel(strResp, 24, 15)
        
End Sub

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' FORM PUMP TEST DATA
'   Constructs the query string that is sent to the server.
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Function formPumpTestData(ws As Worksheet, testNumber As Integer) As String
    ' String to hold pump test data
    Dim dataString As String
    
    ' Form string
    dataString = "pumpModel=" & CStr(ws.[pumpModel])
    dataString = dataString & "&pumpStation=" & CStr(ws.[stationNumber])
    dataString = dataString & "&pumpNumber=" & CStr(ws.[pumpNumber])
    dataString = dataString & "&pumpSerial=" & CStr(ws.[pumpSerial])
    dataString = dataString & "&testNumber=" & CStr(testNumber + 1)
    dataString = dataString & "&testDate=" & CStr(ws.[testDate])
    
    dataString = dataString & "&percentSpeed=" & CStr(ws.Cells(DATA_START_ROW, DATA_START_COL + testNumber))
    dataString = dataString & "&resLevel=" & CStr(ws.Cells(DATA_START_ROW + 1, DATA_START_COL + testNumber))
    dataString = dataString & "&pumpFlagPsi=" & CStr(ws.Cells(DATA_START_ROW + 2, DATA_START_COL + testNumber))
    dataString = dataString & "&headerPsi=" & CStr(ws.Cells(DATA_START_ROW + 3, DATA_START_COL + testNumber))
    dataString = dataString & "&dischargeFlow=" & CStr(ws.Cells(DATA_START_ROW + 4, DATA_START_COL + testNumber))
    dataString = dataString & "&amps1=" & CStr(ws.Cells(DATA_START_ROW + 5, DATA_START_COL + testNumber))
    dataString = dataString & "&amps2=" & CStr(ws.Cells(DATA_START_ROW + 6, DATA_START_COL + testNumber))
    dataString = dataString & "&amps3=" & CStr(ws.Cells(DATA_START_ROW + 7, DATA_START_COL + testNumber))
    dataString = dataString & "&volts1=" & CStr(ws.Cells(DATA_START_ROW + 8, DATA_START_COL + testNumber))
    dataString = dataString & "&volts2=" & CStr(ws.Cells(DATA_START_ROW + 9, DATA_START_COL + testNumber))
    dataString = dataString & "&volts3=" & CStr(ws.Cells(DATA_START_ROW + 10, DATA_START_COL + testNumber))
    
    formPumpTestData = dataString
    Exit Function
      
End Function

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' JSON TO EXCEL
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
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


























