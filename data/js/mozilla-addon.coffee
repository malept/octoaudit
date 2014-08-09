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
