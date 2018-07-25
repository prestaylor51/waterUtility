Attribute VB_Name = "DateSelector"

''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' SELECT DATE
'   Selects the date for date query
''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Sub selectDate()
    Dim ws As Worksheet: Set ws = Worksheets("PAUEngineerTemplate")
    
    ws.[testDate] = ws.[dateListbox]
    
End Sub
