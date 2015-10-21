#lang racket/base
(require racket/date pollen/world)
(provide (all-defined-out))
 
(module config racket/base
  (provide (all-defined-out))
  (define poly-targets '(html txt ltx pdf)))
 
(define (get-date)
  (date->string (current-date)))
 
(define (heading . xs)
  (case (world:current-poly-target)
    [(ltx pdf) (apply string-append `("{\\huge " ,@xs "}"))]
    [(txt) (map string-upcase xs)]
    [else `(h2 ,@xs)]))
 
(define (emph . xs)
  (case (world:current-poly-target)
    [(ltx pdf) (apply string-append `("{\\bf " ,@xs "}"))]
    [(txt) `("**" ,@xs "**")]
    [else `(strong ,@xs)]))