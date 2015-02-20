(ns lookuptables.latex
  (:use [clojure.core])
  (:require [clojure.string :as str]))

(defn latex-gen
  [^String filename tables & {:keys [author title]
                              :or {author "Ritchie Cai" title "Lookup Tables"}}]
  (with-open [w (clojure.java.io/writer (format "resources/%s" filename))]
    (.write w "\\documentclass{assignment}\n")
    (.write w (format "\\title{%s}\n" title))
    (.write w (format "\\author{%s}\n" author))
    (.write w "\\begin{document}\n")
    (doseq [n (range (count tables))]
      (let [t (tables n)
            elem_count (count t)
            col 15
            row (long (Math/ceil (/ elem_count 15)))]
       (latex-table-gen w n t row col)))
    (.write w "\\end{document}\n\n")))

(defn latex-table-gen
  [w id table row col]
  (.write w (format "%d\\\\\n\\\\\n" id))
  (.newLine w)
  (.write w (format "\\begin{tabular}{%s}\n" (str/join " " (repeat col "r"))))
  (loop [n 0
         t table]
    (when (< n row)
      (.write w (format "%s \\\\\n"(str/join " & " (map #(str %) (take-nth row t)))))
      (recur (inc n) (drop 1 t))))
  (.write w (format "\\end{tabular}\n"))
  (.write w (format "\\newpage\n\n\n")))
