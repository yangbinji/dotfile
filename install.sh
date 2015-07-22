# --- Aix Vim Install Shell ---

# Shell for Install Aix Vim config
# Require Git and Auto Install Vundle

printf "\033[33mChecking Start...\033[0m\n"

printf "\033[36mChecking Git install...\033[0m\n"
hash git 2>/dev/null || { echo >&2 "Require Git is not installed! Please install Git before you prefix config aix"; exit 1; }
git --version
printf "\033[36mChecking Git Completed!\033[0m\n"

printf "\033[33mChecking Dir\033[0m\n"
if [ ! -d "$HOME/.vim" ]; then
	echo "Make ALL with $HOME Directory PATH"
	printf "\n"
	echo " [- .vim"
	echo "   |- bundle  [ -- Manager Plugin -- ]"
	echo "   |- undo    [ -- Generator Undo file -- ]"
	echo "   |- tags    [ -- Generator Tag file -- ]"
	echo "   |- session [ -- Session directory -- ]"
	echo " -] "
	printf "\n"
	
	mkdir $HOME/.vim
	mkdir $HOME/.vim/bundle
	mkdir $HOME/.vim/undo
	mkdir $HOME/.vim/tags
	mkdir $HOME/.vim/session
fi

if [ ! -d "$HOME/.vim/bundle" ]; then
	echo "Make dir -- bundle"
	mkdir $HOME/.vim/bundle
fi

if [ ! -d "$HOME/.vim/undo" ]; then
	echo "Make dir -- [ undo ]"
	mkdir $HOME/.vim/undo
fi

if [ ! -d "$HOME/.vim/tags" ]; then
	echo "Make dir -- [ tags ]"
	mkdir $HOME/.vim/tags
fi

if [ ! -d "$HOME/.vim/session" ]; then
	echo "Make dir -- [ session ]"
	mkdir $HOME/.vim/session
fi

printf "\033[33mChecking Vundle Exist?\033[0m\n"
if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then
	echo "Clone Vundle Plugin..."
	git clone https://github.com/VundleVim/Vundle.vim $HOME/.vim/bundle/Vundle.vim
	echo "Clone J ColorSheme..."
	git clone https://github.com/DemonCloud/J $HOME/.vim/bundle/J
	printf "\033[33mVundle has Install && Exist\033[0m\n"
fi
printf "\033[33mChecking Completed!\033[0m\n"

printf "\033[36mCopy new files to the HOME PATH...\033[0m\n"

printf "\n"
echo " [- $HOME/"
echo "   |- .vimrc       [ -- Vim config -- ]"
echo "   |- .nvimrc      [ -- NeoVim config -- ]"
echo "   |- .tmux.conf   [ -- Tmux config -- ]"
echo "   |- .fonts.conf  [ -- Fonts support -- ]"
echo " -] "
printf "\n"

# Copy file in to path
cp -rf aix $HOME/

if [ ! -f "$HOME/.fonts.conf" ]; then
	cp -f .fonts.conf $HOME/
fi

cp -f .vimrc $HOME/
cp -f .nvimrc $HOME/

if [ ! -f "$HOME/.tmux.conf" ]; then
	cp -f .tmux.conf $HOME/
fi

printf "\033[36mCopy Completed, Finish Install !\033[0m\n"
exit 1;

