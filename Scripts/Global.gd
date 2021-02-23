extends Node

var lbl
var console
var currentTube = null
var justExited = null
var prevExited = null

func debug_output(text):
	console.text += str(text) + "\n"
	console.cursor_set_line(console.get_line_count())
