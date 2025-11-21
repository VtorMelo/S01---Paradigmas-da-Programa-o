(defstruct criatura
  nome
  ambiente
  periculosidade
  vida-media)

(defparameter *catalogo*
  (list
   
   (make-criatura :nome "Peeper" :ambiente "Safe Shallows" :periculosidade "Baixa" :vida-media 5)
   (make-criatura :nome "Reaper Leviathan" :ambiente "Crash Zone" :periculosidade "Alta" :vida-media 100)
   (make-criatura :nome "Ghost Leviathan" :ambiente "Deep" :periculosidade "Alta" :vida-media 200)
   (make-criatura :nome "Crabsquid" :ambiente "Deep" :periculosidade "Media" :vida-media 40)))

(defun filtra-por-perigo (catalogo)
  (remove-if-not #'(lambda (c)
                     (not (string-equal (criatura-periculosidade c) "Baixa")))
                 catalogo))

(defun relatorio-profundidade (catalogo)
  (let ((criaturas-deep (remove-if-not #'(lambda (c)
                                           (string-equal (criatura-ambiente c) "Deep"))
                                       catalogo)))
    (mapcar #'(lambda (c)
                (format nil "~A: Vive em ~A"
                        (criatura-nome c)
                        (criatura-ambiente c)))
            criaturas-deep)))

(format t "~%--- Teste 1: Filtra por Perigo (Nao Baixa) ---~%")
(let ((perigosas (filtra-por-perigo *catalogo*)))
  (dolist (c perigosas)
    (format t "Nome: ~A | Perigo: ~A~%" (criatura-nome c) (criatura-periculosidade c))))

(format t "~%--- Teste 2: Relatorio Profundidade (Apenas Deep) ---~%")
(let ((relatorio (relatorio-profundidade *catalogo*)))
  (dolist (linha relatorio)
    (print linha)))
