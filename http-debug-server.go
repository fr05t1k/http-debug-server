package main

import (
	"fmt"
	"log"
	"net/http"
	"net/http/httputil"
	"os"

	"github.com/urfave/cli"
)

func main() {
	app := cli.NewApp()
	app.Version = "0.9.0"
	app.Description = "The application provide ability to debug HTTP requests"
	app.Usage = "HTTP Debug"

	app.Flags = []cli.Flag{
		cli.IntFlag{Name: "port, p", Usage: "Port", Value: 8080},
	}

	app.Action = func(ctx *cli.Context) error {

		port := ctx.Int("port")

		http.HandleFunc("/", func(w http.ResponseWriter, clientRequest *http.Request) {
			dumpedRequest, err := httputil.DumpRequest(clientRequest, true)
			if err != nil {
				log.Printf(err.Error())
			}
			log.Println(string(dumpedRequest))
		})

		log.Println("Listening on: ", port)
		err := http.ListenAndServe(fmt.Sprintf(":%d", port), nil)

		if err != nil {
			log.Fatalln(err.Error())
		}

		return nil
	}

	app.Run(os.Args)
}
