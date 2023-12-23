package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
	"unicode"
	"unicode/utf8"
)

var digitStrings = map[string]rune{
	"one":   '1',
	"two":   '2',
	"three": '3',
	"four":  '4',
	"five":  '5',
	"six":   '6',
	"seven": '7',
	"eight": '8',
	"nine":  '9',
}

func check(e error) {
	if e != nil {
		panic(e)
	}
}

func main() {
	sum := 0
	for line := range toInt(readInput()) {
		sum += line
	}
	fmt.Println(sum)
}

func readInput() <-chan string {
	lines := make(chan string)
	go func() {
		file, err := os.Open("01-input.txt")
		check(err)
		defer func() { check(file.Close()) }()

		scanner := bufio.NewScanner(file)
		scanner.Split(bufio.ScanLines)
		for scanner.Scan() {
			lines <- strings.ToValidUTF8(scanner.Text(), "")
		}
		check(scanner.Err())

		close(lines)
	}()
	return lines
}

func toInt(input <-chan string) <-chan int {
	output := make(chan int)
	go func() {
		for line := range input {
			output <- parseLine2(line)
		}
		close(output)
	}()
	return output
}

func parseLine1(line string) int {
	var digits []rune
	for _, runeValue := range line {
		if unicode.IsDigit(runeValue) {
			digits = append(digits, runeValue)
		}
	}

	if len(digits) >= 1 {
		var builder strings.Builder
		builder.WriteRune(digits[0])
		builder.WriteRune(digits[len(digits)-1])
		i, err := strconv.Atoi(builder.String())
		check(err)
		return i
	}
	return 0
}

func parseLine2(line string) int {
	var digits []rune
	// lineloop:
	for i, w := 0, 0; i < len(line); i += w {
		runeValue, width := utf8.DecodeRuneInString(line[i:])
		w = width

		for str, digit := range digitStrings {
			if strings.HasPrefix(line[i:], str) {
				digits = append(digits, digit)
				// w = len(str)
				// continue lineloop
			}
		}
		if unicode.IsDigit(runeValue) {
			digits = append(digits, runeValue)
		}
	}

	if len(digits) >= 1 {
		var builder strings.Builder
		builder.WriteRune(digits[0])
		builder.WriteRune(digits[len(digits)-1])
		i, err := strconv.Atoi(builder.String())
		check(err)
		return i
	}
	return 0
}
