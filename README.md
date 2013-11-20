# grunt-ocublog

> Ridiculously simple static site generator

Ocublog is a lightweight component for generating a blog within an existing Grunt-based static site workflow. It follows the conventions of Jekyll's blog post format but is not so much a static-site generator as it is a static _API_ generator. Neither pagination nor variables nor layouts are provided; this is just a dead-simple way to turn static content into something that can be consumed like an API.

## Post format

Posts are formatted very similarly as they are in other static site generators; they are divided into a header and content section:


````
---
title: Title goes here
posted_at: 2013-11-09
---
[content goes here]

````

The header (or front matter, in Jekyll parlance) is YAML; none of these are required, though you do need to have a title and posted_at for RSS, and it throws an error if you don't have something in there. There is no concept of 'draft' vs 'published' implemented here; keep your drafts in a separate folder.

The file name itself (minus the file extension) is added to the header as the post "slug". Unlike in Jekyll there is no requirement to put a post date in the file name.

The content can be either HTML or Markdown.

## Output

When the posts are processed, it builds an index.json file which contains all of the post headers and the post slug, but _not_ the post content. The content will be in individual files in the same directory, named like `_slug_.html`. If RSS is enabled in options, that file will be in that directory as well.

## Building with Grunt
This plugin requires Grunt `~0.4.1`

If you haven't used [Grunt](http://gruntjs.com/) before, be sure to check out the [Getting Started](http://gruntjs.com/getting-started) guide, as it explains how to create a [Gruntfile](http://gruntjs.com/sample-gruntfile) as well as install and use Grunt plugins. Once you're familiar with that process, you may install this plugin with this command:

```shell
npm install grunt-ocublog --save-dev
```

Once the plugin has been installed, it may be enabled inside your Gruntfile with this line of JavaScript:

```js
grunt.loadNpmTasks('grunt-ocublog');
```

## The "ocublog" task

### Overview
In your project's Gruntfile, add a section named `ocublog` to the data object passed into `grunt.initConfig()`.

```js
grunt.initConfig({
  ocublog: {
    task: {
      options: {
        // task-specific options go here
      },
      files: {
        // files to process go here
      }
    }
  },
})
```

### Options

Most of the options here are only used for the RSS generator.

#### options.rss

Type `Boolean` Default value `false`

Build RSS feed for blog.

#### options.blog_path

Type `String` Default value `blog/`

Relative path to blog index page.

#### options.blog_name

Type `String` Default value `Blog`

Title of your blog.

#### options.default_author

Type `String` Default value `Admin`

Author name used when not provided in file header.

#### options.site_url

Type `String` Default value ``

Complete URL to site front page.

### Usage Examples


```js
grunt.initConfig({
  ocublog: {
    dist: {
      options: {
        blog_path: 'blog/',
        blog_name: "My Blog",
        default_author: "Admin",
        site_url: "http://www.example.com/",
        rss: false
      },
      files: [{
        expand: true,
        cwd: 'blog/',
        src: ['*.{md,html}'],
        dest: 'build/blog/'
      }]
    }
  }
})
```


## Contributing
In lieu of a formal styleguide, take care to maintain the existing coding style. Add unit tests for any new or changed functionality. Lint and test your code using [Grunt](http://gruntjs.com/).

## Release History

- 0.1.0: it exists.