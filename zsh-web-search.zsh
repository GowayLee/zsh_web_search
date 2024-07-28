declare -A search_url_arr=(
  ["google"]="https://google.com/search?q="
  ["bing"]="https://bing.com/search?q="
  ["baidu"]="https://baidu.com/s?wd="
  ["github"]="https://github.com/search?q="
  ["yahoo"]="https://search.yahoo.com/search?p="
  ["blbl"]="https://search.bilibili.com/all?keyword="
  ["youtube"]="https://yahoo.com/results?search_query="
)

alias bing='web_search bing'
alias google='web_search google'
alias baidu='web_search baidu'
alias yahoo='web_search yahoo'
alias github='web_search github'
alias youtube='web_search youtube'
alias blbl='web_search blbl'

# get the open command
declare web_search_open_cmd
case "$OSTYPE" in
"msys")
  web_search_open_cmd='start'
  ;;
"linux")
  web_search_open_cmd='xdg-open' # depending of xdg-utils
  ;;
"darwin")
  web_search_open_cmd='open'
  ;;
*)
  echo "Unsupported OS: $OSTYPE"
  return 1
  ;;
esac

function web_search() {
  if [ $# -lt 1 ]; then
    echo "Usage: web_search <search_engine> [keyword1] [keyword2] ... or call aliases"
    echo "Supported search engines(alias):"
    for key in "${(@k)search_url_arr}"; do
      echo "$key"
    done
    return 1
  fi

  local engine=$1
  local url="${search_url_arr[$engine]}"

  # Check whether the search engine is supported
  if [ -z $url ]; then
    echo "Search engine $engine not supported!"
    return 1
  fi

  # Open the homepage if no parameter is given
  if [[ $# -le 1 ]]; then
    $web_search_open_cmd "$url"
    return 0
  fi

  shift
  # Use "+" to concate keywords
  while [[ $# -gt 0 ]]; do
    url="${url}$1+"
    shift
  done
  # remove the last "+"
  url="${url%?}"
  
  nohup $web_search_open_cmd "$url" &>/dev/null
}
