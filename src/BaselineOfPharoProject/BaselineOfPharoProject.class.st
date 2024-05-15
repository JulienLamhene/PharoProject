Class {
	#name : #BaselineOfPharoProject,
	#superclass : #BaselineOf,
	#category : #BaselineOfPharoProject
}

{ #category : #baselines }
BaselineOfPharoProject >> baseline: spec [
	<baseline>
	spec for: #common do: [ spec package: 'PharoProject'. spec group: 'default' with: #('PharoProject') ]
]
