# TCL Data Structure Dictionary

# Table of Contents

- [Dictionary](#dictionary)
- [Dictionary Operators](#dictionary-operators)
  - [1. Dictionary Create](#1-dictionary-create)
  - [2. Dictionary Set](#2-dictionary-set)
  - [3. Dictionary Get](#3-dictionary-get)
  - [4. Dictionary Exists](#4-dictionary-exists)
  - [5. Dictionary Keys](#5-dictionary-keys)
  - [6. Dictionary Values](#6-dictionary-values)
  - [7. Dictionary Unset](#7-dictionary-unset)
  - [8. Dictionary Append](#8-dictionary-append)
  - [9. Dictionary Iteration](#9-dictionary-iteration)

## Dictionary

In TCL, a dictionary is a data structure that associates keys with values, it stores key-value pairs, where keys are unique.

It is similar to associative array, but unlike an array, the keys can be any TCL value, not just integers or strings.

Dictionary are created using arrays and provide faster operation than arrays.

## Dictionary Operators:

## 1. Dictionary Create

Method to create Dictionary

set colour [dict create colour1 "black" colour2 "blue" colour3 "red" ]
puts $colour

To access the elements of a dic, you can use $ operator.

## 2. Dictionary Set

"dict set" To add the values to dict.

set colour [dict create colour1 "black" colour2 "blue" colour3 "red" ]
puts "before adding: $colour"
dict set colour colour4 "orange"
puts "after adding: $colour"


## 3. Dictionary Get
### dict get: Retrieves the value of the specific key in the dict.
# get the value of the key.

set colour [dict create colour1 "black" colour2 "blue" colour3 "red" ]
set val [dict get $colour colour2]
puts $val

## 4. Dictionary Size
### dict size: Returns the number of key-value pair in the dict.

set colour [dict create colour1 "black" colour2 "blue" colour3 "red" ] 
set val [dict size $colour]
puts $val

## 5. Dictionary Exists
### dict exists: Returns a boolean indication whether a specific key exists in the dict.

set colour [dict create colour1 "black" colour2 "blue" colour3 "red" ]
if {[dict exists $colour colour5]} {
puts "colour5 exists in dict"
} else {
puts "colour5 doesnot exist in dict"
}

or-

set colour [dict create colour1 "black" colour2 "blue" colour3 "red" ]
puts $colour
set a [dict exists $colour colour3]
puts $a


### dict keys: Returns a list of all the key in the dict.

set colour [dict create colour1 "black" 2 "blue" colour3 "red" ]
puts "the keys of the dic is: [dict keys $colour]"


### dict values: Returns a list of the values in the dict.

set colour [dict create colour1 "black" 2 "blue" colour3 "red" ]
puts "the values of the dic is: [dict values $colour]"

### dict unset: Removes a specific key from the dict. i.e., to removes a key-value pair from dict.
set colour [dict create colour1 "black" colour2 "blue" colour3 "red" ]
puts $colour
puts "before removing key-value: $colour"

dict unset colour colour2
puts "after removing key-value: $colour"

### dict append: Appends at the end of dict.

set colour [dict create colour1 "black" colour2 "blue" colour3 "red" ]
puts $colour
puts "before append: $colour"
dict append colour colour5 "yellow"
puts "after append: $colour"

### dict iteration:
set colour [dict create colour1 {green black} colour2 "blue" colour3 "red" ]
puts [dict keys $colour]
puts [dict values $colour]

foreach item [dict keys $colour] {
set val [dict get $colour $item]
puts $val
}
