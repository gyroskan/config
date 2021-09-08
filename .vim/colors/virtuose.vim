set background=dark
highlight clear
syntax reset

let g:colors_name="virtuose"
let colors_name="virtuose"


let s:black       = { "gui": "#222831", "cterm": "16" }
let s:gray        = { "gui": "#000000", "cterm": "245" }
let s:red         = { "gui": "#e06c75", "cterm": "168" }
let s:green       = { "gui": "#98c379", "cterm": "114" }
let s:yellow      = { "gui": "#e5c07b", "cterm": "221" }
let s:blue        = { "gui": "#61afef", "cterm": "75"  }
let s:purple      = { "gui": "#c678dd", "cterm": "141" }
let s:cyan        = { "gui": "#56b6c2", "cterm": "117"  }
let s:orange      = { "gui": "#000000", "cterm": "210" } 
let s:white       = { "gui": "#dcdfe4", "cterm": "188" }

let s:fg          = s:white
let s:bg          = s:black

let s:comment_fg  = { "gui": "#5c6370", "cterm": "241" }
let s:gutter_bg   = s:black
let s:gutter_fg   = { "gui": "#919baa", "cterm": "247" }

let s:cursor_line = { "gui": "#313640", "cterm": "237" }
let s:color_col   = { "gui": "#313640", "cterm": "237" }

let s:selection   = { "gui": "#474e5d", "cterm": "239" }
let s:vertsplit   = { "gui": "#313640", "cterm": "237" }


function! s:h(group, fg, bg, attr)
  if type(a:fg) == type({})
    exec "hi " . a:group . " guifg=" . a:fg.gui . " ctermfg=" . a:fg.cterm
  else
    exec "hi " . a:group . " guifg=NONE cterm=NONE"
  endif
  if type(a:bg) == type({})
    exec "hi " . a:group . " guibg=" . a:bg.gui . " ctermbg=" . a:bg.cterm
  else
    exec "hi " . a:group . " guibg=NONE ctermbg=NONE"
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
  else
    exec "hi " . a:group . " gui=NONE cterm=NONE"
  endif
endfun


" User interface colors {
call s:h("Normal", s:fg, s:bg, "")
call s:h("NonText", s:fg, "", "")

call s:h("Cursor", s:bg, s:blue, "")
call s:h("CursorColumn", "", s:cursor_line, "")
call s:h("CursorLine", "", s:cursor_line, "")

call s:h("LineNr", s:gutter_fg, s:gutter_bg, "")
call s:h("CursorLineNr", s:fg, "", "")

call s:h("DiffAdd", s:green, "", "")
call s:h("DiffChange", s:yellow, "", "")
call s:h("DiffDelete", s:red, "", "")
call s:h("DiffText", s:blue, "", "")

call s:h("IncSearch", s:bg, s:yellow, "")
call s:h("Search", s:bg, s:yellow, "")

call s:h("ErrorMsg", s:fg, "", "")
call s:h("ModeMsg", s:fg, "", "")
call s:h("MoreMsg", s:fg, "", "")
call s:h("WarningMsg", s:red, "", "")
call s:h("Question", s:purple, "", "")

call s:h("Pmenu", s:bg, s:fg, "")
call s:h("PmenuSel", s:fg, s:blue, "")
call s:h("PmenuSbar", "", s:selection, "")
call s:h("PmenuThumb", "", s:fg, "")

call s:h("SpellBad", s:red, "", "")
call s:h("SpellCap", s:yellow, "", "")
call s:h("SpellLocal", s:yellow, "", "")
call s:h("SpellRare", s:yellow, "", "")

call s:h("StatusLine", s:blue, s:cursor_line, "")
call s:h("StatusLineNC", s:comment_fg, s:cursor_line, "")
call s:h("TabLine", s:comment_fg, s:cursor_line, "")
call s:h("TabLineFill", s:comment_fg, s:cursor_line, "")
call s:h("TabLineSel", s:fg, s:bg, "")

call s:h("Visual", "", s:selection, "")
call s:h("VisualNOS", "", s:selection, "")

call s:h("ColorColumn", "", s:color_col, "")
call s:h("Conceal", s:fg, "", "")
call s:h("Directory", s:blue, "", "")
call s:h("VertSplit", s:vertsplit, s:vertsplit, "")
call s:h("Folded", s:fg, "", "")
call s:h("FoldColumn", s:fg, "", "")
call s:h("SignColumn", s:fg, "", "")

call s:h("MatchParen", s:blue, "", "underline")
call s:h("SpecialKey", s:fg, "", "")
call s:h("Title", s:green, "", "")
call s:h("WildMenu", s:fg, "", "")
" }


" Syntax colors {
call s:h("Constant", s:yellow, "", "")
call s:h("String", s:green, "", "")

call s:h("Identifier", s:blue, "", "")

call s:h("Statement", s:red, "", "")
call s:h("Conditional", s:purple, "", "")
call s:h("Repeat", s:purple, "", "")
call s:h("Label", s:cyan, "", "")

call s:h("PreProc", s:purple, "", "")

call s:h("Type", s:red, "", "")
call s:h("StorageClass", s:purple, "", "")

call s:h("Special", s:yellow, "", "")

call s:h("Comment", s:gray, "", "")
