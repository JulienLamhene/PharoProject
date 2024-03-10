Class {
	#name : #Matrix,
	#superclass : #Object,
	#instVars : [
		'rows',
		'cols'
	],
	#category : #PharoProject
}

{ #category : #accessing }
Matrix >> atRow: row atCol: col [
	"This method return the value at row and col given"
	^ self subclassResponsibility.
]

{ #category : #accessing }
Matrix >> atRow: row atCol: col put: elt [
	"This method put the element at row and col given"
	^ self subclassResponsibility.
]

{ #category : #accessing }
Matrix >> cols [
	"Return the number of cols"
	^ cols.
]

{ #category : #initialization }
Matrix >> initialize [
	"A initialization of our matrix who create an imbrication of arrays of 5x5 each"
	super initialize.
	rows := 0.
	cols := 0.
]

{ #category : #accessing }
Matrix >> rows [
	"Return the number of rows"
	^ rows.
]

{ #category : #'instance creation' }
Matrix >> rows: row cols: col [
	"A instance creation method who permit to create a empty matrix based on the number of row and cols given"
	rows := row.
	cols := col.
]

{ #category : #accessing }
Matrix >> size [
	"Return the number of elements in matrix, by collecting the size of every subarray and then summing the result"
	^ rows + cols.
]

{ #category : #'instance creation' }
Matrix >> toClassicMatrix [
    "A method that converts the sparse matrix to a classic matrix"
    ^ self subclassResponsibility.
]

{ #category : #'instance creation' }
Matrix >> toSparseMatrix [
	"A method who return the hollow version of our matrix"
	^ self subclassResponsibility
]
