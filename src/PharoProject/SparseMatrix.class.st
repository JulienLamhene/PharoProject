Class {
	#name : #SparseMatrix,
	#superclass : #Matrix,
	#instVars : [
		'elements'
	],
	#category : #PharoProject
}

{ #category : #accessing }
SparseMatrix >> atRow: row atCol: col [
	"This method return the value at row and col given"
	^ (self toClassicMatrix) atRow: row atCol: col.
]

{ #category : #accessing }
SparseMatrix >> atRow: row atCol: col put: elt [
	"This method put the element at row and col given"
	^ (elements at: row) at: col put: elt.
]

{ #category : #accessing }
SparseMatrix >> elements [
	^ elements.
]

{ #category : #accessing }
SparseMatrix >> elements: elts [
	elements := elts.
]

{ #category : #'instance creation' }
SparseMatrix >> initialize [
	super initialize.
	rows := 3.
	cols := 3.
	elements := Array new: rows.
	1 to: rows do: [:i |
 	   elements at: i put: (Array new: cols).
		1 to: cols do: [ :j | 
			(elements at: i) at: j put: 0 ]
	].
]

{ #category : #accessing }
SparseMatrix >> maxCol [
	^ (elements at: 2) max.
]

{ #category : #accessing }
SparseMatrix >> maxRow [
	^ elements first max.
]

{ #category : #'instance creation' }
SparseMatrix >> toClassicMatrix [
    "A method that converts the sparse matrix to a classic matrix"
    | classic numRows numCols |
    numRows := self maxRow. 
    numCols := self maxRow + 1.

  	 classic := MatrixClassic new rows: numRows cols:numCols.

    1 to: (self cols) do: [ :idx |
        | i j value |
        i := ((elements at: 1) at: idx).
        j := ((elements at: 2) at: idx).
        value := ((elements at: 3) at: idx).

        (classic elements at: i) at: j put: value.
    ].

    ^ classic
]

{ #category : #'instance creation' }
SparseMatrix >> toHollowMatrix [
	"A method who return the hollow version of our matrix"
	^ self.
]