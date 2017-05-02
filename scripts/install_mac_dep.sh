#!/usr/bin/env bash
source ./util.sh

have_command brew || {
    echo "installing brew..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

echo "installing neovim"
brew tap neovim/neovim
brew install neovim

# fzf
echo "installing fzf using brew..."
brew install fzf


## install clang, clang-tidy
echo "installing clang, lang-tidy using brew"
brew install llvm --with-clang --with-clang-extra-tools
ln -s /usr/local/opt/llvm/bin/clang-tidy /usr/local/bin/clang-tidy
grep "/usr/local/opt/llvm/bin" ~/.pathrc || {
    echo '#LLMV brew path' >> ~/.pathrc && echo 'export CLANG_BIN=/usr/local/opt/llvm/bin' >> ~/.pathrc && echo "" >> ~/.pathrc
}
