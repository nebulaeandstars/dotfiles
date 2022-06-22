syn keyword pythonSelf self cls

syn keyword pythonLambdaExpr lambda

syn keyword pythonStatement break continue del
syn keyword pythonStatement exec return
syn keyword pythonStatement pass raise
syn keyword pythonStatement global nonlocal assert
syn keyword pythonStatement yield
syn keyword pythonStatement with as
syn keyword pythonStatement async await

syn match pythonExceptions +[A-z]*\(Error\|Exception\)+
syn match pythonFunction +\(\.\?\)\zs\([A-z]\|_\)\+\ze\((\)+

hi link pythonLambdaExpr Operator
hi link pythonException pythonStatement
