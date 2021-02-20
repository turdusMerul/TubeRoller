extends Node

var console

func debug_output(text):
	console.text += str(text) + "\n"
	console.cursor_set_line(console.get_line_count())
