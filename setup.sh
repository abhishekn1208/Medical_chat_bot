#setup.sh
#===================================================================

set -e #stop the script completely if any command fails

echo "creating the project structure...." # it will just print on the terminal to show that the process has been started

#let's create the top level folders

mkdir -p backend #The -p flag means "don't complain if it already exists
mkdir -p data #to keep the book pdf file
mkdir -p frontend


#--------Backend python package files
#touch creates an empty file if it doesn't exist yet.
touch backend/__init__.py
#The __init__.py file lets the python recognize the backend folder as a python package module
#it can be blank
#wihout this, you cannot import the modules from another folder, for example if you want to import app from backend/app.py, it will give you an error
#this file is being a constructor of your package or directory

if [ ! -f .env ]; then
    cp .env.example .env
    echo "Created .env from the .env.example --fill you api keys "
#if the file .env does NOT exist yet, then copy .env.example to .env."

fi


# ---- Git ignore file (protects secrets from being committed) ----
if [ ! -f .gitignore ]; then
    cat > .gitignore << 'EOF'
# Python
venv/
__pycache__/
*.pyc

# Secrets
.env

# Node / React
frontend/node_modules/
frontend/dist/

# OS junk
.DS_Store
EOF
    echo "Created .gitignore"
fi

#What's new here that you haven't used yet — cat > file << 'EOF':

#This is called a "heredoc." It's a way to write multiple lines of text into a file, right inside your script. Breaking it down:

#cat — normally prints a file's content, but here it's just receiving text
# > — redirects that output into a new file instead of the screen
# << 'EOF' — means "everything typed below, until you see the word EOF again, counts as input"
# The final EOF on its own line — marks the end

