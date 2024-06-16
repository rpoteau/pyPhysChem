sed -i '/# Files over 50mb/Q' .gitignore
echo "# Files over 50mb" >> .gitignore
find * -size +50M -type f -print >> .gitignore
