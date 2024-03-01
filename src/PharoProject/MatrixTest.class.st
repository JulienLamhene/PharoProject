Class {
	#name : #MatrixTest,
	#superclass : #TestCase,
	#category : #PharoProject
}

{ #category : #running }
MatrixTest >> testAtRowAtCol [
	|m element|
	m := Matrix new rows: 2 cols: 3.
	element := m atRow: 2 atCol:1.
	self assert: element equals: 0
]

{ #category : #running }
MatrixTest >> testAtRowAtColPut [
	|m element|
	m := Matrix new rows: 2 cols: 3.
	m matrix.
	element := 4.
	m atRow: 2 atCol:1 put: element.
	self assert:	 (m atRow: 2 atCol:1) equals: element
]

{ #category : #running }
MatrixTest >> testCountNoZeros [
	|m|
	m := Matrix new.
	m matrix: #((1 0 3) (0 5 6) (7 8 0)).
	self assert: m countNoZeros equals: 6
]

{ #category : #running }
MatrixTest >> testCreateASimpleMatrix [
	|m|
	m := Matrix new.
	m matrix: #((1 2 3) (4 5 6) (7 8 9)).
	self assert: m matrix equals: #((1 2 3) (4 5 6) (7 8 9)).
]

{ #category : #running }
MatrixTest >> testInitialize [
	|m|
	m := Matrix new.
	self assert: m matrix equals: #((0 0 0 0 0) (0 0 0 0 0) (0 0 0 0 0) (0 0 0 0 0) (0 0 0 0 0))
]

{ #category : #running }
MatrixTest >> testNumberCols [
	|m|
	m := Matrix new.
	m matrix: #((1 0 3) (0 5 6) (7 8 0)).
	self assert: m numberCols equals: 3
]

{ #category : #running }
MatrixTest >> testNumberRows [
	|m|
	m := Matrix new.
	m matrix: #((1 0 3) (0 5 6)).
	self assert: m numberRows equals: 2.
]

{ #category : #running }
MatrixTest >> testRowsCols [
	|m|
	m := Matrix new rows: 2 cols: 3.
	self assert: m matrix equals: #((0 0 0) (0 0 0))
]

{ #category : #running }
MatrixTest >> testRowsColsWithAll [
	|m|
	m := Matrix new rows: 2 cols: 3 withAll: 4.
	self assert: m matrix equals: #((4 4 4) (4 4 4))
]

{ #category : #running }
MatrixTest >> testSize [
	|m|
	m := Matrix new.
	m matrix: #((1 0 3) (0 5 6)).
	self assert: m size equals: 6
]
