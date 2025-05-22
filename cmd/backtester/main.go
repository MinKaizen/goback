package main

import (
	"github.com/MinKaizen/goback/internal/logging"
)

func main() {
	logging.Init(true)
	defer logging.Logger.Sync()

	logging.Logger.Infof("Hello world!")
}
