(import [numpy :as np])

(defn OR [x1 x2]
  (setv x (np.array [x1 x2]))
  (setv w (np.array [0.5 0.5]))
  (setv b -0.2)
  (setv tmp (+ (np.sum (* w x)) b))
  (if (<= tmp 0)
    (return 0)
    (return 1)))

(defmain []
  (for [xs [(, 0 0) (, 1 0) (, 0 1) (, 1 1)]]
    (setv y (OR (first xs) (second xs)))
    (print (+ (str xs) (+ "->" (str y))))))
