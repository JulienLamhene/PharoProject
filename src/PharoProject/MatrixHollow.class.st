Class {
	#name : #MatrixHollow,
	#superclass : #Matrix,
	#category : #PharoProject
}

{ #category : #'instance creation' }
MatrixHollow >> toClassicMatrix [
    "A method that converts the sparse matrix to a classic matrix"
    | classic numRows numCols |
    numRows := (self numberRows) + 1. 
    numCols := (self numberCols) - 1. 

  	 classic := MatrixClassic new rows: numRows cols:numCols.

    1 to: (self numberCols) do: [ :idx |
        | i j value |
        i := (self atRow: 1 atCol: idx) + 1.
        j := (self atRow: 2 atCol: idx) + 1.
        value := self atRow: 3 atCol: idx.

        classic atRow: i atCol: j put: value.
    ].

    ^ classic
]
