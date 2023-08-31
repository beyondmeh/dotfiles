#!/usr/bin/env python3
#
# This script generates a random password that isn't too difficult to memorize 
#
#   You need to remember 6 pieces of information in this order:
#     1. A pronounceable non-sense word 
#     2. A number sequence
#     3. A letter sequence
#     4. A symbol
#     5. The position of the symbol as it relates to the above order
#     6. If the non-sense word or letter sequence is capitalized 
#
#  Real password generated by this script: 
#
#     morition082(GP(
#      ^      ^   ^ ^                
#      |      |	  | |                     
#      ` word |   | ` symbol [4]      [5] The symbols are between the letter 
#				 [1]	|	  ` letter sequence       sequence
#							` number   [3]          [6] The letter sequence is capitalized
#                [2]

import secrets, string

MIN_LENGTH_WORD = 2  # \____ this will not be the exact size of the word, given
MAX_LENGTH_WORD = 6  # /     a prefix or suffix may be added to it
MIN_LENGTH_NUM  = 2
MAX_LENGTH_NUM  = 6
MIN_LENGTH_END  = 2
MAX_LENGTH_END  = 3

PREFIXES = ['anti', 'de', 'dis', 'en', 'em', 'fore', 'in', 'im', 'il', 'ir',
					  'inter', 'mid', 'mis', 'non', 'over', 'pre', 're', 'semi', 'sub',
					  'super', 'trans', 'un', 'under']

SUFFIXES = ['able', 'ible', 'al', 'ial', 'ed', 'en', 'er', 'est', 'ful', 'ic',
						'ing', 'ion', 'tion', 'ation', 'ition', 'ity', 'ty', 'ive', 'ative',
						'itive', 'less', 'ly', 'ment', 'ness', 'ous', 'eous', 'ious', 's',
						'es', 'y']

VOWELS     = 'aeiou'
CONSONANTS = 'bcdfghjklmnpqrstvwxyz'
SYMBOLS    = '#*()+={}/?~;,.-_'

#
# Nonsense word generator
#

def word():
	#pattern = secrets.choice( PATTERNS )
	pattern = ''
	for i in range(MIN_LENGTH_WORD + secrets.randbelow(MAX_LENGTH_WORD - MIN_LENGTH_WORD + 1)):
		pattern = pattern + secrets.choice('VC') 

	word = ''
	for c in pattern:
		if c == 'C':
			word = word + secrets.choice(CONSONANTS)
		elif c == 'V':
			word = word + secrets.choice(VOWELS)

	pattern = secrets.randbelow(3)
	if pattern == 0:
		word = secrets.choice(PREFIXES) + word
	elif pattern == 1:
		word = word + secrets.choice(SUFFIXES)
	elif pattern == 2:
		word = secrets.choice(PREFIXES) + word + secrets.choice(SUFFIXES)

	return word

#
# Number sequence generator
#
def number():
	number = ''
	for i in range(MIN_LENGTH_NUM + secrets.randbelow(MAX_LENGTH_NUM - MIN_LENGTH_NUM + 1)):
		number = number + str( secrets.randbelow(10) )

	return number
#
# Ending letters generator
#
def ending():
	ending = ''

	for i in range(MIN_LENGTH_END + secrets.randbelow(MAX_LENGTH_END - MIN_LENGTH_END + 1)):
		ending = ending + secrets.choice( string.ascii_uppercase )

	return ending

#
# Symbol generator
#
def symbol():
	return secrets.choice( SYMBOLS )

w = word()
n = number()
e = ending()
s = symbol()

#
# Finalize capitialization
#
pattern = secrets.randbelow(4)

if pattern == 0:
	w = w.upper()

elif pattern == 1:
	e = e.upper()

elif pattern == 2:
	w = w.capitalize()

elif pattern == 3:
	w = w.capitalize()
	e = e.upper()

#
# Finalize symbol positions
#
pattern = secrets.randbelow(6)

if pattern == 0:
	password = s + w + n + e
elif pattern == 1:
	password = w + n + e + s
elif pattern == 2:
	password = s + w + n + e + s
elif pattern == 3:
	password = w + s + n + s + e
elif pattern == 4:
	password = w + n + s + e + s
elif pattern == 5:
	password = s + w + s + n + e

print(password)
