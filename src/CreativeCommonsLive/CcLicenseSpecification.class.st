Class {
	#name : #CcLicenseSpecification,
	#superclass : #TestCase,
	#category : #'CreativeCommonsLive-Specification'
}

{ #category : #tests }
CcLicenseSpecification >> testDeedUrl [

	| license |
	license := CcLicense nonCommercial version: 4.0.
	license deedUrl should equal: 'http://creativecommons.org/licenses/by-nc/4.0' asUrl
]

{ #category : #tests }
CcLicenseSpecification >> testLinkText [

	| license version |
	version := 2.0.
	license := CcLicense nonCommercial version: version.
	license linkText should equal: 'CC BY-NC ', version asString
]
