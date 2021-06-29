Class {
	#name : #BaselineOfCreativeCommonsLive,
	#superclass : #BaselineOf,
	#category : #BaselineOfCreativeCommonsLive
}

{ #category : #baseline }
BaselineOfCreativeCommonsLive >> baseline: spec [
  <baseline>

	spec for: #'common' do: [
		spec package: #CreativeCommonsLive ].
]

{ #category : #accessing }
BaselineOfCreativeCommonsLive >> customProjectAttributes [
	^ self isGTImage
			ifFalse: [ #() ]
			ifTrue: [ #(GToolkit) ]
]

{ #category : #testing }
BaselineOfCreativeCommonsLive >> isGTImage [
	^ RPackageOrganizer default packageNames anySatisfy: [ :pn | pn beginsWith: 'GToolkit-' ]
]
