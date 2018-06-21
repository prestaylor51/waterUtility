VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "DBConnector"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True


'Class: DBConnector
Public Name As String

Private serverURL As String
Private wrkSheet As Worksheet
Private strResp As String

''''' PROPERTIES '''''
'GET SERVER URL
Public Property Get getServerURL() As String
    getServerURL = serverURL
End Property

'SET SERVER URL
Public Property Let setServerURL(url As String)
    serverURL = url
End Property

'GET WORKSHEET
Public Property Get getWorksheet() As Worksheet
    getWorksheet = wrkSheet
End Property

'SET WORKSHEET
Public Property Let setWorksheet(ws As Worksheet)
    wrkSheet = ws
End Property

