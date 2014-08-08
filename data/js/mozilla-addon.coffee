# page-mod API
pageMod = require('sdk/page-mod')
# self API
self = require('sdk/self')

pageMod.PageMod
  include: [
    /https:\/\/github\.com\/[^\/]+\/[^\/]+\/(pull|issues)\/.*/
    /https:\/\/[^\/]+\/[^\/]+\/[^\/]+\/(pull|issues)\/.*/
  ],
  contentScriptFile: [
    self.data.url('js/vendor/jquery.min.js')
    self.data.url('js/octoaudit.js')
  ]
  contentStyleFile: self.data.url('css/octoaudit.css')
