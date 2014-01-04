var XRegExp = require('xregexp');

function camelize(key)
{
  return key.replace(/-(\w+)/g, function(match, word)
  {
    return word.charAt(0).toUpperCase() + word.substr(1);
  });
}

module.exports = {
  parse: function(str, defaults)
  {
    var match,
        key,
        result = {},
        arrayRegex = XRegExp("^\\[(?<values>(.*?))\\]$"),
        pos = 0,
        regex = XRegExp(
          "(?<name>[\\w-]+)" +
          "\\s*:\\s*" +
          "(?<value>" +
            "[\\w%#-]+|" +    // word
            "\\[.*?\\]|" +    // [] array
            '".*?"|' +        // "" string
            "'.*?'" +         // '' string
          ")\\s*;?",
          "g"
        )
        ;

    for(key in defaults || {})
      result[key] = result[camelize(key)] = defaults[key];

    while ((match = XRegExp.exec(str, regex, pos)) != null)
    {
      var value = match.value
        .replace(/^['"]|['"]$/g, '') // strip quotes from end of strings
        ;

      // try to parse array value
      if (value != null && arrayRegex.test(value))
      {
        var m = XRegExp.exec(value, arrayRegex);
        value = m.values.length > 0 ? m.values.split(/\s*,\s*/) : [];
      }

      result[match.name] = value;
      result[camelize(match.name)] = value;
      pos = match.index + match[0].length;
    }

    return result;
  }
};
