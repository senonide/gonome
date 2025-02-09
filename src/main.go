package main

import (
	_ "embed"
	"os"

	"github.com/diamondburned/gotk4-adwaita/pkg/adw"
	"github.com/diamondburned/gotk4/pkg/gtk/v4"
)

const (
	WindowTitle  = "Hello"
	WindowWidth  = 800
	WindowHeight = 600
)

//go:embed window.ui
var windowUi string

func main() {
	app := adw.NewApplication("com.senonide.gonome", 0)
	app.ConnectActivate(func() { activate(app) })

	if code := app.Run(os.Args); code > 0 {
		os.Exit(code)
	}
}

func activate(app *adw.Application) {
	builder := gtk.NewBuilderFromString(windowUi)

	window, ok := builder.GetObject("window").Cast().(*adw.Window)
	if !ok {
		panic("Failed to cast to adw")
	}

	window.SetTitle(WindowTitle)
	window.SetDefaultSize(WindowWidth, WindowHeight)
	window.Present()
	app.AddWindow(&window.Window)
}
