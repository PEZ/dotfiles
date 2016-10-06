{:user {:jvm-opts ["-Dwebdriver.chrome.driver=/usr/local/var/rbenv/shims/chromedriver"
                   "-Dfubar=wut"]
        :plugins [[lein-pprint "1.1.2"]]}
 :repl {:plugins [[refactor-nrepl "2.0.0-SNAPSHOT"]
                  [cider/cider-nrepl "0.11.0-SNAPSHOT"]]
        :dependencies [[alembic "0.3.2"]
                       [org.clojure/tools.nrepl "0.2.12"]]}}
