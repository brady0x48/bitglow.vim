hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "bitglow"

" Palette
let s:fg_default     = "#c0c0c0" 
let s:bg_default     = "#000000" 

let s:linenr_grey    = "#808080" 

let s:comment        = "#80ffff" 
let s:comment_line   = "#00ffff" 

let s:number         = "#ff00ff" 
let s:keyword        = "#00ff00" 
let s:user_keyword   = "#ffff00" 

let s:string         = "#ff00ff" 
let s:character      = "#ff0000" 
let s:preproc        = "#0000ff" 
let s:operator       = "#ffffff" 

let s:selection_bg   = "#808080" 

" cterm palette indices 
let s:ct_fg_default     = 7
let s:ct_bg_default     = 0
let s:ct_linenr_grey    = 8

let s:ct_comment        = 14
let s:ct_comment_line   = 14
let s:ct_number         = 13
let s:ct_keyword        = 10
let s:ct_user_keyword   = 11
let s:ct_string         = 13
let s:ct_character      = 9
let s:ct_preproc        = 12
let s:ct_operator       = 15
let s:ct_selection_bg   = 8

function! s:HL(group, fg, bg, attr, ctermfg, ctermbg, ctermattr) abort
  " gui
  if a:fg ==# ""
    execute "hi " . a:group . " guifg=NONE"
  else
    execute "hi " . a:group . " guifg=" . a:fg
  endif

  if a:bg ==# ""
    execute "hi " . a:group . " guibg=NONE"
  else
    execute "hi " . a:group . " guibg=" . a:bg
  endif

  if a:attr ==# ""
    execute "hi " . a:group . " gui=NONE"
  else
    execute "hi " . a:group . " gui=" . a:attr
  endif

  " cterm
  if a:ctermfg < 0
    execute "hi " . a:group . " ctermfg=NONE"
  else
    execute "hi " . a:group . " ctermfg=" . a:ctermfg
  endif

  if a:ctermbg < 0
    execute "hi " . a:group . " ctermbg=NONE"
  else
    execute "hi " . a:group . " ctermbg=" . a:ctermbg
  endif

  if a:ctermattr ==# ""
    execute "hi " . a:group . " cterm=NONE"
  else
    execute "hi " . a:group . " cterm=" . a:ctermattr
  endif
endfunction

" Core 
call s:HL("Normal",       s:fg_default,  s:bg_default, "",        s:ct_fg_default,  s:ct_bg_default, "")
call s:HL("SignColumn",   "",            s:bg_default, "",        -1,               s:ct_bg_default, "")
call s:HL("Visual",       "",            s:selection_bg, "",      -1,               s:ct_selection_bg, "")

" Line numbers 
call s:HL("LineNr",       s:linenr_grey, "",           "",        s:ct_linenr_grey, -1, "")
call s:HL("CursorLineNr", s:fg_default,  "",           "bold",    s:ct_fg_default,  -1, "bold")

" Cursor line
call s:HL("CursorLine",   "",            "",           "underline", -1, -1, "underline")
call s:HL("CursorColumn", "",            "",           "underline", -1, -1, "underline")

if has("nvim")
  call s:HL("EndOfBuffer", s:bg_default, "", "", s:ct_bg_default, -1, "")
endif

" Comments
call s:HL("Comment",        s:comment,      "", "", s:ct_comment,      -1, "")
call s:HL("SpecialComment", s:comment_line, "", "", s:ct_comment_line, -1, "")
call s:HL("NonText",        s:comment_line, "", "", s:ct_comment_line, -1, "")

hi! link DocComment      Comment
hi! link javaDocComment  Comment
hi! link doxygenComment  Comment
hi! link doxygenBrief    Comment

" Syntax
call s:HL("Number",    s:number,    "", "", s:ct_number,   -1, "")
call s:HL("Keyword",   s:keyword,   "", "", s:ct_keyword,  -1, "")
call s:HL("String",    s:string,    "", "", s:ct_string,   -1, "")
call s:HL("Character", s:character, "", "", s:ct_character,-1, "")
call s:HL("PreProc",   s:preproc,   "", "", s:ct_preproc,  -1, "")
call s:HL("Operator",  s:operator,  "", "", s:ct_operator, -1, "")

call s:HL("UserKeyword", s:user_keyword, "", "", s:ct_user_keyword, -1, "")
hi! link Identifier UserKeyword

" Common links
hi! link Constant    Number
hi! link Float       Number
hi! link Boolean     Number

hi! link Statement   Keyword
hi! link Conditional Keyword
hi! link Repeat      Keyword
hi! link Label       Keyword
hi! link Exception   Keyword
hi! link Type        Keyword
hi! link StorageClass Keyword
hi! link Structure   Keyword
hi! link Typedef     Keyword

hi! link Include     PreProc
hi! link Define      PreProc
hi! link Macro       PreProc
hi! link PreCondit   PreProc

hi! link Special     Character
hi! link VisualNOS   Visual
