///
function scr_letter_data_init() {
	if (live_call()) return live_result;
	
	#macro LETTER_LETTER 1
	#macro LETTER_POINTS 2
	#macro LETTER_VOWEL 3
	
	global.letter_data[1,1] = "A"    // letter
	global.letter_data[1,2] = 1      // point value
	global.letter_data[1,3] = 1      // vowel status

	global.letter_data[2,1] = "B"
	global.letter_data[2,2] = 3
	global.letter_data[2,3] = 0

	global.letter_data[3,1] = "C"
	global.letter_data[3,2] = 3
	global.letter_data[3,3] = 0

	global.letter_data[4,1] = "D"
	global.letter_data[4,2] = 2
	global.letter_data[4,3] = 0

	global.letter_data[5,1] = "E"
	global.letter_data[5,2] = 1
	global.letter_data[5,3] = 1

	global.letter_data[6,1] = "F"
	global.letter_data[6,2] = 4
	global.letter_data[6,3] = 0

	global.letter_data[7,1] = "G"
	global.letter_data[7,2] = 2
	global.letter_data[7,3] = 0

	global.letter_data[8,1] = "H"
	global.letter_data[8,2] = 4
	global.letter_data[8,3] = 0

	global.letter_data[9,1] = "I"
	global.letter_data[9,2] = 1
	global.letter_data[9,3] = 1

	global.letter_data[10,1] = "J"
	global.letter_data[10,2] = 8
	global.letter_data[10,3] = 0

	global.letter_data[11,1] = "K"
	global.letter_data[11,2] = 5
	global.letter_data[11,3] = 0

	global.letter_data[12,1] = "L"
	global.letter_data[12,2] = 1
	global.letter_data[12,3] = 0

	global.letter_data[13,1] = "M"
	global.letter_data[13,2] = 3
	global.letter_data[13,3] = 0

	global.letter_data[14,1] = "N"
	global.letter_data[14,2] = 1
	global.letter_data[14,3] = 0

	global.letter_data[15,1] = "O"
	global.letter_data[15,2] = 1
	global.letter_data[15,3] = 1

	global.letter_data[16,1] = "P"
	global.letter_data[16,2] = 3
	global.letter_data[16,3] = 0

	global.letter_data[17,1] = "Q"
	global.letter_data[17,2] = 10
	global.letter_data[17,3] = 0

	global.letter_data[18,1] = "R"
	global.letter_data[18,2] = 1
	global.letter_data[18,3] = 0

	global.letter_data[19,1] = "S"
	global.letter_data[19,2] = 1
	global.letter_data[19,3] = 0

	global.letter_data[20,1] = "T"
	global.letter_data[20,2] = 1
	global.letter_data[20,3] = 0

	global.letter_data[21,1] = "U"
	global.letter_data[21,2] = 1
	global.letter_data[21,3] = 1

	global.letter_data[22,1] = "V"
	global.letter_data[22,2] = 4
	global.letter_data[22,3] = 0

	global.letter_data[23,1] = "W"
	global.letter_data[23,2] = 4
	global.letter_data[23,3] = 0

	global.letter_data[24,1] = "X"
	global.letter_data[24,2] = 8
	global.letter_data[24,3] = 0

	global.letter_data[25,1] = "Y"
	global.letter_data[25,2] = 4
	global.letter_data[25,3] = 0

	global.letter_data[26,1] = "Z"
	global.letter_data[26,2] = 10
	global.letter_data[26,3] = 0
}