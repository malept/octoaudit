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
$ ->
  if $('body').is('.logged_in')
    create_add_issue_button = ->
      $('<button/>')
        .text('add as task')
        .addClass('add-to-octoreviewer')
        .click (event) ->
          $button = $(event.target)
          $comment = $button.closest('.comment')
          desc_txt = $desc_textarea.text()
          unless /^## TODO$/m.test(desc_txt)
            desc_txt += '\n## TODO'
          item_text = $comment.find('.comment-body').text()
                              .trim().replace(/\s+/gm, ' ')
          desc_txt += "\n* [ ] #{item_text} *([ref](##{$comment.attr('id')}))*"
          click_evt = document.createEvent("MouseEvents")
          click_evt.initMouseEvent('click', true, true, window, 0, 0, 0, 0, 0,
                                   false, false, false, false, 0, null)
          $desc.find('.js-comment-edit-button').get(0).dispatchEvent(click_evt)
          $desc_textarea.text(desc_txt)

    $desc = $('.timeline-comment:first')
    $desc_textarea = $desc.find('textarea')
    return if $desc_textarea.length == 0

    $('.timeline-comment:not(:first):not(:last) .timeline-comment-header-text')
      .before(create_add_issue_button())
