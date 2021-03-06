# Environment parameters
firmware_dir='~/firmware'
username='jhongpananon'
ecu_type='STINV'

export PATH=$PATH:$HOME/bin

# Modified typical git commands
alias diff='LESS=RS git log -p --color-words'
alias gporc='echo "5" >> ~/.time_saved.txt; funcgporc'
alias gcorc='echo "5" >> ~/.time_saved.txt; funcgcorc'
alias gpod='echo "5" >> ~/.time_saved.txt; funcgpod'
alias gcod='echo "5" >> ~/.time_saved.txt; funcgcod'
alias gcodf='echo "5" >> ~/.time_saved.txt; funcgcodf'
alias gcobdcbc='echo "5" >> ~/.time_saved.txt; funcgcobdcbc'
alias gcobinv='echo "5" >> ~/.time_saved.txt; funcgcobinv'
alias gcobstst='echo "5" >> ~/.time_saved.txt; funcgcobstst'
alias gcodcbc='echo "5" >> ~/.time_saved.txt; funcgcodcbc'
alias gcoinv='echo "5" >> ~/.time_saved.txt; funcgcoinv'
alias gcoinvf='echo "5" >> ~/.time_saved.txt; funcgcoinvf'
alias gcostst='echo "5" >> ~/.time_saved.txt; funcgcostst'
alias gs='echo "0.5" >> ~/.time_saved.txt; git status --branch'
alias gss='echo "0.5" >> ~/.time_saved.txt; git status --short --branch'
alias gd='echo "0.5" >> ~/.time_saved.txt; git diff '
alias gpo='echo "2" >> ~/.time_saved.txt; git pull origin '
alias gpoh='echo "2" >> ~/.time_saved.txt; git push origin HEAD'
alias gpohf='echo "3" >> ~/.time_saved.txt; git push origin HEAD --force-with-lease'
alias gpodel='echo "3" >> ~/.time_saved.txt; git push origin --delete '
alias ga='echo "0.5" >> ~/.time_saved.txt; git add '
alias gc='echo "0.5" >> ~/.time_saved.txt; git commit'
alias gcm='echo "2" >> ~/.time_saved.txt; git commit -m'
alias gcan='echo "5" >> ~/.time_saved.txt; git commit --amend --no-edit'
alias gco='echo "1" >> ~/.time_saved.txt; git checkout '
alias gcob='echo "1.5" >> ~/.time_saved.txt; git checkout -b'
alias glogp='echo "1" >> ~/.time_saved.txt; git log --pretty=format:"%h %s" --graph'
alias gf='echo "0.5" >> ~/.time_saved.txt; git fetch'
alias grm='echo "2" >> ~/.time_saved.txt; git remote update'
alias gsu='echo "2" >> ~/.time_saved.txt; git submodule update'
alias gcp='echo "2" >> ~/.time_saved.txt; git cherry-pick '
alias gcpc='echo "2" >> ~/.time_saved.txt; git cherry-pick --continue'
alias gcpa='echo "2" >> ~/.time_saved.txt; git cherry-pick --abort'
alias gm='echo "1" >> ~/.time_saved.txt; git merge '
alias gmorc='echo "1" >> ~/.time_saved.txt; funcgmorc'
alias gma='echo "1.5" >> ~/.time_saved.txt; git merge --abort'
alias gb='echo "1" >> ~/.time_saved.txt; git branch'
alias gbd='echo "2" >> ~/.time_saved.txt; git branch -D '
alias grm='echo "0.5" >> ~/.time_saved.txt; git rm '
alias gr='echo "0.5" >> ~/.time_saved.txt; git rebase '
alias gri='echo "2" >> ~/.time_saved.txt; funcgri'
alias grc='echo "2" >> ~/.time_saved.txt; git rebase --continue'
alias gra='echo "2" >> ~/.time_saved.txt; git rebase --abort'
alias grorc='echo "3" >> ~/.time_saved.txt; funcgrorc'
alias grod='echo "3" >> ~/.time_saved.txt; funcgrod'
alias cdfwp='echo "10" >> ~/.time_saved.txt; cd /c/fw_packager'
alias gcfdx='echo "1" >> ~/.time_saved.txt; git clean -ffdx'
alias gcclean='git clean -f -f -d ./'
alias grhh='echo "2" >> ~/.time_saved.txt; git reset --hard HEAD'
alias grhh^='echo "2" >> ~/.time_saved.txt; git reset --hard HEAD^'
alias grsh='echo "2" >> ~/.time_saved.txt; git reset --soft HEAD'
alias grh='echo "1" >> ~/.time_saved.txt; git reset HEAD '
alias gstash='echo "1" >> ~/.time_saved.txt; git stash'
alias gstaash='echo "1" >> ~/.time_saved.txt; git stash --include-untracked'
alias gstp='echo "1" >> ~/.time_saved.txt; git stash pop'
alias rmlock='echo "echo "5" >> ~/.time_saved.txt; rm -rf ${firmware_dir}/.git/index.lock'

