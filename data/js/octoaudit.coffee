###! Copyright (C) 2014-2016 Mark Lee under the GPLv3+ ###
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
  return unless $('body').is('.logged-in')

  $desc = $('.timeline-comment:first')

  $desc_edit_button = $desc.find('.js-comment-edit-button')
  return if $desc_edit_button.length == 0

  $desc_textarea = $desc.find('textarea')
  return if $desc_textarea.length == 0

  task_text = ($comment) ->
    text = $comment.find('.js-comment-update textarea').val()
    if text is undefined
      text = $comment
        .find('.comment-body')
        .text()
        .replace(/Nothing to preview\s+$/m, '')
    text.trim().replace(/\s+/gm, ' ')

  simulate_edit_click = (button) ->
    doc = button.ownerDocument
    click_evt = doc.createEvent('MouseEvents')
    click_evt.initMouseEvent('click', true, true, doc.defaultView, 0, 0,
                             0, 0, 0, false, false, false, false, 0, null)
    $desc_edit_button.get(0).dispatchEvent(click_evt)

  update_description_text = (button, $comment) ->
    desc_txt = $desc_textarea.text()
    unless /^## TODO$/m.test(desc_txt)
      desc_txt += '\n## TODO'
    comment_id = $comment.attr('id')
    desc_txt += "\n* [ ] #{task_text($comment)} *([ref](##{comment_id}))*"

    simulate_edit_click(button)
    $desc_textarea.text(desc_txt)

  clone_octicon = (name) ->
    $("svg.octicon-#{name}:first").clone()

  button = $('<button/>')
    .attr(type: 'button', 'aria-label': 'Add as task')
    .addClass('octoaudit-add-task timeline-comment-action')
    .addClass('tooltipped tooltipped-n')
    .append(clone_octicon('plus'))
    .append(clone_octicon('tasklist'))
    .click (event) ->
      button = event.target
      $comment = $(button).closest('.comment')
      update_description_text(button, $comment)

  $('.js-comment.comment:not(:first) .timeline-comment-actions').prepend(button)
