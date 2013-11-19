ocublog = require('../lib/ocublog')
assert = require('assert')
fs = require 'fs'

describe 'unit test', ()->

  it "returns null with insufficient inputs", ()->
    assert.equal ocublog() , null
    assert.equal ocublog( null, "blog/file.html" ) , null

  it "throws an error with malformed inputs", ()->
    assert.throws (()-> ocublog("malformed input", "blog/file.html")), Error

  it "correctly parses an html file", ()->
    data = fs.readFileSync 'blog/html-test.html', {encoding: 'utf8'}

    {header, content} = ocublog(data, 'blog/html-test.html')

    assert.equal header.slug, 'html-test'
    assert.equal header.title, 'HTML File test'
    assert (content.indexOf('<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>') >= 0)


  it "correctly detects and parses a markdown file", ()->
    data = fs.readFileSync 'blog/markdown-test.md', {encoding: 'utf8'}

    {header, content} = ocublog(data, 'blog/markdown-test.md')

    assert.equal header.slug, 'markdown-test'
    assert.equal header.title, 'Markdown File Test'
    assert (content.indexOf('<p>8-bit ethical slow-carb, semiotics occaecat American Apparel Truffaut id cliche. Four loko nihil placeat pork belly proident. Anim labore consectetur XOXO keffiyeh freegan.</p>') >= 0)

describe 'integration test', ()->

  it "reads the src directory"

  it "creates the parsed files"

  it "creates the index"

  it "creates the rss"