# Miscellaneous
alias ts='echo "0.5" >> ~/.time_saved.txt; cdt; ./ts '
functsi() { rake test_single[../code/test_$1.c] ; }
alias tsi='echo "0.5" >> ~/.time_saved.txt; cdti; cd rake; functsi '
alias howmuchpingpongcaniplay='awk '"'"'{x+=$0}END{print "You can play ping pong a total of " x / (60 * 60) " hours equivalent to " x / (60) " minutes or " x " seconds"}'"'"' ~/.time_saved.txt'
alias gam='echo "20" >> ~/.time_saved.txt; git status | grep "modified:" | awk '"'"'{ print $2; }'"'"' | xargs git add'
alias gabm='echo "20" >> ~/.time_saved.txt; git status | grep "both modified:" | awk '"'"'{ print $3; }'"'"' | xargs git add'
alias gamcan='echo "28" >> ~/.time_saved.txt; gam; gcan; gpohf'
alias newmodule='echo "60" >> ~/.time_saved.txt; ~/./newmodule.sh' # Create a .h, .c, and test_.c file
alias cmdh='history | awk '"'"'{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}'"'"' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n10' # Statistics of command history
alias gln='echo "1" >> ~/.time_saved.txt; funcgln' # git log -1
alias sb='echo "20" >> ~/.time_saved.txt; funcsquashbase' # Interactive base with all commits since branch/checkout
alias gblist='echo "1" >> ~/.time_saved.txt; git for-each-ref --sort='"'"'-authordate'"'"' --format='"'"'%(authordate)%09%(objectname:short)%09%(refname)'"'"' refs/heads | sed -e '"'"'s-refs/heads/--'"'"'' # List all branches in order of most recently used
alias search='echo "10" >> ~/.time_saved.txt; git ls-tree -r --name-only HEAD | grep --color $1' # Search for a given file in all of git repo
alias gdlc='echo "10" >> ~/.time_saved.txt; funcgdlc' # git diff last commit on a given file
alias glog='echo "1" >> ~/.time_saved.txt; git log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=short' # git log nice format
alias la='funcla alias' # List all aliases in this file on the terminal
alias gplease='echo "2" >> ~/.time_saved.txt; git push origin HEAD --force-with-lease' # Checks local copy is up to date before pushing
alias normal='cddbc; python ~/firmware/platforms/normalize_all_dbc.py '
funbclean() { bname=$1; git branch --merged ${1-$bname} | grep -v " ${1-$bname}$" | xargs -r git branch -d ; }
alias bclean='echo "10" >> ~/.time_saved.txt; funbclean'
alias release='echo "5" >> ~/.time_saved.txt; sed -n -e 2p ~/firmware/release-metadata/version-descriptors/by-product/TeslaEnergy/release.xml'
alias refresh='cscope -R -b'

# `git add` a file just by typing the name of the file. This will search for the full path name and paste it for you
alias gas='echo "10" >> ~/.time_saved.txt; funcgas'
# open a file with vim just by specifying the name
alias vims='echo "5" >> ~/.time_saved.txt; funcvims'

# Clean up branches that are already merged. Works by pruning your tracking branches then deleting the local ones that show they are "gone" in git branch -vv
merged_branches_soft(){ git fetch -p && git branch -vv | awk '/: gone]/{print $1}' | xargs git branch -d ; }
merged_branches_hard(){ git fetch -p && git branch -vv | awk '/: gone]/{print $1}' | xargs git branch -D ; }
alias gbcsoft='merged_branches_soft;'
alias gbchard='merged_branches_hard;'

