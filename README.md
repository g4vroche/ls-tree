ls-tree
=======

Display a tree representation of a folder

My modifiaitons to original script by Dem Pilafian.

http://www.centerkey.com/tree

This tiny script uses "ls", "grep", and "sed"      
in a single command to show the nesting of         
sub-directories.  The setup command for PATH       
works with the Bash shell (the Mac OS X default).  
                                                    
  Setup:                                             
     $ cd ~/apps/tree                                
     $ chmod u+x tree.sh                             
     $ ln -s ~/apps/tree/tree.sh ~/bin/tree          
     $ echo "PATH=~/bin:\${PATH}" >> ~/.profile      
                                                     
  Usage:                                             
     $ tree [directory]                              
                                                     
  Examples:                                          
     $ tree                                          
     $ tree /etc/opt                                 
     $ tree ..                                       
                                                     


