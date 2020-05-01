"
# BaselineOfSWQuoteOfTheDay
"
Class {
	#name : #BaselineOfSWQuoteOfTheDay,
	#superclass : #BaselineOf,
	#category : #BaselineOfSWQuoteOfTheDay
}

{ #category : #baselines }
BaselineOfSWQuoteOfTheDay >> baseline: spec [
	<baseline>
	spec for: #common do: [ 
		spec
			package: 'SWQuoteOfTheDay'
		 ]
]

{ #category : #accessing }
BaselineOfSWQuoteOfTheDay >> projectClass [

	^ MetacelloCypressBaselineProject
]
