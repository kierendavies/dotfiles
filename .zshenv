export ZDOTDIR=~/dotfiles

export PATH=~/bin:$PATH
export PATH=$PATH:$(ruby -rubygems -e "puts Gem.user_dir")/bin

export LANG=en_ZA.UTF-8
export TERM=rxvt-unicode
export EDITOR=vim
export VISUAL=vim

if [ -f ~/.aws/credentials ]; then
    aws_section=default
    aws_section_found=false
    while read line; do
        if [[ $line == "[$aws_section]" ]]; then
             aws_section_found=true
        elif [[ $line == "[*]" ]]; then
            exit
        elif [[ "$aws_section_found" == true ]] && [[ $line == *=* ]]; then
            var=`awk '{print toupper($1)}' <<< $line`
            val=`awk '{print $3}' <<< $line`
            export $var=$val
        fi
    done < ~/.aws/credentials
fi
