package main

import "testing"

func Test_01_ParseLine1(t *testing.T) {
	var tests = []struct {
		input string
		want  int
	}{
		{"", 0},
		{"1abc2", 12},
		{"pqr3stu8vwx", 38},
		{"a1b2c3d4e5f", 15},
		{"treb7uchet", 77},
	}

	for _, test := range tests {
		got := parseLine1(test.input)
		if got != test.want {
			t.Errorf("got %d, want %d", got, test.want)
		}
	}
}

func Test_01_ParseLine2(t *testing.T) {
	var tests = []struct {
		input string
		want  int
	}{
		{"", 0},
		{"two1nine", 29},
		{"eightwothree", 83},
		{"abcone2threexyz", 13},
		{"xtwone3four", 24},
		{"4nineeightseven2", 42},
		{"zoneight234", 14},
		{"7pqrstsixteen", 76},
		// {"twone", 22},
		{"twone", 21},
	}

	for _, test := range tests {
		got := parseLine2(test.input)
		if got != test.want {
			t.Errorf("got %d from %q, want %d", got, test.input, test.want)
		}
	}
}
