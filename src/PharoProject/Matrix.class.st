Class {
	#name : #Matrix,
	#superclass : #Object,
	#instVars : [
		'matrix'
	],
	#category : #PharoProject
}

{ #category : #accessing }
Matrix >> atRow: row atCol: col [
	"This method return the value at row and col given"
	^ (matrix at: row) at: col.
]

{ #category : #accessing }
Matrix >> atRow: row atCol: col put: elt [
	"This method put the element at row and col given"
	^ (matrix at: row) at: col put: elt.
]

{ #category : #accessing }
Matrix >> countNoZeros [
	"A method to count in a matrix all element different of 0, a array is created
	by collection the wanted element based on the matrix, then collect the size of
	each subtables of array and summing them up"
	|array count|
	count := 0.
	array := matrix collect: [ :i | i select: [ :y | y ~= 0 ] ].
	count := array collect: #size.
	^ count sum.
]

{ #category : #initialization }
Matrix >> initialize [
	"A initialization of our matrix who create an imbrication of arrays of 5x5 each"
	super initialize.
	matrix := Array new: 5.
	1 to: 5 do: [:i | 
		matrix at: i put: (Array new: 5).
		1 to: 5 do: [ :j | 
			(matrix at: i) at: j put: 0 ]
	].
]

{ #category : #accessing }
Matrix >> matrix [
	"Getter of our matrix attribute"
	^ matrix
]

{ #category : #accessing }
Matrix >> matrix: aMatrix [
	"Setter of our matrix attribute"
	matrix := aMatrix
]

{ #category : #accessing }
Matrix >> numberCols [
	"Return the number of cols of our matrix by taking the first array and asking for his size"
	^ matrix first size.
]

{ #category : #accessing }
Matrix >> numberRows [
	"Return the number of rows, in our matrix there are as much row than there arrays"
	^ matrix size
]

{ #category : #'instance creation' }
Matrix >> rows: row cols: col [
"A instance creation method who permit to create a empty matrix based on the number
of row and cols given"
	matrix := Array new: row.
	1 to: row do: [:i |
 	   matrix at: i put: (Array new: col).
		1 to: col do: [ :j | 
			(matrix at: i) at: j put: 0 ]
	].
]

{ #category : #'instance creation' }
Matrix >> rows: row cols: col withAll: element [
	"A instance creation method who permit to create a matrix filled with the element given and 	based on the number of row and cols given"
	matrix := Array new: row.
	1 to: row do: [:i |
	    matrix at: i put: (Array new: col).
		1 to: col do: [ :j | 
			(matrix at: i) at: j put: element ]
	].
]

{ #category : #accessing }
Matrix >> size [
	"Return the number of elements in matrix, by collecting the size of every subarray and then 
	summing the result"
	| count |
	count := matrix collect: #size.
	^ count sum.
]

{ #category : #'instance creation' }
Matrix >> toHollowMatrix [
	"A method who return the hollow version of our matrix"
	|hollow noZeros idx m|
	m := Matrix new.
	m matrix: #((1 0 3) (0 5 6) (7 8 0)).
	idx := 1.
	noZeros := self countNoZeros.
	hollow := Matrix new rows: 3 cols: noZeros.
	1 to: (self numberRows) do: [:i |
		 1 to: (self numberCols) do: [ :j | 
			(self atRow: i atCol: j) ~= 0
				ifTrue: [ 
					hollow atRow: 1 atCol: idx put: i-1.
					hollow atRow: 2 atCol: idx put: j-1.
					hollow atRow: 3 atCol: idx put: (self atRow: i atCol: j ).
					idx := idx + 1
				]
		]
	].
	^ hollow
]
