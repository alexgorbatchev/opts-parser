# syntaxhighlighter/opts-parser

Parses key/value pairs into hash object.

[![Build Status](https://travis-ci.org/alexgorbatchev/opts-parser.svg)](https://travis-ci.org/alexgorbatchev/opts-parser)

## Installation

    npm install syntaxhighlighter/opts-parser

## Usage Example

    var opts = require('opts-parser');

    opts.parse("hello: value; foo-bar: [12, "monkeys"]; value: 'value'")

    {
      "hello": "value",
      "foo-bar": [12, "monkeys"],
      "fooBar": [12, "monkeys"],
      "value": "value
    }

Understands the following formats:

- `name: true|false;`
- `name: word;`
- `name: [word, word];`
- `name: "string";`
- `name: 'string';`

## Testing

    npm test

## License

MIT
