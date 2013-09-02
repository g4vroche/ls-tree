ls-tree
=======

Shell script to display a tree representation of a folder
                                     
  Setup:                                             
     $ cd ~/somewhere/ls-tree                               
     $ chmod u+x tree.sh               
     $ ln -s ~/somewhere/ls-tree/tree.sh ~/bin/tree          
     $ echo "PATH=~/bin:\${PATH}" >> ~/.profile      
                                                     
  Usage:                                             
     $ tree [-d <max-depth>] [-s <indent style>] [directory]                              
                                                     
  Examples:                                          
     $ tree                                          
     $ tree -d 2 -s ".." /etc/opt                                 
                                      
                                                     

This is based on ls -R and grep/sed rather than doing things recursiv way, thus it gets slow on big trees, event if you set a max-depth

