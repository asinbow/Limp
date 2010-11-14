" 
" limp/vim/mode.vim
"
" URL:
" http://mikael.jansson.be
"
" Description:
" Lisp-mode specific functions (such as leaving/entering buffers)
"
" Version:
" 0.2
"
" Date:
" 2008-04-20
"
" Authors:
" Mikael Jansson <mail@mikael.jansson.be>
"
" Changelog:
" 2008-04-20
" * Initial version.

augroup LimpMode
 au!
 au BufEnter .limp_bridge_test*,*.lisp,*.asd setlocal syntax=lisp filetype=lisp lisp 
 "
 " ls = laststatus (always visible for ls=2)
 " bs = backspace (works over all text for bs=2)
 " si = smartindent
 " et = expandtabs (soft tabs)
 " sw = indent by shift (<> or Tab)
 " ts = tabstop
 " tw = textwidth (don't break lines)
 " nocul = nocursorline
 "
 au BufEnter .limp_bridge_test*,*.lisp,*.asd setlocal ls=2 bs=2 si et sw=2 ts=2 tw=0 nocul

 au BufEnter .limp_bridge_test*,*.lisp,*.asd setlocal statusline=%<%f\ \(%{LimpBridge_connection_status()}\)\ %h%m%r%=%-14.(%l,%c%V%)\ %P\ of\ %L\ \(%.45{getcwd()}\)

 au BufEnter .limp_bridge_test*,*.lisp,*.asd setlocal iskeyword=&,*,+,45,/,48-57,:,<,=,>,@,A-Z,a-z,_

 au BufEnter .limp_bridge_test*,*.lisp,*.asd call LimpHighlight_start()|call AutoClose_start()
 au BufLeave .limp_bridge_test*,*.lisp,*.asd call LimpHighlight_stop()|call AutoClose_stop()

augroup END

