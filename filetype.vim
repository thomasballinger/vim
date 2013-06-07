" my filetype file - copied from help example, modified for Rnw files
	if exists("did_load_filetypes")
	  finish
	endif
	augroup filetypedetect
	  au! BufRead,BufNewFile *.r              setfiletype r
	  au! BufRead,BufNewFile *.R              setfiletype r
	  au! BufRead,BufNewFile *.Rnw            setf rnoweb
	  au! BufRead,BufNewFile *.md             setf md
	  au! BufRead,BufNewFile *-mochatests.js  setf mochatests
	  au! BufRead,BufNewFile *.hy             setf hy
	augroup END
