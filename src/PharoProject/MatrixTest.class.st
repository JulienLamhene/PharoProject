Class {
	#name : #MatrixTest,
	#superclass : #TestCase,
	#category : #PharoProject
}

{ #category : #running }
MatrixTest >> testInitialize [
	|m|
	m := Matrix new.
	self assert: m rows equals: 0.
	self assert: m cols equals: 0.
]

{ #category : #running }
MatrixTest >> testRowsCols [
	|m|
	m := Matrix new rows: 2 cols: 3.
	self assert: m rows equals: 2.
	self assert: m cols equals: 3.
]

{ #category : #running }
MatrixTest >> testSize [
	|m|
	m := Matrix new rows: 3 cols: 3.
	self assert: m size equals: 6
]
