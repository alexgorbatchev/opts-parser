require 'coffee-errors'

chai = require 'chai'
parser = require '..'
expect = chai.expect

describe 'opts-parser', ->
  opts = null

  describe '.parse', ->
    describe 'defaults', ->
      before -> opts = parser.parse 'foo: bar', 'foo': 'default', 'fiz-biz': 1
      it 'has foo', -> expect(opts).to.have.property 'foo'
      it 'is bar', -> expect(opts.foo).to.equal 'bar'
      it 'has fiz-biz', -> expect(opts).to.contain.keys ['fizBiz', 'fiz-biz']
      it 'is 1', -> expect(opts.fizBiz).to.equal 1

    describe 'words', ->
      before -> opts = parser.parse 'foo: bar'
      it 'has foo', -> expect(opts).to.have.property 'foo'
      it 'is bar', -> expect(opts.foo).to.equal 'bar'

    describe 'arrays', ->
      before -> opts = parser.parse 'foo: [hello, world]'
      it 'has foo', -> expect(opts).to.have.property 'foo'
      it 'is array', -> expect(opts.foo).to.eql ['hello', 'world']

    describe 'strings', ->
      describe 'single quoted', ->
        before -> opts = parser.parse '''foo: 'hello, world' '''
        it 'has foo', -> expect(opts).to.have.property 'foo'
        it 'is hello, world', -> expect(opts.foo).to.equal 'hello, world'

      describe 'double quoted', ->
        before -> opts = parser.parse '''foo: "hello, world" '''
        it 'has foo', -> expect(opts).to.have.property 'foo'
        it 'is hello, world', -> expect(opts.foo).to.equal 'hello, world'

    describe 'all', ->
      before -> opts = parser.parse '''foo-baz: 'hello, world'; helloWorld: [1,2,3]; color: #000'''
      it 'has keys', -> expect(opts).to.have.keys ['fooBaz', 'foo-baz', 'helloWorld', 'color']
      it 'has color', -> expect(opts.color).to.eql '#000'
