Class {
	#name : #MatrixClassicTest,
	#superclass : #TestCase,
	#category : #PharoProject
}

{ #category : #running }
MatrixClassicTest >> testToHollowMatrix [
	|m hollow|
	m := MatrixClassic new.
	m matrix: #((0 0 3 0 4) (0 0 5 7 0) (0 0 0 0 0) (0 2 6 0 0)).
	hollow := MatrixHollow new rows: 3 cols: 6.
	hollow matrix: #((0 0 1 1 3 3) (2 4 2 3 1 2) (3 4 5 7 2 6)).
	self assert: m toHollowMatrix matrix equals: hollow matrix
]
