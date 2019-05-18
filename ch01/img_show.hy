(import [matplotlib.pyplot :as plt])
(import [matplotlib.image [imread]])

(setv img (imread "../dataset/lena.png")) ;; 画像の読み込み
(plt.imshow img)

(plt.show)
