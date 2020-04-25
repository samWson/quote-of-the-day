"
# SWQuotesUI

I am the user interface for the Quotes program. Currently I just show the text of a
randomly selected quote each time the program is started.

## Instance variables

- text: A text area for the quote body text.
"
Class {
	#name : #SWQuotesPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'text'
	],
	#category : #SWQuoteOfTheDay
}

{ #category : #specs }
SWQuotesPresenter class >> defaultSpec [

	^ SpBoxLayout newHorizontal
		add: #text;
		yourself
]

{ #category : #initialization }
SWQuotesPresenter >> initializePresenters [ 

	text := self newText
]

{ #category : #initialization }
SWQuotesPresenter >> initializeWindow: aWindowPresenter [ 

	aWindowPresenter
		title: 'Quote of the Day';
		initialExtent: 400@400
]
