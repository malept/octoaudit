module.exports = (grunt) ->
  # Load grunt tasks automatically
  require('load-grunt-tasks')(grunt)

  # Configurable paths
  config =
    app: 'data'
    build_tools: 'build_tools'
    dist: 'dist'

  grunt.initConfig
    config: config
    bowercopy:
      options:
        clean: true
      libs:
        files:
          'jquery.min.js': 'jquery/dist/jquery.min.js'
          'jquery.min.map': 'jquery/dist/jquery.min.map'
        options:
          destPrefix: '<%= config.app %>/js/vendor'
    clean:
      build:
        src: [
          '<%= config.app %>/**/*.map'
          '<%= config.app %>/css/*.css'
          '<%= config.app %>/js/*.js'
          '<%= config.app %>/js/vendor/*.js'
        ]
      build_tools: [
        '<%= config.build_tools %>'
      ]
      crx:
        src: ['<%= config.dist %>/crx/*.crx']
      xpi:
        src: ['<%= config.dist %>/xpi/*.xpi']
    # Compiles CoffeeScript to JavaScript
    coffee:
      build:
        files: [
          expand: true
          cwd: '<%= config.app %>/js'
          src: '{,*/}*.{coffee,litcoffee,coffee.md}'
          dest: '<%= config.app %>/js'
          ext: '.js'
        ]
        options:
          sourceMap: true
    crx:
      octoaudit:
        src: "<%= config.app %>/"
        exclude: ['**/.gitkeep', '**/mozilla-addon*']
        dest: "<%= config.dist %>/crx/"
        privateKey: "~/.ssh/chrome-apps.pem"
    "mozilla-addon-sdk":
      '1_17':
        options:
          revision: "1.17"
          dest_dir: "<%= config.build_tools %>/"
    "mozilla-cfx-xpi":
      xpi:
        options:
          "arguments": "--strip-sdk" # builds smaller xpis
          dist_dir: "<%= config.dist %>/xpi"
          extension_dir: "."
          "mozilla-addon-sdk": "1_17"
    sass:
      build:
        files:
          '<%= config.app %>/css/octoaudit.css':
            '<%= config.app %>/css/octoaudit.scss'
        options:
          sourceMap: true
    watch:
      coffee:
        files: ['<%= config.app %>/js/{,*/}*.{coffee,litcoffee,coffee.md}']
        tasks: ['coffee:build']
        options:
          livereload: true
      sass:
        files: ['<%= config.app %>/css/{,*/}*.scss']
        tasks: ['sass:build']
        options:
          livereload: true
  grunt.registerTask('default', [
    'clean:build'
    'clean:crx'
    'clean:xpi'
    'sass:build'
    'coffee:build'
    'bowercopy'
    'mozilla-addon-sdk'
    'mozilla-cfx-xpi'
    'crx'
  ])
