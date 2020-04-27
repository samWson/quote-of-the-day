"
# SWQuoteOfTheDay

I am the 'main' class of the Quote of the Day program.

## Usage

The class method `#main` is the entry point to the program. This will initialize
the program and start the user interface.

```smalltalk
SWQuoteOfTheDay main.
```

An instance is returned from `#main`. The instance can also be accessed from the
class variable `instance`. 

```smalltalk
SWQuoteOfTheDay instance
```

When the 'close' event from the user interface is triggered the program is 
considered 'shutdown' and the instance is deallocated.

## Instance Variables

- quotes: a collection of all the quotes loaded on startup of the program.

- gui: the user interface.

## Class Instance Variables

- instance: an instance of the `SWQuoteOfTheDay`. This is assigned and initialized
  on 'startup' with `#main` and deallocated on 'shutdown' when the user interface
  is closed.

## Package Prefix

The package and classes are prefixed with 'SW' for the initials of the author
Samuel Wilson.
"
Class {
	#name : #SWQuoteOfTheDay,
	#superclass : #Object,
	#instVars : [
		'quotes',
		'gui'
	],
	#classInstVars : [
		'instance'
	],
	#category : #SWQuoteOfTheDay
}

{ #category : #finalizing }
SWQuoteOfTheDay class >> endProgram [

	instance := nil
]

{ #category : #accessing }
SWQuoteOfTheDay class >> instance [

	instance 
		ifNil: [ Error signal: '`instance` is nil. An instance must be created with `SWQuoteOfTheDay class >>#main` first.' ] 
		ifNotNil: [ ^ instance ]
]

{ #category : #'startup-shutdown' }
SWQuoteOfTheDay class >> main [
	instance :=	self new 
		displayUi;
		yourself.
		
	^ instance
]

{ #category : #'initialization-UI' }
SWQuoteOfTheDay >> displayUi [
	
	gui := SWQuotesPresenter new.
	gui 
		text: self randomQuote;
		openWithSpec.
]

{ #category : #initialization }
SWQuoteOfTheDay >> initialize [

	quotes := self loadQuotes
]

{ #category : #initialization }
SWQuoteOfTheDay >> loadQuotes [

	^ STONJSON fromStream: self quotesReference readStream
]

{ #category : #resources }
SWQuoteOfTheDay >> quotesReference [
	
	| quotesDir quotesFile homeDir |
	quotesFile := 'quotes.json'.
	quotesDir := '.quote-program'.
	homeDir := Smalltalk os environment at: 'HOMEPATH'.
	^ FileReference / homeDir / quotesDir / quotesFile
]

{ #category : #sampling }
SWQuoteOfTheDay >> randomQuote [

	| quote |
	quote := quotes atRandom.

	^ '{title}<n><n>{text}<n><n><t>{reference}' expandMacros format: quote
]
