"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestPharoProject,
	#superclass : #PackageManifest,
	#category : #'PharoProject-Manifest'
}

{ #category : #'code-critics' }
ManifestPharoProject class >> ruleStringConcatenationRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#MatrixClassic #toSparseMatrix #false)) #'2024-05-15T11:18:06.645998+02:00') )
]
