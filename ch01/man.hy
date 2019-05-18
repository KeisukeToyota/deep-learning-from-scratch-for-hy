(defclass Man []
  (defn __init__ [self name]
    (setv self.name name)
    (print "Initilized!"))

  (defn hello [self]
    (print (+ "Hello" (+ self.name "!"))))

  (defn goodbye [self]
    (print (+ "Good-bye" (+ self.name "!")))))

(setv m (Man "David"))
(m.hello)
(m.goodbye)
