package mal

import "core:fmt"
import "core:os"

read :: proc(s: string) -> string {
	return s
}

eval :: proc(s: string) -> string {
	return s
}

print :: proc(s: string) -> string {
	return s
}

rep :: proc(s: string) -> string {
	return print(eval(read(s)))
}

main :: proc() {
	buf: [256]byte
	for {
		fmt.print("user> ")
		n, err := os.read(os.stdin, buf[:])
		if err != nil {
			fmt.eprintln("Error reading: ", err)
		}
		input := string(buf[:n])
		fmt.println(rep(input))
	}
}
