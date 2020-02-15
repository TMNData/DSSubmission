Attribute VB_Name = "Module1"
Sub StockData()
    
    For Each ws In Worksheets
        
        ' Set an initial variable for ticker name
        
        Dim Ticker  As String
        
        ' Set an initial variable for holding the total Stock Volume per ticker
        
        Dim StockVolume As Double
        
        StockVolume = 0
        
        ' Keep track of the location for each stock in the summary table
        
        Dim Summary_Table_Row As Integer
        
        Summary_Table_Row = 2
        
        Dim YearlyChange As Double
        
        Dim PercentChange As Double
                
        OpenValue = 0
                      
        startrow = 2
                       
        NextOpenValue = 0
        
        ' get the last raw value to iterate through last ticker
        
        lastRow = ws.Cells(Rows.Count, 1).End(xlUp).Row
              
        ' Loop through all Stocke ticker till last raw
        
        
        For i = 2 To lastRow
            
            ' Check if we are still within the same ticker, if it is not...
            
            If ws.Cells(i + 1, 1).Value <> ws.Cells(i, 1).Value Then
            
            'Defining variable and inintial value for capturing first and next open value
                
                If OpenValue = 0 Then
                    startrow = 2
                    NextOpenValue = i + 1
                    OpenValue = ws.Cells(2, 3)
                    
                Else
                    startrow = NextOpenValue
                    OpenValue = ws.Cells(startrow, 3)
                    NextOpenValue = i + 1
                End If
                
                ' Set the Ticker
                Ticker = ws.Cells(i, 1).Value
                
                ' Add to theTotal volume
                StockVolume = StockVolume + ws.Cells(i, 7).Value
                
                '   Calculate Yearly change
                
                YearlyChange = OpenValue - ws.Cells(i, 6)
                ' Calculate total percent change change
                
                If YearlyChange = 0 Then
                    PercentChange = 0
                Else
                    PercentChange = YearlyChange / ws.Cells(i, 3)
                End If
                
                ' Print the Stock TIcker in the Summary Table
                
                ws.Range("i" & Summary_Table_Row).Value = Ticker
                
                ' Print the Total Stock Volume to the Summary Table
                
                ws.Range("L" & Summary_Table_Row).Value = StockVolume
                
                ' Print Yearly change  in summary table --------------------
                
                ws.Range("J" & Summary_Table_Row).Value = YearlyChange
                
                If ws.Range("J" & Summary_Table_Row) < 0 Then
                    
                    ws.Range("J" & Summary_Table_Row).Interior.ColorIndex = 3
                    
                Else
                    
                    ws.Range("J" & Summary_Table_Row).Interior.ColorIndex = 4
                    
                End If
                
                ' Print percent change  in summaru table --------------------
                
                ws.Range("K" & Summary_Table_Row).Value = PercentChange
                
                ws.Range("K" & Summary_Table_Row).Style = "Percent"
                
                ' Add one to the summary table row for next ticker summary
                
                Summary_Table_Row = Summary_Table_Row + 1
                
                ' Reset the Stock Volume
                
                StockVolume = 0
                
                ' If the ticker in next row is same
                
            Else
                
                ' Add to the Brand Total
                
                StockVolume = StockVolume + ws.Cells(i, 7).Value
                
            End If
            
        Next i
        
        ws.Range("I1").Value = "Ticker"
        ws.Range("J1").Value = "Yearly Change"
        ws.Range("K1").Value = "Percentage Change"
        ws.Range("L1").Value = "Total Stock Volume"
        
        ws.Range("N2").Value = "Greatest % increase"
        
        Dim rng     As Range
        Dim dblMax  As Double
        
        'Set range from which to determine largest value-- search to get syntex
        
        Set rng = ws.Range("K2:K" & Summary_Table_Row - 1 & "")
        dblMax = Application.WorksheetFunction.Max(rng)
        dblMin = Application.WorksheetFunction.Min(rng)
        
        'Displays largest value
                
        ws.Range("O2").Value = dblMax
        ws.Range("N3").Value = "Greatest % Decrease"
        ws.Range("O3").Value = dblMin
        ws.Range("N4").Value = "Greatest total volume"
        Set rng2 = ws.Range("L2:L" & Summary_Table_Row - 1 & "")
        dblMax2 = Application.WorksheetFunction.Max(rng2)
        ws.Range("O4").Value = dblMax2
        
    Next ws
    
End Sub

