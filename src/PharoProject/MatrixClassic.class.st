Class {
	#name : #MatrixClassic,
	#superclass : #Matrix,
	#instVars : [
		'elements'
	],
	#category : #PharoProject
}

{ #category : #accessing }
MatrixClassic >> + aClassicMatrix [
	"This method addition the value of two matrix"
	| res |
	res := MatrixClassic new rows: rows cols: cols.
	1 to: rows do: [ :r | 
		1 to: cols do: [ :c | 
			|added|
			added := (self atRow: r atCol: c ) + (aClassicMatrix atRow: r atCol: c ).
			res atRow: r atCol: c put: added.
			].
		].
	^ res
]

{ #category : #accessing }
MatrixClassic >> - aClassicMatrix [
	"Addition two matrix"
	| res |
	res := MatrixClassic new rows: rows cols: cols.
	1 to: rows do: [ :r | 
		1 to: cols do: [ :c | 
			|added|
			added := (self atRow: r atCol: c ) - (aClassicMatrix atRow: r atCol: c ).
			res atRow: r atCol: c put: added.
			].
		].
	^ res
]

{ #category : #accessing }
MatrixClassic >> atRow: row atCol: col [
	"This method return the value at row and col given"
	^ (elements at: row) at: col.
]

{ #category : #accessing }
MatrixClassic >> atRow: row atCol: col put: elt [
	"This method put the element at row and col given"
	^ (elements at: row) at: col put: elt.
]

{ #category : #accessing }
MatrixClassic >> countNoZeros [
	"A method to count in a matrix all element different of 0, a array is created by collection the wanted element based on the matrix, then collect the size of each subtables of array and summing them up"
	|array count|
	count := 0.
	array := elements collect: [ :i | i select: [ :y | y ~= 0 ] ].
	count := array collect: #size.
	^ count sum.
]

{ #category : #accessing }
MatrixClassic >> elements [
	^ elements.
]

{ #category : #accessing }
MatrixClassic >> elements: elts [
	elements := elts.
	rows := elts size.
	cols := elts first size.
]

{ #category : #initialization }
MatrixClassic >> initialize [
	super initialize.
	rows := 3.
	cols := 3.
	elements := Array new: rows.
	1 to: rows do: [ :row |
		elements at: row put: (Array new: cols).
		1 to: cols do: [ :col | 
			(elements at: row) at: col put: 0.
		]
	].
]

{ #category : #accessing }
MatrixClassic >> rows: row cols: col [
	"A instance creation method who permit to create a empty matrix based on the number of row and cols given"
	rows := row.
	cols := col.
	elements := Array new: row.
	1 to: row do: [:i |
 	   elements at: i put: (Array new: col).
		1 to: col do: [ :j | 
			(elements at: i) at: j put: 0 ]
	].
]

{ #category : #'instance creation' }
MatrixClassic >> toClassicMatrix [
    "A method that converts the sparse matrix to a classic matrix"
    ^ self.
]

{ #category : #'instance creation' }
MatrixClassic >> toSparseMatrix [
	"A method who return the hollow version of our matrix"
	|hollow noZeros idx|
	idx := 1.
	noZeros := self countNoZeros.
	hollow := SparseMatrix new rows: 3 cols: noZeros.
	1 to: (rows) do: [:i |
		 1 to: (cols) do: [ :j | 
			(self atRow: i atCol: j) ~= 0
				ifTrue: [
					(hollow elements at: 1) at: idx put: i.
					(hollow elements at: 2) at: idx put: j.
					(hollow elements at: 3) at: idx put: (self atRow: i atCol: j).
					idx := idx + 1
				]
		]
	].
	^ hollow
]
