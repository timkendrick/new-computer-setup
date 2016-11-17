set -e

REQUIRED_PACKAGES=(
  auto-detect-indentation
  autoclose-html
  autocomplete-paths
  cursor-history
  docblockr
  editorconfig
  emmet
  git-time-machine
  goto-last-edit
  highlight-selected
  lazy-motion
  linter
  linter-eslint
  linter-jsonlint
  move-panes
  open-recent
  open-this
  pane-by-type
  project-find-navigation
  react
  related
  relative-numbers
  rest-client
  set-syntax
  terminal-panel
  vim-mode-plus
  vim-mode-plus-ex-mode
  vim-mode-plus-subword-movement
)

INSTALLED_PACKAGES=$(apm ls --bare | sed 's/@[0-9]*.[0-9]*.[0-9]*$//' | tr '\n' ' ')

for PACKAGE in "${REQUIRED_PACKAGES[@]}"; do
  if [[ " ${INSTALLED_PACKAGES[@]} " =~ " $PACKAGE " ]]; then
    echo "$PACKAGE is already installed"
  else
    echo "Installing $PACKAGE..."
    apm install $PACKAGE
  fi
done
