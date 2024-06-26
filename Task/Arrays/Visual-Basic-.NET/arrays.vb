'Example of array of 10 int types:
Dim numbers As Integer() = New Integer(9) {}
'Example of array of 4 string types:
Dim words As String() = {"hello", "world", "from", "mars"}
'You can also declare the size of the array and initialize the values at the same time:
Dim more_numbers As Integer() = New Integer(2) {21, 14, 63}

'For Multi-Dimensional arrays you declare them the same except for a comma in the type declaration.
'The following creates a 3x2 int matrix
Dim number_matrix As Integer(,) = New Integer(2, 1) {}


'As with the previous examples you can also initialize the values of the array, the only difference being each row in the matrix must be enclosed in its own braces.
Dim string_matrix As String(,) = {{"I", "swam"}, {"in", "the"}, {"freezing", "water"}}
'or
Dim funny_matrix As String(,) = New String(1, 1) {{"clowns", "are"}, {"not", "funny"}}

Dim array As Integer() = New Integer(9) {}
array(0) = 1
array(1) = 3
Console.WriteLine(array(0))


'Dynamic
Imports System
Imports System.Collections.Generic
Dim list As New List(Of Integer)()
list.Add(1)
list.Add(3)
list(0) = 2
Console.WriteLine(list(0))
