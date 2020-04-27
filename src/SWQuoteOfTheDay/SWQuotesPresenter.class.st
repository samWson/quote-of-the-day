"
# SWQuotesUI

I am the user interface for the Quote of the Day program. I show the text of a randomly 
selected quote each time the program is started.

## Events

When the user interface is closed the event is used to 'shutdown' the program. The
program instance is deallocated.

## Instance variables

- textPresenter: A text area for the quote body text.
"
Class {
	#name : #SWQuotesPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'textPresenter'
	],
	#category : #SWQuoteOfTheDay
}

{ #category : #specs }
SWQuotesPresenter class >> defaultSpec [

	^ SpBoxLayout newHorizontal
		add: #textPresenter;
		yourself
]

{ #category : #initialization }
SWQuotesPresenter >> initializePresenters [ 

	textPresenter := self newText enabled: false
]

{ #category : #initialization }
SWQuotesPresenter >> initializeWindow: aWindowPresenter [ 

	aWindowPresenter
		title: 'Quote of the Day';
		whenClosedDo: [ SWQuoteOfTheDay endProgram ];
		initialExtent: 400@400
]

{ #category : #accessing }
SWQuotesPresenter >> text [
	
	^ textPresenter
]

{ #category : #accessing }
SWQuotesPresenter >> text: aString [
	
	textPresenter text: aString
]
