Class {
	#name : #PharoDoc,
	#superclass : #Object,
	#category : #PharoProject
}

{ #category : #accessing }
PharoDoc class >> generateDocClasses: packageName [
	"Method who generate the documentation for the classes in packages"
	|package array|
	package := (RPackageOrganizer default packageNamed: packageName) definedClasses.
	array := package asOrderedCollection.
	array do: [ :classe | 
		Transcript show: '====='; cr;
		show: 'Class : ', classe name; cr;
		show: ('Superclass : ', classe superclass name); cr.
		classe subclassesDo: [ :sub | Transcript show: ('Subclasses : ', classe subclasses); cr. ].
		classe allInstVarNames ifNotEmpty: [ 
			Transcript show: ('Instances variables : ').
			classe allInstVarNames do: [:var | Transcript show: var;cr]
		].
		self generateDocMethods: classe
	].
]

{ #category : #accessing }
PharoDoc class >> generateDocMethods: className [
	"Method who generate the documentation for the classes in packages"
	|array|
	array := className methods.
	array ifNotEmpty: [		
		array do: [ :method | 
			| currentSender |
			currentSender := ''.
			
			Transcript show: 'Method : ', (method selector) ; cr.
			
			method senders ifNotEmpty: [
				method senders do: [ :send | 
					
					| senderName |
					senderName := (send name) copyUpTo: #>> first.
					
					(currentSender = senderName) ifFalse:[
						Transcript show: '***'; cr.
						Transcript show: 'Sender : ', senderName; cr.
					].
					(currentSender = senderName) ifTrue:[
						Transcript show: '    - ', send selector; cr.
					] ifFalse: [
						Transcript show: '    - ', send selector; cr.
						currentSender := senderName.
					].
				].
			].
			Transcript show: '-------'; cr.
		].
	].
	^self
]
