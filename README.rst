=========
OctoAudit
=========

.. image:: https://cloud.githubusercontent.com/assets/11417/4160143/1f08edcc-34b3-11e4-8aec-c997ac5cd5cd.png

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
