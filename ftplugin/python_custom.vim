" this is python specific stuff - gets loaded on filetype detection

" make is always F4 in Tom's vimrc
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal smarttab
setlocal expandtab

"automatic return when inserting beyond 80th char
"setlocal textwidth=80

setlocal nowrap

setlocal makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
setlocal efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m 
map! <F5> <Esc>:w<CR>:!python % <CR>
map  <F5> <Esc>:w<CR>:!python % <CR>
map! <F4> <Esc>:w<CR>:!pylint % <CR>
map  <F4> <Esc>:w<CR>:!pylint % <CR>
set omnifunc=pythoncomplete#Complete

"au BufReadPost quickfix map <buffer> <silent> <CR> :.cc <CR> :ccl

let python_highlight_all = 1

python << EOF
import os
import sys
import vim
import imp
import StringIO
def SetBreakpoint():
    """Sets a breakpoint at cursor with pudb (or pdb if not found) """
    import re
    nLine = int( vim.eval( 'line(".")'))
    strLine = vim.current.line
    strWhite = re.search( '^(\s*)', strLine).group(1)
    try:
        imp.find_module('pudb')
        vim.current.buffer.append(
            "%(space)simport pudb; pudb.set_trace() %(mark)s Breakpoint %(mark)s" %
            {'space':strWhite, 'mark': '#' * 10}, nLine - 1)
    except ImportError:
        vim.current.buffer.append(
            "%(space)simport pdb; pdb.set_trace() %(mark)s Breakpoint %(mark)s" %
            {'space':strWhite, 'mark': '#' * 10}, nLine - 1)
vim.command( 'map <F8> :py SetBreakpoint()<cr>')

def RemoveBreakpoints():
    import re
    nCurrentLine = int( vim.eval( 'line(".")'))
    nLines = []
    nLine = 1
    for strLine in vim.current.buffer:
        if '.set_trace()' in strLine:
            nLines.append( nLine)
        nLine += 1
    nLines.reverse()
    for nLine in nLines:
        vim.command( 'normal %dG' % nLine)
        vim.command( 'normal dd')
        if nLine < nCurrentLine:
            nCurrentLine -= 1

	#vim.command( 'normal %dG' % nCurrentLine)
#vim.command( 'map <s-F8> :py RemoveBreakpoints()<cr>')

def DebugWithOrWithoutBreakpoints():
    """Run script if debug lines exist, otherwise run whole script in debugger"""
    import re
    breaks = False
    for strLine in vim.current.buffer:
        if '.set_trace()' in strLine:
            breaks = True
            break
    if breaks:
        vim.command( ':w')
        vim.command(':!python %')
    else:
        vim.command( ':w')
        vim.command(':!python -m pudb.run %')
#vim.command( 'map <F6> :py DebugWithOrWithoutBreakpoints()<cr>')
#vim.command( 'map! <F6> <Esc>:py DebugWithOrWithoutBreakpoints()<cr>')

def PyExecReplace(line1,line2):
  r = vim.current.buffer.range(int(line1),int(line2))
  redirected = StringIO.StringIO()
  sys.stdout = redirected
  exec('\n'.join(r[:]) + '\n')
  sys.stdout = sys.__stdout__
  output = redirected.getvalue().split('\n')
  r[:] = output[:-1] # the -1 is to remove the final blank line
  redirected.close()

for p in sys.path:
    if os.path.isdir(p):
        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
#vim.command('command -range Pyer python PyExecReplace(<f-line1>,<f-line2>)')
EOF

