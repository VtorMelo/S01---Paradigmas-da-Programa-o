(defstruct ocorrencia
  nome
  ritual
  nivel-medo
  agentes-enviados)

(defun soma-medo-recursiva (lista)
   (if (null lista)
      0
      (+ (ocorrencia-nivel-medo (car lista))
         (soma-medo-recursiva (cdr lista)))))

(defun analise-final (lista-ocorrencias)
  (let* ((soma-total (soma-medo-recursiva lista-ocorrencias))
         (qtd (length lista-ocorrencias))
         (media (if (> qtd 0) (/ soma-total qtd) 0)))
    
     (format t "--- Debug: Media de Medo calculada: ~F ---~%" media)

    (let ((ocorrencias-criticas 
           (remove-if-not #'(lambda (obs)
                              (and (> (ocorrencia-agentes-enviados obs) 3)
                                   (> (ocorrencia-nivel-medo obs) media)))
                          lista-ocorrencias)))
      
      (mapcar #'ocorrencia-nome ocorrencias-criticas))))

(defparameter *missoes*
  (list
   (make-ocorrencia :nome "Investigacao na Escola" 
                    :ritual "Sussurros" 
                    :nivel-medo 20 
                    :agentes-enviados 2)
   
   (make-ocorrencia :nome "O Carnical de Veneza" 
                    :ritual "Sangue Eterno" 
                    :nivel-medo 90 
                    :agentes-enviados 5)
   
   (make-ocorrencia :nome "Casa da Colina" 
                    :ritual "Possessao" 
                    :nivel-medo 85 
                    :agentes-enviados 2)
   
   (make-ocorrencia :nome "Limpeza de Arquivo" 
                    :ritual "Nenhum" 
                    :nivel-medo 10 
                    :agentes-enviados 10)
   
   (make-ocorrencia :nome "Invocacao da Calamidade" 
                    :ritual "Transcendencia" 
                    :nivel-medo 95 
                    :agentes-enviados 4)))

(format t "~%--- Resultado Final: Nomes das Ocorrencias Criticas ---~%")
(print (analise-final *missoes*))
