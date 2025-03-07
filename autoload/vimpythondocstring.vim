let s:plugin_root_dir = fnamemodify(resolve(expand('<sfile>:p')), ':h')

python3 << EOF
import sys
from os.path import normpath, join
import vim
plugin_root_dir = vim.eval('s:plugin_root_dir')
scr = join(plugin_root_dir, '..', 'python')
python_root_dir = normpath(join(plugin_root_dir, '..', 'python'))
deps = [scr]
sys.path[0:0] = deps
import pydocstring
EOF

function! vimpythondocstring#Full()
    python3 pydocstring.Docstring().full_docstring()
endfunction

function! vimpythondocstring#FullTypes()
    python3 pydocstring.Docstring().full_docstring(print_hints=True)
endfunction

function! vimpythondocstring#Oneline()
    python3 pydocstring.Docstring().oneline_docstring()
endfunction