# Navigation shortcuts
funcdf() { cd ${firmware_dir} ; }
alias cdf='echo "2" >> ~/.time_saved.txt; funcdf'
funcdb() { cd ~/ensemble_bc; }
alias cdb='echo "2" >> ~/.time_saved.txt; funcdb'
funcdm() { cd ~/ensemble_mats; }
alias cdm='echo "2" >> ~/.time_saved.txt; funcdm'
funcdtest() { cd ~/te-fw-tests ; }
alias cdtest='funcdtest '
funcdp() { cd ${firmware_dir}/platforms/TeslaEnergy/proto ; }
alias cdp='echo "10" >> ~/.time_saved.txt; funcdp'
funcddbc() { cd ${firmware_dir}/platforms/TeslaEnergy/DBC ; }
alias cddbc='echo "10" >> ~/.time_saved.txt; funcddbc'
funcdgrid() { cd ${firmware_dir}/platforms/TeslaEnergy/GridCode ; }
alias cdgrid='echo "10" >> ~/.time_saved.txt; funcdgrid'
funcdproto() { cd ${firmware_dir}/platforms/TeslaEnergy/proto; }
alias cdproto='echo "10" >> ~/.time_saved.txt; funcdproto'
funcdt() { cd ${firmware_dir}/components/stationary/STDCBC/test/ ; cscope -R -b ; }
alias cdt='echo "10" >> ~/.time_saved.txt; funcdt'
funcddcbc() { cd ${firmware_dir}/components/stationary/STDCBC/ ; cscope -R -b ; }
alias cddcbc='echo "10" >> ~/.time_saved.txt; funcddcbc'
funcdscbc() { cd ${firmware_dir}/components/stationary/STSCBC/ ; cscope -R -b ; }
alias cdscbc='echo "10" >> ~/.time_saved.txt; funcdscbc'
funcdinv() { cd ${firmware_dir}/components/stationary/STINV/src ; cscope -R -b ; }
alias cdinv='echo "10" >> ~/.time_saved.txt; funcdinv'
funcdpod() { cd ${firmware_dir}/components/stationary/STPOD/ ; cscope -R -b ; }
alias cdpod='echo "10" >> ~/.time_saved.txt; funcdpod'
funcdti() { cd ${firmware_dir}/components/stationary/STINV/src/test/rake ; }
alias cdti='echo "10" >> ~/.time_saved.txt; funcdti'
funccdscbc() { cd ${firmware_dir}/components/stationary/STSCBC/ ; cscope -R -b ; }
alias cdscbc='echo "10" >> ~/.time_saved.txt; funccdscbc'
funccdmisra() { cd ~/misra_analysis/ ; }
alias cdmisra='echo "10" >> ~/.time_saved.txt; funccdmisra'

# Package a built stdcbc.hex file into a .zip seed package for fwupdate
# execute from the "firmware" directory. The .zip will be placed in the parent home directory
funcbhx() { python components/stationary/STDCBC/test/python/bhx_packager.py -o ~/.; }
alias dcbcpack='echo "10" >> ~/.time_saved.txt; funcbhx'

funcdcbcup() { ~/dcbc_update -vins TESLA-DCBC-D14 -artifacts ~/dcbc_dev_fw.zip -port 8088 ; }
alias dcbcup='echo "120" >> ~/.time_saved.txt; funcdcbcup'

funcpackup() { python components/stationary/STDCBC/test/python/bhx_packager.py -o ~/.; ~/dcbc_update -vins TESLA-DCBC-D14 -artifacts ~/dcbc_dev_fw.zip -port 8088 ; }
alias packup='echo "130" >> ~/.time_saved.txt; dcbcpack; dcbcup;'

alias dcbc4005='echo "1" >> ~/.time_saved.txt; nc TESLA-DCBC-D14 4005'
alias dcbc5004='echo "1" >> ~/.time_saved.txt; nc TESLA-DCBC-D14 5004'

