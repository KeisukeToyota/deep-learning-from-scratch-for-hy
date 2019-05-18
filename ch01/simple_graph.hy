(import [numpy :as np])
(import [matplotlib.pyplot :as plt])

(setv x (np.arange 0 6 0.1))
(setv y (np.sin x))

(plt.plot x y)
(plt.show)
