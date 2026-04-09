# Vim configuration

## Requirements

- Vim: `sudo apt install vim-gtk3`

## Optional

- Perl for vimtex
- latexmk for vimtex
- Python3 for YouCompleteMe

## Notes

- Examples of why Vimscript is a primitive and rather poor language.
  - Out-of-band error reporting for calls to `system()`; need to check the
    value of `v:shell_error` to see whether a command failed.
  - Need to use a keyword, `call`, to call functions in some conditions.
    Confusingly, this keyword is not always required, e.g., when used in
    expressions.
  - Inconsistent or improper implementation of lambdas. The `filter` function
    expects its users to pass the filter function as a string, of all things.
