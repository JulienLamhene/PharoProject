Class {
	#name : #MatrixHollowTest,
	#superclass : #TestCase,
	#category : #PharoProject
}

{ #category : #running }
MatrixHollowTest >> testToClassicMatrix [
	|m hollow|
	m := MatrixClassic new.
	m matrix: #((0 0 3 0 4) (0 0 5 7 0) (0 0 0 0 0) (0 2 6 0 0)).
	hollow := MatrixHollow new.
	hollow matrix: #((0 0 1 1 3 3) (2 4 2 3 1 2) (3 4 5 7 2 6)).
	self assert: (hollow toClassicMatrix) matrix equals: m matrix
]
