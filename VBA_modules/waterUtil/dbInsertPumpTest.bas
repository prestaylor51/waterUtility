Attribute VB_Name = "dbInsertPumpTest"
''''''''''''''''''''''''''''''''''''''''''''''''''''''
' CONSTANTS
'   Constants to help make the utility make flexable
''''''''''''''''''''''''''''''''''''''''''''''''''''''
Public Const DATA_START_COL = 2
Public Const DATA_START_ROW = 22
Public Const SERVER_URL As String = "https://pump-assessment-utility.herokuapp.com/InsertPumpTest"
Public Const LOCALHOST As String = "http://localhost:3000/InsertPumpTest"
'

'''''''''''''''''''''''''''''''''''''''''''''''''''''''
' INSERT PUMP TEST
'   This is a program to test communicating locally with
'   the server for the water-utility
'''''''''''''''''''''''''''''''''''''''''''''''''''''''
Sub insertPumpTest()

    ' Create Variables
    Dim ws As Worksheet: Set ws = Worksheets("PAUTestEntry")    'Set worksheet
    Dim dataString As String: dataString = ""                   'Initialize data string
    Dim failedTests As String                                   'Which inserts failed?
    
    Dim i As Integer
    
    ' Make INSERTs one by one
    For i = 0 To 4
        
        dataString = formPumpTestData(ws, i)
        
        ' Create a new request and send it
        Dim httpReq As New WinHttpRequest
        httpReq.Open "POST", LOCALHOST, False
                          'protocol, url, async
        httpReq.SetRequestHeader "Content-type", "application/x-www-form-urlencoded"
        httpReq.Send dataString
        
        'MsgBox dataString
        
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
     
    ' Print Failed Tests
    Range("M27") = failedTests
        
End Sub

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' FORM PUMP TEST DATA
'   Constructs the query string that is sent to the server.
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Function formPumpTestData(ws As Worksheet, testNumber As Integer) As String
    ' String to hold pump test data
    Dim dataString As String
    
    ' Form string
    dataString = "pumpModel=" & CStr(ws.[pumpModel]) _
    & "&pumpStation=" & CStr(ws.[stationNumber]) _
    & "&pumpNumber=" & CStr(ws.[pumpNumber]) _
    & "&pumpSerial=" & CStr(ws.[pumpSerial]) _
    & "&testNumber=" & CStr(testNumber + 1) _
    & "&testDate=" & CStr(ws.[testDate]) _
    & "&percentSpeed=" & CStr(ws.Cells(DATA_START_ROW, DATA_START_COL + testNumber)) _
    & "&resLevel=" & CStr(ws.Cells(DATA_START_ROW + 1, DATA_START_COL + testNumber)) _
    & "&pumpFlagPsi=" & CStr(ws.Cells(DATA_START_ROW + 2, DATA_START_COL + testNumber)) _
    & "&headerPsi=" & CStr(ws.Cells(DATA_START_ROW + 3, DATA_START_COL + testNumber)) _
    & "&dischargeFlow=" & CStr(ws.Cells(DATA_START_ROW + 4, DATA_START_COL + testNumber)) _
    & "&amps1=" & CStr(ws.Cells(DATA_START_ROW + 5, DATA_START_COL + testNumber)) _
    & "&amps2=" & CStr(ws.Cells(DATA_START_ROW + 6, DATA_START_COL + testNumber)) _
    & "&amps3=" & CStr(ws.Cells(DATA_START_ROW + 7, DATA_START_COL + testNumber)) _
    & "&volts1=" & CStr(ws.Cells(DATA_START_ROW + 8, DATA_START_COL + testNumber)) _
    & "&volts2=" & CStr(ws.Cells(DATA_START_ROW + 9, DATA_START_COL + testNumber)) _
    & "&volts3=" & CStr(ws.Cells(DATA_START_ROW + 10, DATA_START_COL + testNumber))
    
    MsgBox dataString
    
    formPumpTestData = dataString
    Exit Function
      
End Function



























