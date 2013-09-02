ls-tree
=======

Shell script to display a tree representation of a folder
              
This is based on ls -R and grep/sed rather than doing things recursiv way, thus it gets slow on big trees, event if you set a max-depth
             
  Setup:

    $ cd ~/somewhere/ls-tree
    $ chmod u+x tree.sh
    $ ln -s ~/somewhere/ls-tree/tree.sh ~/bin/tree
    $ echo "PATH=~/bin:\${PATH}" >> ~/.profile
                                                     
  Usage:

    $ tree [-d <max-depth>] [-s <indent style>] [directory]

  Examples:

    $ tree -d 2 -s ".." vendor/
    john@doe/some/path$ tree -s ".." -d 2 vendor/
    /some/path/vendor
    .. autoload.php
     composer
    .. autoload_classmap.php
    .. autoload_namespaces.php
    .. autoload_real.php
    .. ClassLoader.php
    .. installed.json
     michelf
    .. php-markdown
    .... composer.json
    .... License.md
    .... Readme.md
    .... Readme.php
    .... Michelf
