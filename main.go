package main

import (
	"fmt"
	"net/http"
)

func main() {
	http.HandleFunc("/", HiGoServer)
	http.ListenAndServe(":8080", nil)
}

func HiGoServer(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hi, I'm GO!")
}
