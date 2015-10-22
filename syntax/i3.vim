" Vim syntax file
" Language: i3-wm config file
" Maintainer: Emanuel Guével
" Latest Revision: 22 October 2015

if exists("b:current_syntax")
  finish
endif

" Always parse the whole file for highligthing correctness
syn sync fromstart

" Symbols
syn match   i3Arrow "→"
syn match   i3ChainDelimiter ";"

syn match   i3Var "\$\w\+"

" Strings
syn region  i3SimpleString keepend start='[^ \t]' end='$\|;' contained contains=i3ChainDelimiter,i3Var
syn match   i3QuotedString '"[^"]*"' contained
syn cluster i3String contains=i3SimpleString,i3QuotedString

" Config commands
" TODO: split commands to highlight arguments depending of the command
syn keyword i3ConfigSimpleKeyword assign new_window popup_during_fullscreen floating_modifier default_orientation workspace_layout for_window focus_follows_mouse position colors output tray_output workspace_buttons workspace_auto_back_and_forth binding_mode_indicator debuglog floating_minimum_size floating_maximum_size force_focus_wrapping force_xinerama force_display_urgency_hint hidden_state modifier new_float shmlog socket_path verbose mouse_warping strip_workspace_numbers focus_on_window_activation no_focus
syn match   i3IpcSocket "ipc[-_]socket" nextgroup=@i3String skipwhite

" Binding
syn keyword i3BindingKeyword bind bindcode bindsym nextgroup=i3Binding skipwhite
syn match   i3Binding ".*$" contained contains=i3BindingParams,i3KeyModifier,i3Plus,i3Var,@i3Command
syn match   i3BindingParams '--\(release\|border\|whole-window\|toggle\)'
syn keyword i3KeyModifier Shift Control Ctrl Mod1 Mod2 Mod3 Mod4 Mod5 Mode_switch
syn match   i3Plus "+"

" Bar block
syn keyword i3BarKeyword bar nextgroup=i3BarBlock skipwhite
syn region  i3BarBlock start="{" end="}" contains=i3StatusCommandKeyword,i3FontStatement,i3ColorsBlock,i3Comment contained

" Mode block
syn keyword i3ModeKeyword mode nextgroup=@i3ModeName,i3ModeParam skipwhite
syn cluster i3ModeName contains=i3SimpleModeName,i3QuotedModeName
syn match   i3SimpleModeName '[^ \t][^"{]\+' contained contains=i3ChainDelimiter,i3Var nextgroup=i3ModeBlock skipwhite
syn match   i3QuotedModeName '"[^"]*"' contained nextgroup=i3ModeBlock skipwhite
syn keyword i3ModeParam dock hide invisible contained nextgroup=i3ModeBlock skipwhite
syn region  i3ModeBlock start="{" end="}" contains=i3Comment,i3BindingKeyword,i3SetKeyword contained


" Status command
syn match   i3StatusCommand ".*$" contained
syn keyword i3StatusCommandKeyword status_command nextgroup=i3StatusCommand skipwhite contained

" Font statement
syn keyword i3FontStatement font nextgroup=@i3String skipwhite


" Command keywords
" TODO: split commands to highlight arguments depending of the command
syn cluster i3Command contains=i3SimpleCommand,i3WsKeyword,i3ExecKeyword
syn keyword i3SimpleCommand exit reload restart kill fullscreen global layout border focus move open split append_layout mark unmark resize grow shrink show nop rename title_format sticky
syn keyword i3Param 1pixel default stacked tabbed normal none tiling stacking floating enable disable up down horizontal vertical auto up down left right parent child px or ppt leave_fullscreen toggle mode_toggle scratchpad width height top bottom XXXclient hide primary yes all active window container to absolute center on off x ms h v smart ignore pixel splith splitv output true
syn keyword i3WsKeyword workspace nextgroup=i3WsSpecialParam,@i3String skipwhite
syn keyword i3WsSpecialParam next prev next_on_output prev_on_output back_and_forth current number
syn keyword i3BordersConfigCommand hide_edge_borders nextgroup=i3BordersSpecialParam skipwhite
syn keyword i3BordersSpecialParam none vertical horizontal both

