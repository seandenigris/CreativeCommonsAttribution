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
CcLicense >> version [
	^ version
]

{ #category : #accessing }
CcLicense >> version: anObject [
	version := anObject
]
