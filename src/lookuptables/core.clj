(ns lookuptables.core
  (:use [clojure.core]))

(defn has-bit?
  "Test to see if nth bit is 1"
  [number nth-bit]
  (not (zero? (bit-and (bit-shift-left 1 nth-bit) number))))

(defn set-bit
  [number n]
  (bit-or number (bit-shift-left 1 n)))

(defn unset-bit
  [number n]
  (bit-and number (bit-not (bit-shift-left 1 n))))

(defn table-gen
  "Generate a list of sets by specifying number of bits"
  [^Long bits]
  (let [max_val (long (dec (Math/pow 2 bits)))
        tables (transient (zipmap (range bits) (repeat bits (sorted-set))))]
    (doseq [x (range (long (Math/pow 2 bits)))]
      (doseq [n (range bits)]
        (when (has-bit? x n)
          (assoc! tables n (conj (tables n) x)))))
    (persistent! tables)))

(defn guess-number
  [number table]
  (let [exp_val (atom (long 0))]
    (doseq [b (map (fn [[k v]]
                     (if (nil? (v number)) [k 0] [k 1]))
                   table)]
      (when (== (b 1) 1)
        (swap! exp_val set-nth-bit (b 0))))
    @exp_val))

(defn print-bytes
  [^Long number & {:keys [full]
                   :or   {full false}}]
  (let [mask (bit-shift-left 0xff 56)]
    (with-local-vars [show full]
      (doseq [n (reverse (range 8))]
        (let [curr-byte (unsigned-bit-shift-right
                         (bit-and number (unsigned-bit-shift-right mask (* (- 7 n) 8)))
                         (* 8 n))]
          (when (or (not (zero? curr-byte))
                    @show
                    (== n 0))
            (var-set show true)
            (print (format "0x%02x " curr-byte))))))))

