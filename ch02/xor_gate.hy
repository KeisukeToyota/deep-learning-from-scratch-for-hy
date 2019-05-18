(import [and_gate [AND]])
(import [or_gate [OR]])
(import [nand_gate [NAND]])

(defn XOR [x1 x2]
  (setv s1 (NAND x1 x2))
  (setv s2 (OR x1 x2))
  (setv y (AND s1 s2))
  (return y))

(defmain []
  (for [xs [(, 0 0) (, 1 0) (, 0 1) (, 1 1)]]
    (setv y (XOR (first xs) (second xs)))
    (print (+ (str xs) (+ "->" (str y))))))
