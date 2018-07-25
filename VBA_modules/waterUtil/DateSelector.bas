Attribute VB_Name = "DateSelector"

''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' SELECT DATE
'   Selects the date for date query
''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Sub selectDate()
    Dim ws As Worksheet: Set ws = Worksheets("PAUEngineerTemplate")
    
    For i = 1 To ws.[dateListbox].ListCount
    
        If ws.[dateListbox].Selected(i) = True Then
        
            ws.[testDate] = ws.[dateListbox].List(i)
           
        End If
        
    Next i
    
End Sub
