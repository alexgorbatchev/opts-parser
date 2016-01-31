# syntaxhighlighter/opts-parser

Parses key/value pairs into hash object. The source format looks like HTML's `style` attribute, see below for more details. This was an old school way of passing random canfiguration values through `class` attribute into SyntaxHighlighter. Why not use `data-*` attributes? Well, back in 2002 those didn't exist... Yes, this could be modernized a bit, at the same time there are hundreds of thousands active usages now. 

[![Build Status](https://travis-ci.org/alexgorbatchev/opts-parser.svg)](https://travis-ci.org/alexgorbatchev/opts-parser)

## Installation

    npm install syntaxhighlighter/opts-parser

## Usage Example

    var opts = require('opts-parser');
    opts.parse("hello: value; foo-bar: [12, "monkeys"]; value: 'value'");

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
