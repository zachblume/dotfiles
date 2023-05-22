source /opt/homebrew/share/antigen/antigen.zsh
source ~/.antigenrc
source ~/.nvm/nvm.sh

cd dev
#export PATH=$PATH:/Users/zachblume/Library/Python/2.7/bin

# opam configuration
[[ ! -r /Users/zachblume/.opam/opam-init/init.zsh ]] || source /Users/zachblume/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/zachblume/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/zachblume/Downloads/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/Users/zachblume/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/zachblume/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

dev(){npm run dev}

p() {
export PGPASSWORD='mg!!HrcWBG578hD'; export PGUSER=postgres; psql -h db.hhvadsbsmfeutnvgvnrj.supabase.co -p 5432 -d postgres -U postgres }

perf(){
time=$(curl -w "%{time_total}" -o /dev/null -s $1)
ans=$(($time*1000))
printf "%.*f\n" 0 $ans
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

gorun (){go run main.go}
#alias python=/opt/homebrew/bin/python3
#export PATH="$PATH:/opt/homebrew/bin/"
#export PYTHON_BIN_PATH="$(python3 -m site --user-base)/bin"
#export PATH="$PATH:$PYTHON_BIN_PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

e() { micro $1 }

#python paths
# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Homebrew: Python
export PATH="/opt/homebrew/opt/python/libexec/bin:$PATH"
export PATH=/Users/zachblume/bin:$PATH

unalias -m 'g'
g() {
	git add . 
	git commit -m $1
	git push
	npm run dev
	}