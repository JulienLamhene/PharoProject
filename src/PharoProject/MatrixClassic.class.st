Class {
	#name : #MatrixClassic,
	#superclass : #Matrix,
	#category : #PharoProject
}

{ #category : #'instance creation' }
MatrixClassic >> toHollowMatrix [
	"A method who return the hollow version of our matrix"
	|hollow noZeros idx|
	idx := 1.
	noZeros := self countNoZeros.
	hollow := MatrixHollow new rows: 3 cols: noZeros.
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
