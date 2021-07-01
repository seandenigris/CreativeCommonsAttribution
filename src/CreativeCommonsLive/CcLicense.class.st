Class {
	#name : #CcLicense,
	#superclass : #Object,
	#instVars : [
		'name',
		'abbreviation',
		'version'
	],
	#category : #'CreativeCommonsLive-Core'
}

{ #category : #'as yet unclassified' }
CcLicense class >> all [

	^ { self attribution. self shareAlike. self noDerivs. self nonCommercial. self nonCommercialShareAlike. self nonCommercialNoDerivs }
]

{ #category : #'as yet unclassified' }
CcLicense class >> attribution [

	^ self new
		name: 'Attribution';
		abbreviation: 'CC BY';
		yourself
]

{ #category : #examples }
CcLicense class >> examplePrinting [
	<gtExample>
	^ self
		given: [ self exampleVersion ]
		when: [ :lic | lic printString ]
		then: [ :str | str should equal: 'CC BY-NC-ND 3.0' ]
]

{ #category : #examples }
CcLicense class >> exampleVersion [
	<gtExample>
	^ self
		given: [ '3.0' ]
		when: [ :version | 
			self nonCommercialNoDerivs
				version: version;
				yourself ]
		then: [ :lic :v | lic version should equal: v ]
]

{ #category : #'as yet unclassified' }
CcLicense class >> noDerivs [

	^ self new
		name: 'Attribution-NoDerivs';
		abbreviation: 'CC BY-ND';
		yourself
]

{ #category : #'as yet unclassified' }
CcLicense class >> nonCommercial [

	^ self new
		name: 'Attribution-NonCommercial';
		abbreviation: 'CC BY-NC';
		yourself
]

{ #category : #'as yet unclassified' }
CcLicense class >> nonCommercialNoDerivs [

	^ self new
		name: 'Attribution-NonCommercial-NoDerivs';
		abbreviation: 'CC BY-NC-ND';
		yourself
]

{ #category : #'as yet unclassified' }
CcLicense class >> nonCommercialShareAlike [

	^ self new
		name: 'Attribution-NonCommercial-ShareAlike';
		abbreviation: 'CC BY-NC-SA';
		yourself
]

{ #category : #'as yet unclassified' }
CcLicense class >> shareAlike [

	^ self new
		name: 'Attribution-ShareAlike';
		abbreviation: 'CC BY-SA';
		yourself
]

{ #category : #accessing }
CcLicense >> abbreviation [
	^ abbreviation
]

{ #category : #accessing }
CcLicense >> abbreviation: anObject [
	abbreviation := anObject
]

{ #category : #accessing }
CcLicense >> atttributionStringFor: work [
	^ String streamContents: [ :str |
		str << $" << work title << $".
		str << ' by '.
		work authors
			do: [ :a | str << a fullName ]
			separatedBy: [ str space ].
		str << ' is licensed under ' << self linkText ]
]

{ #category : #'as yet unclassified' }
CcLicense >> deedUrl [

	| baseUrl myPath |
	baseUrl :=  'http://creativecommons.org/licenses' asUrl.
	myPath := (self abbreviation allButFirst: 3) asLowercase.
	^ baseUrl / myPath / self version asString.
]

{ #category : #'as yet unclassified' }
CcLicense >> legalCodeUrl [

	^ self deedUrl / 'legalcode'
]

{ #category : #accessing }
CcLicense >> linkText [
	^ self abbreviation, ' ', self version asString
]

{ #category : #accessing }
CcLicense >> name [
	^ name
]

{ #category : #accessing }
CcLicense >> name: anObject [
	name := anObject
]

{ #category : #accessing }
CcLicense >> printOn: aStream [
	aStream nextPutAll: self linkText
]

{ #category : #accessing }
CcLicense >> version [
	^ version
]

{ #category : #accessing }
CcLicense >> version: anObject [
	version := anObject
]
