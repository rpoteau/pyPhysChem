echo "# Files over 50mb" >> .gitignore
find * -size +50M -type f -print >> .gitignore
