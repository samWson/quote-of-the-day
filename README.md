# Quotes

A program to show a randomly selected quote on demand.

## Loading Via Baseline

To load the project into a Smalltalk image run the following code:

```smalltalk
Metacello new
    githubUser: 'samwson'
    project: 'quote-of-the-day'
    commitish: ''
    path: '';
    baseline: 'SWQuoteOfTheDay';
    load
```

## Usage

To run the program use `SWQuoteOfTheDay class>>#main`:

```smalltalk
SWQuoteOfTheDay main
```

## License

This is repository is open source software under the MIT license.
