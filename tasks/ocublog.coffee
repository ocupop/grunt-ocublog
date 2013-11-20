module.exports = (grunt)->
  grunt.registerMultiTask "ocublog", "Ridiculously simple static site generator", ()->

    RSS = require 'rss'

    ocublog = require('../lib/ocublog')


    options = @options {
      blog_path: 'blog/'
      blog_name: "Blog"
      default_author: "Admin"
      site_url: ""
      rss: false
    }

    index = []

    if options.rss
      feed_file_name = "feed.xml"

      feed = new RSS {
        title: options.blog_name
        site_url: options.site_url
        feed_url: options.site_url + options.blog_path + feed_file_name
        author: options.default_author
      }

    by_date_desc = (prev,next)->
      if prev.date < next.date then 1 else -1

    dest_path = @files[0].orig.dest

    @files.forEach (file)->
      file_contents = grunt.file.read file.src

      {header, content} = ocublog(file_contents, file.src.toString())

      grunt.file.write(dest_path + header.slug + '.html', content)

      index.push header

      if options.rss then feed.item {
        title: header.title
        description: content
        date: header.posted_at
        categories: header.tags
        url: options.rss.site_url + '#' + options.blog_path + header.slug
      }

    index.sort by_date_desc
    grunt.file.write(dest_path + "index.json", JSON.stringify index)

    grunt.file.write(dest_path + feed_file_name, feed.xml()) if options.rss

