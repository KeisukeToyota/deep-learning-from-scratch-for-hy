(import urllib.request)
(import os.path)
(import gzip)
(import pickle)
(import os)
(import [numpy :as np])

(setv url_base "http://yann.lecun.com/exdb/mnist/")
(setv key_file {:train_img "train-images-idx3-ubyte.gz"
                :train_label "train-labels-idx1-ubyte.gz"
                :test_img "t10k-images-idx3-ubyte.gz"
                :test_label "t10k-labels-idx1-ubyte.gz"})

(setv dataset_dir (os.path.dirname (os.path.abspath __file__)))
(setv save_file (+ dataset_dir "/mnist.pkl"))

(setv train_num 60000)
(setv test_num 10000)
(setv img_dim (, 1 28 28))
(setv img_size 784)


(defn _download [file_name]
  (setv file_path (+ dataset_dir (+ "/" file_name)))

  (if (os.path.exists file_path)
    (return))

  (print (+ "Downloading " (+ file_name " ... ")))
  (urllib.request.urlretrieve (+ url_base file_name) file_path)
  (print "Done"))

(defn download_mnist []
  (for [v (key_file.values)]
    (_download v)))

(defn _load_label [file_name]
  (setv file_path (+ dataset_dir (+ "/" file_name)))

  (print (+ "Converting " (+ file_name " to Numpy Array ...")))
  (with [f (gzip.open file_path "rb")]
    (setv data (np.frombuffer f.read np.uint8 :ofset 16)))
  (setv data (data.reshape -1 img_size))
  (print "Done")

  (return data))

(defn _convert_numpy []
  (setv dataset {})
  (assoc dataset :train_img (_load_img (get key_file :train_img)))
  (assoc dataset :train_label (_load_img (get key_file :train_label)))
  (assoc dataset :test_img (_load_img (get key_file :test_img)))
  (assoc dataset :test_label (_load_img (get key_file :train_label)))

  (return dataset))

(defn init_mnist []
  (download_mnist)
  (setv dataset (_convert_numpy))
  (print "Creating pickle file ...")
  (with [f (open save_file "wb")]
    (pickle.dump dataset f -1))
  (print "Done!"))

(defn _change_one_hot_label [X]
  (setv T (np.zeros (, X.size 10)))
  (for [(, idx row) (enumerate T)]
    
