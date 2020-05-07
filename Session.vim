let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/hobby/ImplicitCAD
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +34 Graphics/Implicit.hs
badd +66 Graphics/Implicit/Primitives.hs
badd +172 Graphics/Implicit/Definitions.hs
badd +39 Graphics/Implicit/Export/SymbolicObj3.hs
badd +28 Graphics/Implicit/Export/Symbolic/CoerceSymbolic3.hs
badd +19 Graphics/Implicit/ObjectUtil/GetImplicit3.hs
badd +57 Graphics/Implicit/ObjectUtil/GetBox3.hs
badd +74 Graphics/Implicit/Export.hs
badd +363 term://.//259492:/bin/zsh
badd +28 Graphics/Implicit/Export/DiscreteAproxable.hs
badd +139 Graphics/Implicit/Export/Render.hs
badd +33 Graphics/Implicit/Export/Render/Interpolate.hs
badd +0 term://.//473557:/bin/zsh
badd +1 stack.yaml
badd +86 implicit.cabal
badd +2 Graphics/Implicit/Export/Symbolic/Rebound3.hs
badd +1 programs/gears.hs
badd +52 Graphics/Implicit/Export/Render/TesselateLoops.hs
badd +82 Graphics/Implicit/Export/Render/GetSegs.hs
badd +52 Graphics/Implicit/Export/Render/RefineSegs.hs
argglobal
%argdel
set stal=2
edit programs/gears.hs
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 105 + 119) / 239)
exe 'vert 2resize ' . ((&columns * 133 + 119) / 239)
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 28) / 57)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
wincmd w
argglobal
if bufexists("term://.//259492:/bin/zsh") | buffer term://.//259492:/bin/zsh | else | edit term://.//259492:/bin/zsh | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 10032 - ((56 * winheight(0) + 28) / 57)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
10032
normal! 054|
wincmd w
exe 'vert 1resize ' . ((&columns * 105 + 119) / 239)
exe 'vert 2resize ' . ((&columns * 133 + 119) / 239)
tabnew
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
if bufexists("term://.//473557:/bin/zsh") | buffer term://.//473557:/bin/zsh | else | edit term://.//473557:/bin/zsh | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 71 - ((11 * winheight(0) + 28) / 57)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
71
normal! 019|
tabnext 1
set stal=1
if exists('s:wipebuf') && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 winminheight=1 winminwidth=1 shortmess=filnxtToOF
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
