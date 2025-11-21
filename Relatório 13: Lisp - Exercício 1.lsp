(defun calcula-dosagem (peso-kg idade-anos)
  (cond
    ((or (< idade-anos 5) (< peso-kg 20)) 10)
    ((and (>= idade-anos 5) (<= idade-anos 12) (>= peso-kg 20)) 25)
    (t 50)))

(defun normalizar (texto)
  "Remove espacos extras e converte para minusculo."
  (let* ((limpo (string-trim '(#\Space #\Tab #\Newline) texto))
         (minusculo (string-downcase limpo)))
    minusculo))

(defun ajusta-preco (preco-base nome-da-erva)
  (let ((nome (normalizar nome-da-erva)))
    (cond
      ((string= nome "ginseng") (* preco-base 3.0))
      ((string= nome "lotus")   (* preco-base 1.5))
      (t preco-base))))

(defun calcular-dinamico ()
  (format t "Digite a idade do paciente: ")
  (let ((idade (parse-integer (read-line))))
    (format t "Digite o peso em kg: ")
    (let ((peso (parse-integer (read-line))))
      (format t "Digite o nome da erva (ex: Lotus, Ginseng): ")
      (let* ((erva (read-line))
             (preco-base 10)
             (dosagem (calcula-dosagem peso idade))
             (preco-final (ajusta-preco preco-base (string-downcase (string-trim '(#\Space) erva)))))
        (format t "~%--- RESULTADO FINAL ---~%")
        (format t "Idade: ~A anos~%" idade)
        (format t "Peso:  ~A kg~%" peso)
        (format t "Erva usada: ~A~%" erva)
        (format t "Dosagem recomendada: ~A ml~%" dosagem)
        (format t "Preco final: ~A moedas~%" preco-final)
        (format t "--------------------------~%")))))

(calcular-dinamico)
