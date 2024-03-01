Class {
	#name : #PharoDoc,
	#superclass : #Object,
	#category : #PharoProject
}

{ #category : #accessing }
PharoDoc class >> generateDocClasses: packageName [
	"Method who generate the documentation for the classes in packages"

	| package array stream |
	package := (RPackageOrganizer default packageNamed: packageName)
		           definedClasses.
	array := package asOrderedCollection.
	stream := '' writeStream.
	array do: [ :classe |
		stream nextPutAll: '====';
			nextPut: Character lf;
			nextPutAll: 'Class : ';
			nextPutAll: classe name;
			nextPut: Character lf;
			nextPutAll: 'Superclass : ';
			nextPutAll: classe superclass name;
			nextPut: Character lf.
		classe subclasses ifNotEmpty: [
			stream
				nextPut: Character lf;
				nextPutAll: 'Subclasses : ';
				nextPut: Character lf.
			classe subclassesDo: [ :sub |
				stream
					nextPutAll: '    ' ; 
					nextPutAll: classe subclasses;
					nextPut: Character lf ] ].
		classe allInstVarNames ifNotEmpty: [
			stream nextPutAll: 'Instances variables : '.
			classe allInstVarNames do: [ :var |
				stream
					nextPutAll: var;
					nextPutAll: ' / '.
			].
		stream nextPut: Character lf. 
		].
		Transcript show: stream contents;cr.
		"Once doc about general information is given, the method will call another one to have the informations about the methods of the class"
		self generateDocMethods: classe ]
]

{ #category : #accessing }
PharoDoc class >> generateDocMethods: className [
	"Method who generate the documentation for the methods for the classes in packages"
	|array stream|
	stream := '' writeStream.
	array := className methods.
	array ifNotEmpty: [		
		array do: [ :method | 
			| currentSender |
			currentSender := ''.
			
			stream nextPutAll: 'Method : ';
			nextPutAll: (method selector); 
			nextPut: Character lf.
			
			method senders ifNotEmpty: [
				method senders do: [ :send | 
					
					| senderName |
					senderName := (send name) copyUpTo: #>> first.
					
					(currentSender = senderName) ifTrue:[
						stream nextPutAll: '    - ';
						nextPutAll: send selector;
						nextPut: Character lf.
					] ifFalse: [
						stream nextPutAll: '***';
						nextPut: Character lf;
						nextPutAll: 'Sender : ';
						nextPutAll: senderName;
						nextPut: Character lf;
						nextPutAll: '    - ';
						nextPutAll: send selector;
						nextPut: Character lf.
						currentSender := senderName.
					].
				].
			].
			stream nextPutAll: '-------';
			nextPut: Character lf.
		].
	].
	Transcript show: stream contents;cr.
	^self
]
