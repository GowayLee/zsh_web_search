# ZSH Web Search
A web search plugin for ZSH.

## Installation

1. Clone this repository to your local machine.
2. Add the following line to your `.zshrc` file:

```zsh
source /path/to/zsh-web-search/zsh-web-search.zsh
```

3. Restart your terminal or source your `.zshrc` file.

## Usage

- To perform a web search, simply type `web_search` followed by your search query and press Enter. The plugin will open your default web browser and perform the search using the specified search engine.

   ```zsh
       web_search google zsh
   ```

   If there is no parameter of searching keywords, it will open the homepage of the search engine.

   ```zsh
       web_search google
   ```

- To make it more efficient, you can set aliases for the search engines you use most frequently. For example, you can add the following lines to your `.zshrc` or `zsh-web-search.zsh` file:

    ```zsh
        alias google='web_search google'
        alias bing='web_search bing'
    ```

    Now, you can use `google` and `bing`as aliases for the corresponding search engines.

    ```zsh
        google zsh
        bing zsh
    ```

## Customization

To add more search engines, you can add them to the `zsh-web-search.zsh` file. For example, to add the parameter for GitHub, add the entry to this Associative Array:

```zsh
    declare -A search_url_arr=(
        ...
        ["github"]="https://github.com/search?q="
        ...
    )
```
