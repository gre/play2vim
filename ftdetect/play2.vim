au BufRead,BufNewFile *.scala.html set filetype=html syntax=play2-html
au BufRead,BufNewFile */conf/\(*\|\)routes set filetype=play2-routes
au BufRead,BufNewFile */conf/*.conf setf play2-conf
au BufRead,BufNewFile plugins.sbt set filetype=scala

