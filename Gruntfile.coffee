module.exports = (grunt)->

  grunt.initConfig {
    pkg: grunt.file.readJSON 'package.json'

    ocublog: {
      dist: {
        options: {
          blog_path: 'blog/'
          blog_name: "My Blog"
          default_author: "Admin"
          site_url: "http://www.example.com/"
          rss: false
        }
        files: [{
          expand: true
          cwd: 'blog/'
          src: ['*.{md,html}']
          dest: 'build/blog/'
        }]
      }
    }

    mochaTest: {
      test: {
        src: ['test/*.coffee']
      }
    }


    clean: ['build/']
  }

  grunt.loadNpmTasks 'grunt-mocha-test'
  grunt.loadNpmTasks 'grunt-contrib-clean'

  grunt.loadTasks 'tasks'

  grunt.registerTask 'test', ['mochaTest']

  grunt.registerTask 'default', ['test', 'ocublog', 'clean']
