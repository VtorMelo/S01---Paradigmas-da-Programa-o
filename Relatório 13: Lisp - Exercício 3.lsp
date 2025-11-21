(defstruct item
  nome
  tipo
  preco
  forca-magica)

(defparameter *catalogo-iwai*
  (list
   (make-item :nome "Katana Amaldicoada" 
              :tipo "Arma" 
              :preco 1000 
              :forca-magica 90)
   
   (make-item :nome "Adaga de Treino" 
              :tipo "Arma" 
              :preco 50 
              :forca-magica 30)
   
   (make-item :nome "Pocao de Vida" 
              :tipo "Pocao" 
              :preco 20 
              :forca-magica 50)
   
   (make-item :nome "Amuleto Sombrio" 
              :tipo "Artefato" 
              :preco 500 
              :forca-magica 100)))


(defun adiciona-imposto (preco)
  (* preco 1.15))

(defun bonus-maldicao (forca)
  (if (> forca 80)
      (* forca 1.5)
      forca))


(defun processa-venda (catalogo)
  (let* ((apenas-armas 
          (remove-if-not #'(lambda (i) 
                             (string-equal (item-tipo i) "Arma")) 
                         catalogo))
         (armas-com-imposto
          (mapcar #'(lambda (i)
                      (make-item :nome (item-nome i)
                                 :tipo (item-tipo i)
                                 :preco (adiciona-imposto (item-preco i))
                                 :forca-magica (item-forca-magica i)))
                  apenas-armas)))
    
    (mapcar #'(lambda (i)
                (list (item-nome i) 
                      (bonus-maldicao (item-forca-magica i))))
            armas-com-imposto)))

(format t "~%--- Itens Originais (Armas) ---~%")
(dolist (i *catalogo-iwai*)
  (when (string-equal (item-tipo i) "Arma")
    (format t "Item: ~A | Forca Original: ~A~%" (item-nome i) (item-forca-magica i))))

(format t "~%--- Resultado do Processamento (Nome + Forca com Bonus) ---~%")
(print (processa-venda *catalogo-iwai*))
