module.exports = (file_contents, file_path)->
  return null unless file_contents && file_path

  yaml = require 'js-yaml'
  marked = require 'marked'
  path = require 'path'

  marked.setOptions {
    breaks: true
    sanitize: false
    smartypants: true
  }

  file_ext = path.extname(file_path)

  slug = path.basename(file_path, file_ext)

  # match content inside and after triple dash section
  try
    [orig, header_yaml, content] = file_contents.match(/---([\s\S]+)---([\s\S]+)/)
  catch error
    throw new Error("Header or content not properly formed for #{file_path}")

  # parse header
  header = yaml.safeLoad header_yaml

  header.slug = slug

  # parse content as markdown
  content = marked(content) if file_ext in ['.md', '.markdown']


  return {header, content}
