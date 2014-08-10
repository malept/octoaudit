=========
OctoAudit
=========

OctoAudit is a browser extension that allows you to add TODO items from a
GitHub issue/pull request's comments into its summary.

Supported Browsers
------------------

* Firefox
* Chrome/Chromium

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

3. Build the extensions:

.. code-block:: shell-session

    user@host:octoaudit$ grunt

The Firefox extension will be located at ``dist/xpi``. The Chrome extension
will be located at ``dist/crx``.

License
-------

OctoAudit is licensed under the `GNU GPL version 3.0 (or later)`_.

.. _GNU GPL version 3.0 (or later): https://gnu.org/licenses/gpl-3.0.txt
