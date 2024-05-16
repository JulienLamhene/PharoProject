Class {
	#name : #SparseMatrixTest,
	#superclass : #TestCase,
	#category : #PharoProject
}

{ #category : #running }
SparseMatrixTest >> testAtRowAtCol [
	|m hollow|
	m := MatrixClassic new.
	m elements: #((0 0 3 0 4) (0 0 5 7 0) (0 0 0 0 0) (0 2 6 0 0)).
	hollow := SparseMatrix new.
	hollow elements: #((1 1 2 2 4 4) (3 5 3 4 2 3) (3 4 5 7 2 6)).
	self assert: (hollow atRow: 1 atCol: 1)  equals: (m atRow: 1 atCol: 1).
]

{ #category : #running }
SparseMatrixTest >> testElements [
	| sparse |
	sparse := SparseMatrix new.
	self assert: sparse elements equals: #(#(0 0 0) #(0 0 0) #(0 0 0)).
	sparse elements: #(#(4 5 1) #(9 3 2) #(6 8 7)).
	self assert: sparse elements equals: #(#(4 5 1) #(9 3 2) #(6 8 7)).
	
]

{ #category : #running }
SparseMatrixTest >> testInitialize [
	| sparse |
	sparse := SparseMatrix new.
	self assert: sparse rows equals: 3.
	self assert: sparse cols equals: 3.
	self assert: sparse elements equals: #(#(0 0 0) #(0 0 0) #(0 0 0)).
]

{ #category : #running }
SparseMatrixTest >> testMaxCol [
	| sparse |
	sparse := SparseMatrix new.
	sparse elements: #(#(4 5 1) #(9 3 2) #(6 8 7)).
	self assert: sparse maxCol equals: 9.
	
]

{ #category : #running }
SparseMatrixTest >> testMaxRow [
	| sparse |
	sparse := SparseMatrix new.
	sparse elements: #(#(4 5 1) #(9 3 2) #(6 8 7)).
	self assert: sparse maxRow equals: 5.
	
]

{ #category : #running }
SparseMatrixTest >> testToClassicMatrix [
	|m hollow|
	m := MatrixClassic new.
	m elements: #((0 0 3 0 4) (0 0 5 7 0) (0 0 0 0 0) (0 2 6 0 0)).
	hollow := SparseMatrix new.
	hollow elements: #((1 1 2 2 4 4) (3 5 3 4 2 3) (3 4 5 7 2 6)).
	self assert: (hollow toClassicMatrix) elements equals: m elements
]

{ #category : #running }
SparseMatrixTest >> testToSparseMatrix [
	|hollow sparse|
	hollow := SparseMatrix new rows: 3 cols: 6.
	hollow elements: #((1 1 2 2 4 4) (3 5 3 4 2 3) (3 4 5 7 2 6)).
	sparse := SparseMatrix new rows: 3 cols: 6.
	sparse elements: #((1 1 2 2 4 4) (3 5 3 4 2 3) (3 4 5 7 2 6)).
	self assert: hollow toSparseMatrix elements equals: sparse elements.
]
