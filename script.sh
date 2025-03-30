#!/bin/bash

echo "Welcome"
echo "Please Enter the keyword to let me fetch the related Bookmarks"
read VAR


# google chrome browser 

if [ -e ~/.config/google-chrome ]
    then GOOGLE=$(find ~/.config/google-chrome -name "Bookmarks")
    if [ -s "$GOOGLE" ]
          then  grep -i -A2 "$VAR" "$GOOGLE" | grep -v "type" | grep -v "date" | tr -d "{}" | tr -d '"' | tr -d "[]" | tr -d "," >> Bookmark_keeper.md   
    fi
 fi
 
 
 #brave browser
 
  if [ -e ~/.config/BraveSoftware/Brave-Browser ]
    then BRAVE=$(find ~/.config/BraveSoftware/Brave-Browser  -name "Bookmarks")
    if [ -s "$BRAVE" ]
          then  grep -i -A2 "$VAR" "$BRAVE" | grep -v "type" | grep -v "date" | tr -d "{}" | tr -d '"' | tr -d "[]" | tr -d "," >> Bookmark_keeper.md   
    fi
 fi
 
 
 #displaying the URLS
 
 if [ -s Bookmark_keeper.md ]
    then echo "The URLs of the bookmarked sites with the given keywords are"
         cat Bookmark_keeper.md
         rm Bookmark_keeper.md
 else echo "No Bookmarks found with the given keyword"
 fi