# Build specific commands
alias flashbc='sh ~/flash-e3 ~/ensemble_bc/obj-cross/platform/encharge/encharge.hex'
alias flashmats='sh ~/flash-e3 ~/ensemble_mats/obj-cross/platform/enpower/enpower.hex'
alias c='echo "10" >> ~/.time_saved.txt; cdf; scons --whitelisted_components=${ecu_type} --config-id=1 --nolint --no_unit_test --cache-disable -j40 -c; cd -'
alias bc8='make CROSS=1 encharge -j8'
alias bcv8='make CROSS=1 encharge VERBOSE=1 -j8'
alias bc1='make CROSS=1 encharge -j1'
alias bcv1='make CROSS=1 encharge VERBOSE=1 -j1'
alias bcut='make ut'
alias mats8='make CROSS=1 enpower -j8'
alias matsv8='make CROSS=1 enpower VERBOSE=1 -j8'
alias mats1='make CROSS=1 enpower -j1'
alias matsv1='make CROSS=1 enpower VERBOSE=1 -j1'
alias matsut='make ut'

# Rip grep search tool
alias r='echo "5" >> ~/.time_saved.txt; ~/rg '
    
# Force tmux to use 256 colors for vim color schemes
alias tmux='tmux -2'
alias v='/usr/local/bin/vim'

# Function definitions
funcgporc() {
    git pull origin teslaenergy/rc/$1;
}
funcgcorc() {
    git checkout origin teslaenergy/rc/$1;
}
funcgpod() {
    git pull origin develop/Energy-$1;
}
funcgcod() {
    git checkout develop/Energy-$1;
}
funcgcodf() {
    git checkout develop/Energy-$1 -f;
}
funcwlt1() {
    scons --config_map=${ecu_type}:1 --whitelisted-tests=$1;
}
funcwlt2() {
    scons --config_map=${ecu_type}:2 --whitelisted-tests=$1;
}
funcwlt3() {
    scons --config_map=${ecu_type}:4 --whitelisted-tests=$1;
}
funcwlt4i() {
    scons --config_map=stinv:4 --whitelisted-tests=$1;
}
funcwlt6i() {
    scons --config_map=stinv:6 --whitelisted-tests=$1;
}
funcwlt7i() {
    scons --config_map=stinv:7 --whitelisted-tests=$1;
}
funcgcostst() {
    git checkout ENERGY/${ecu_type}/user/${username}/STST-$1;
}
funcgcobdcbc() {
    git checkout -b STDCBC/user/${username}/STST-$1;
}
funcgcobinv() {
    git checkout -b STINV/user/${username}/STST-$1;
}
funcgcobstst() {
    git checkout -b ENERGY/STDCBC/STINV/user/${username}/STST-$1;
}
funcgcodcbc() {
    git checkout STDCBC/user/${username}/STST-$1;
}
funcgcoinv() {
    git checkout STINV/user/${username}/STST-$1;
}
funcgcoinvf() {
    git checkout STINV/user/${username}/STST-$1 -f;
}
funcgcostst() {
    git checkout ENERGY/STDCBC/STINV/user/${username}/STST-$1;
}
funcgmorc() {     
    git merge origin/teslaenergy/rc/$1;
}
funcgri() {
    git rebase -i HEAD~$1;
}
funcgrorc() {
    git rebase origin/teslaenergy/rc/$1;
}
funcgrod() {
    git rebase origin/develop/Energy-$1;
}
funcgln() {
    git log -$1;
}
funccount() {
    compareBranch=${1-master};
    git rev-list --count HEAD ^$compareBranch;
}
funcsquashbase() {
    branch_name=${1-master};
    commit_count=$(funccount $branch_name)
    git rebase -i HEAD~$commit_count;
}
funcgdlc() {
    project_root_dir=$(git rev-parse --show-toplevel); \
    echo finding full file path of $1 in $project_root_dir; \
    filepath=$(find $project_root_dir -type f -name $1); \
    echo full file path $filepath; \
    last_modified_commit_hash=$(git rev-list -1 HEAD $filepath); \
    echo last commit file modified $last_modified_commit_hash; \
    git difftool $last_modified_commit_hash^ $filepath; \
}
funcla () { 
    grep --no-filename -i -a1 $@ ~/.bashrc  | grep -v '^\s*$' ; 
}

funcgas() {
    project_root_dir=$(git rev-parse --show-toplevel);       \
    filepath=$(find $project_root_dir -type f -name $1);     \
    echo added to stage commit: $filepath;                    \
    git add $filepath;                                          \
}
funcvims() {
    project_root_dir=$(git rev-parse --show-toplevel);       \
    filepath=$(find $project_root_dir -type f -name $1);     \
    echo "Found the file you're looking for!";              \
    vim $filepath;                                          \
}

