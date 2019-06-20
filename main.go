package main

import (
  "fmt"
  "net/http"
)

func main() {
  http.HandleFunc("/", func (w http.ResponseWriter, r *http.Request) {
    fmt.Fprintf(w, "Welcome Ksimple! Welcome Pipelines. Welcome review app!")
  })

  http.HandleFunc("/healthz", func (w http.ResponseWriter, r *http.Request) {
    fmt.Fprintf(w, "ok")
  })

  http.ListenAndServe(":8080", nil)
}
