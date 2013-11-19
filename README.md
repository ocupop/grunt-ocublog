# grunt-ocublog

> Ridiculously simple static site generator

## Getting Started
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
        files to process go here
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
_(Nothing yet)_