" these are not keywords but we add them for consistency
" TODO: need to be contained
syn keyword i3PseudoParam no false inactive

" Exec commands
syn region  i3ExecCommand keepend start='[^ \t]' end='$\|;' contained contains=i3ChainDelimiter,i3Var,i3NoStartupId
syn match   i3QuotedExecCommand '"[^"]*"' contained
syn match   i3NoStartupId '--no-startup-id' contained
syn keyword i3ExecKeyword exec exec_always i3bar_command nextgroup=i3QuotedExecCommand,i3ExecCommand skipwhite

" Separator symbol
syn keyword i3SeparatorSymbol separator_symbol nextgroup=@i3String skipwhite

" Set statement
syn match   i3SetVar "\$\w\+" contained nextgroup=@i3String skipwhite
syn keyword i3SetKeyword set nextgroup=i3SetVar skipwhite

" Comments
syn keyword i3Todo contained TODO FIXME XXX NOTE
syn match   i3Comment "^\s*#.*$" contains=i3Todo

" Error (at end of line)
syn match i3Error ".*$" contained

" Hex color code
syn match i3ColorLast "#[0-9a-fA-F]\{6\}" contained nextgroup=i3Error skipwhite
syn match i3Color2nd "#[0-9a-fA-F]\{6\}" contained nextgroup=i3ColorLast skipwhite
syn match i3Color1st "#[0-9a-fA-F]\{6\}" contained nextgroup=i3Color2nd skipwhite

syn match i3ColorDef1 "client\.background\|statusline\|background\|separator\|statusline" nextgroup=i3ColorLast skipwhite
syn match i3ColorDef3 "client\.\(focused_inactive\|focused\|unfocused\|urgent\)\|inactive_workspace\|urgent_workspace\|focused_workspace\|active_workspace" nextgroup=i3Color1st skipwhite

highlight link i3ChainDelimiter       Operator
highlight link i3Plus                 Operator
highlight link i3Arrow                Operator

highlight link i3ExecCommand          Special
highlight link i3QuotedExecCommand    Special
highlight link i3StatusCommand        Special

highlight link i3Param                Constant
highlight link i3PseudoParam          Constant
highlight link i3BindingParams        Constant
highlight link i3NoStartupId          Constant
highlight link i3Color1st             Constant
highlight link i3Color2nd             Constant
highlight link i3ColorLast            Constant
highlight link i3WsSpecialParam       Constant
highlight link i3BordersSpecialParam  Constant
highlight link i3ModeParam            Constant

highlight link i3Var                  Identifier
highlight link i3SetVar               Identifier

highlight link i3KeyModifier          Function

highlight link i3SimpleString         String
highlight link i3QuotedString         String
highlight link i3SimpleModeName       String
highlight link i3QuotedModeName       String
highlight link i3WsName               String
highlight link i3QuotedWsName         String
highlight link i3SetValue             String
highlight link i3Font                 String

highlight link i3ExecKeyword          Keyword
highlight link i3SimpleCommand        Keyword
highlight link i3WsKeyword            Keyword

highlight link i3BarKeyword           Define
highlight link i3ColorDef1            Define
highlight link i3ColorDef3            Define
highlight link i3ConfigSimpleKeyword  Define
highlight link i3BindingKeyword       Define
highlight link i3IpcSocket            Define
highlight link i3SetKeyword           Define
highlight link i3ModeKeyword          Define
highlight link i3FontStatement        Define
highlight link i3SeparatorSymbol      Define
highlight link i3StatusCommandKeyword Define
highlight link i3BordersConfigCommand Define

highlight link i3Todo                 Todo
highlight link i3Comment              Comment
highlight link i3Error                Error
