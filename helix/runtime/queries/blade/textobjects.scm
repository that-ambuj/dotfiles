(directive) @function.start
(directive_start) @function.start
(directive_end) @function.end
(comment) @comment.around
((parameter) @parameter.inside (#set! "priority" 110)) 
((php_only) @parameter.inside (#set! "priority" 110)) 
((bracket_start) @function.start (#set! "priority" 120)) 
((bracket_end) @function.end (#set! "priority" 120)) 
(keyword) @function.start
