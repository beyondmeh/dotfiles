UPDATE_AFTER=86400 # 1 day in seconds
TIME=$(date +%s)

# find last modification time for a normal git repo,
# which should match it's last fetch
if [ -f "$HOME/.git/FETCH_HEAD" ]; then
	if uname | grep -q 'FreeBSD\|Darwin'; then
		# BSD / macOS
		LAST_FETCH=$(stat -f %m "$HOME/.git/FETCH_HEAD")
	else
		# GNU coreutils
		LAST_FETCH=$(stat -c %Y "$HOME/.git/FETCH_HEAD")
	fi
else
	LAST_FETCH=0
fi

if ((TIME - LAST_FETCH >= UPDATE_AFTER)); then
  # run in a subshell to avoid changing our current working dir
  (cd $HOME && git pull) > /dev/null
fi
