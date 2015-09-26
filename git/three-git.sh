#!/usr/bin/env sh

# Sets up a git repository with GitHub, BitBucket and Launchpad, with the main
# origin set to GitHub.

# Public Domain or CC0


projectName=$(dialog --stdout --trim --inputbox "Please enter the project name." 7 70)


addRepository() {
	username=$(dialog --stdout --trim --inputbox "Please enter your $1 username." 7 70)
	url=$(echo -n "$2" | sed "s/USERNAME/$username/g" | sed "s/PROJECT_NAME/$projectName/g")
	
	remote_name=$(echo "$1" | sed "s/\(.*\)/\L\1/g")
	
	# Remove the remote first if it already exists.
	$(git remote show | grep --quiet "$remote_name")
	if [ $? -eq 0 ]; then
		git remote remove "$remote_name"
	fi
	
	git remote add "$remote_name" "$url"
	
	# Add the URL to the origin.
	if [ -z "$3" ]; then
		git remote set-url origin --add "$url"
	else
		$(git remote show | grep --quiet "origin")
		if [ $? -eq 0 ]; then
			git remote remove origin
		fi
		
		git remote add origin "$url"
	fi
}

testRepository() {
	remote_name=$(echo "$1" | sed "s/\(.*\)/\L\1/g")
	
	/bin/echo -n "Testing \"$remote_name\": "
	
	$(git ls-remote $remote_name > /dev/null 2>&1)
	if [ $? -ne 0 ]; then
		echo "FAILED"
	else
		echo "OK"
	fi
}


# Check if here is already a repository.
$(git rev-parse > /dev/null 2>&1)
if [ $? -ne 0 ]; then
	git init
fi

addRepository "GitHub" "git@github.com:USERNAME/PROJECT_NAME.git" "default"
addRepository "BitBucket" "git@bitbucket.org:USERNAME/PROJECT_NAME.git"
addRepository "Launchpad" "git+ssh://USERNAME@git.launchpad.net/PROJECT_NAME"

git remote -v

echo ""

testRepository "GitHub"
testRepository "BitBucket"
testRepository "Launchpad"

