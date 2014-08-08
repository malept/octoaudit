// vim: set ft=javascript ts=2 sts=2 sw=2 :
// jshint node: true
'use strict';
module.exports = function (grunt) {
  // Load grunt tasks automatically
  require('load-grunt-tasks')(grunt);

  // Configurable paths
  var config = {
    app: 'data',
    dist: 'dist'
  };

  grunt.initConfig({
    config: config,
    bowercopy: {
      options: {
        clean: true
      },
      libs: {
        files: {
          'jquery.min.js': 'jquery/dist/jquery.min.js',
          'jquery.min.map': 'jquery/dist/jquery.min.map'
        },
        options: {
          destPrefix: '<%= config.app %>/js/vendor'
        }
      }
    },
    clean: {
      build: {
        src: [
          '<%= config.app %>/**/*.map',
          '<%= config.app %>/css/*.css',
          '<%= config.app %>/js/*.js',
          '<%= config.app %>/js/vendor/*.js'
        ]
      },
      crx: {
        src: ['<%= config.dist %>/crx/*.crx']
      }
    },
    // Compiles CoffeeScript to JavaScript
    coffee: {
      build: {
        files: [{
          expand: true,
          cwd: '<%= config.app %>/js',
          src: '{,*/}*.{coffee,litcoffee,coffee.md}',
          dest: '<%= config.app %>/js',
          ext: '.js'
        }],
        options: {
          sourceMap: true
        }
      }
    },
    crx: {
      octoaudit: {
        src: "<%= config.app %>/",
        exclude: ['**/.gitkeep'],
        dest: "<%= config.dist %>/crx/",
        privateKey: "~/.ssh/chrome-apps.pem"
      }
    },
    sass: {
      build: {
        files: {
          '<%= config.app %>/css/octoaudit.css': '<%= config.app %>/css/octoaudit.scss'
        },
        options: {
          sourceMap: true
        }
      }
    },
    watch: {
      coffee: {
        files: ['<%= config.app %>/js/{,*/}*.{coffee,litcoffee,coffee.md}'],
        tasks: ['coffee:build'],
        options: {
          livereload: true
        }
      },
      sass: {
        files: ['<%= config.app %>/css/{,*/}*.scss'],
        tasks: ['sass:build'],
        options: {
          livereload: true
        }
      }
    }
  });
  grunt.registerTask('default', [
    'clean',
    'sass:build',
    'coffee:build',
    'bowercopy',
    'crx'
  ]);
};
