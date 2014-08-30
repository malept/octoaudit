###! Copyright (C) 2014 Mark Lee under the GPLv3+ ###
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

module.exports = (grunt) ->
  # Load grunt tasks automatically
  require('load-grunt-tasks')(grunt)

  # Configurable paths
  config =
    app: 'data'
    build: 'build'
    build_tools: 'build_tools'
    dist: 'dist'

  grunt.initConfig
    config: config
    pkg: grunt.file.readJSON('package.json')

    clean:
      build:
        src: [
          '<%= config.app %>/**/*.map'
          '<%= config.app %>/css/*.css'
          '<%= config.app %>/js/*.js'
          '<%= config.app %>/js/vendor/*.js'
          '<%= config.build %>'
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
    copy:
      octoaudit:
        files: [
          {
            cwd: '<%= config.app %>'
            expand: true
            src: [
              'css/**'
              'js/**'
            ]
            dest: '<%= config.build %>/octoaudit'
          }
        ]
      octoaudit_enterprise:
        files: [
          {
            cwd: '<%= config.app %>'
            expand: true
            src: [
              'css/**'
              'js/**'
            ]
            dest: '<%= config.build %>/octoaudit_enterprise'
          }
        ]
    crx:
      octoaudit:
        src: "<%= config.build %>/octoaudit"
        exclude: ['**/.gitkeep', '**/mozilla-addon*']
        dest: "<%= config.dist %>/crx/"
        filename: "octoaudit-<%= pkg.version %>.crx"
        privateKey: "~/.ssh/chrome-apps.pem"
      octoaudit_enterprise:
        src: "<%= config.build %>/octoaudit_enterprise"
        exclude: ['**/.gitkeep', '**/mozilla-addon*']
        dest: "<%= config.dist %>/crx/"
        filename: "octoaudit_enterprise-<%= pkg.version %>.crx"
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
    npmcopy:
      libs:
        files:
          'jquery.min.js': 'jquery/dist/cdn/jquery-<%= pkg.devDependencies.jquery.slice(1) %>.min.js'
        options:
          destPrefix: '<%= config.app %>/js/vendor'
    sass:
      build:
        files:
          '<%= config.app %>/css/octoaudit.css':
            '<%= config.app %>/css/octoaudit.scss'
        options:
          sourceMap: true
    template:
      octoaudit:
        files:
          '<%= config.build %>/octoaudit/manifest.json':
            ['<%= config.app %>/manifest.json.tmpl']
        options:
          data:
            name: 'OctoAudit'
            url_matches: '"https://github.com/*/*/pull/*",
                          "https://github.com/*/*/issues/*"'
            target_app: 'GitHub'
            version: '<%= pkg.version %>'
      octoaudit_enterprise:
        files:
          '<%= config.build %>/octoaudit_enterprise/manifest.json':
            ['<%= config.app %>/manifest.json.tmpl']
        options:
          data:
            name: 'OctoAudit Enterprise'
            url_matches: '"*://*/*/*/pull/*", "*://*/*/*/issues/*"'
            target_app: 'GitHub Enterprise'
            version: '<%= pkg.version %>'
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
    'npmcopy'
    'copy'
    'template'
    'mozilla-addon-sdk'
    'mozilla-cfx-xpi'
    'crx'
  ])
