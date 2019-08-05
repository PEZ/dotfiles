{
 :repl-disabled {:plugins [[cider/cider-nrepl "0.20.0"]]
                 :dependencies [[nrepl "0.5.3"]
                                [cider/piggieback "0.3.10"]
                                [figwheel-sidecar "0.5.18"]]
                 :repl-options {:nrepl-middleware [cider.piggieback/wrap-cljs-repl]}}}
