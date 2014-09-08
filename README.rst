=========
OctoAudit
=========

.. image:: https://cloud.githubusercontent.com/assets/11417/4160143/1f08edcc-34b3-11e4-8aec-c997ac5cd5cd.png

OctoAudit is a browser extension that allows you to add TODO items from a
GitHub issue/pull request's comments into its summary.

I'm a fan of `Review Board`_ and was disappointed that GitHub didn't have the
equivalent of code review issue tracking, so I decided to make a simple
version of it.

.. _Review Board: https://www.reviewboard.org/

Supported Browsers
------------------

* Firefox
* Chrome/Chromium

Installation
------------

There are two methods of installation:

1. Install from your browser's extension website:

   * Firefox_
   * Chrome_ (currently only the GitHub extension has been published, not the
     GitHub Enterprise one)
2. `Build from source`_

.. _Firefox: https://addons.mozilla.org/en-US/firefox/addon/octoaudit
.. _Chrome: https://chrome.google.com/webstore/detail/octoaudit/mhjlfnkgphdkfkejplmjlofdhgpeenfg
.. _Build from source: #building-the-extensions

Usage
-----

1. Go to an issue or pull request where you can edit the summary.
2. To add one of the comments to the summary, click the "add as task" in the
   top right part of the comment box. It will switch the summary text into edit
   mode, add a TODO header if one does not exist, then append a checklist item
   with the text of the comment in it.

.. figure:: https://addons.cdn.mozilla.net/user-media/previews/full/142/142712.png?modified=1409890908
   :alt: [Screenshot]

   The screenshot shows the "add as task" button (depressed), and the newly
   created TODO header plus checklist item generated from the comment plaintext
   (not its source markdown).

Building the extensions
-----------------------

Dependencies
~~~~~~~~~~~~

* Node.js/NPM
* Grunt_

.. _Grunt: http://gruntjs.com/

Instructions
~~~~~~~~~~~~

1. Check out the git repository:

.. code-block:: shell-session

    user@host:~$ git clone https://github.com/malept/octoaudit.git

2. Install Gruntfile dependencies:

.. code-block:: shell-session

    user@host:~$ cd octoaudit
    user@host:octoaudit$ npm install

3. Create a private key for the Chrome extensions:

.. code-block:: shell-session

    user@host:octoaudit$ node_modules/.bin/crx keygen .
    user@host:octoaudit$ mv key.pem ~/.ssh/chrome-apps.pem

4. Build the extensions:

.. code-block:: shell-session

    user@host:octoaudit$ grunt

The Firefox extension will be located at ``dist/xpi``. The Chrome extensions
(one for GitHub, one for GitHub Enterprise) will be located at ``dist/crx``.

License
-------

OctoAudit is licensed under the `GNU GPL version 3.0 (or later)`_.

The logo is licensed under the `GNU GPL version 2.0`_ (due to the fact that it
uses ``evolution-tasks.svg`` from gnome-colors_).

.. _GNU GPL version 3.0 (or later): https://gnu.org/licenses/gpl-3.0.txt
.. _GNU GPL version 2.0: https://gnu.org/licenses/gpl-2.0.txt
.. _gnome-colors: https://code.google.com/p/gnome-colors/
