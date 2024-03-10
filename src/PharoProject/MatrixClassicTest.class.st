Class {
	#name : #MatrixClassicTest,
	#superclass : #TestCase,
	#category : #PharoProject
}

{ #category : #running }
MatrixClassicTest >> testAtRowAtCol [
	|m element|
	m := MatrixClassic new rows: 2 cols: 3.
	element := m atRow: 2 atCol:1.
	self assert: element equals: 0
]

{ #category : #running }
MatrixClassicTest >> testAtRowAtColPut [
	|m element|
	m := MatrixClassic new rows: 2 cols: 3.
	m elements.
	element := 4.
	m atRow: 2 atCol:1 put: element.
	self assert:	 (m atRow: 2 atCol:1) equals: element
]

{ #category : #running }
MatrixClassicTest >> testCountNoZeros [
	|m|
	m := MatrixClassic new.
	m elements: #((1 0 3) (0 5 6) (7 8 0)).
	self assert: m countNoZeros equals: 6
]

{ #category : #running }
MatrixClassicTest >> testElements [
	| m |
	m := MatrixClassic new rows: 2 cols: 3.
	self assert: m rows equals: 2.
	self assert: m cols equals: 3.
	self assert: m elements equals: #((0 0 0) (0 0 0)).
	m elements: #((1 2 3) (4 5 6) (7 8 9) (1 2 3)).
	self assert: m rows equals: 4.
	self assert: m cols equals: 3.
	self assert: m elements equals: #((1 2 3) (4 5 6) (7 8 9) (1 2 3)).
]

{ #category : #running }
MatrixClassicTest >> testInitialize [
	| m |
	m := MatrixClassic new.
	self assert: m elements equals: #((0 0 0) (0 0 0) (0 0 0)).
]

{ #category : #running }
MatrixClassicTest >> testRowsCols [
	| m |
	m := MatrixClassic new rows: 2 cols: 3.
	self assert: m rows equals: 2.
	self assert: m cols equals: 3.
	self assert: m elements equals: #((0 0 0) (0 0 0)).
]

{ #category : #running }
MatrixClassicTest >> testSize [
	|m|
	m := MatrixClassic new rows: 3 cols: 3.
	self assert: m size equals: 6
]

{ #category : #running }
MatrixClassicTest >> testToHollowMatrix [
	|m hollow|
	m := MatrixClassic new.
	m elements: #((0 0 3 0 4) (0 0 5 7 0) (0 0 0 0 0) (0 2 6 0 0)).
	hollow := SparseMatrix new rows: 3 cols: 6.
	hollow elements: #((1 1 2 2 4 4) (3 5 3 4 2 3) (3 4 5 7 2 6)).
	self assert: m toHollowMatrix elements equals: hollow elements.
]
