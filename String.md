# String in TCL

# Table of Contents

- [String Operators](#string-operators)
  - [1. String Append](#1-string-append)
  - [2. String Compare](#2-string-compare)
  - [3. String First](#3-string-first)
  - [4. String Index](#4-string-index)
  - [5. String Last](#5-string-last)
  - [6. String Left Trim](#6-string-left-trim)
  - [7. String Length](#7-string-length)
  - [8. String Match](#8-string-match)
  - [9. String Range](#9-string-range)
  - [10. String Reverse](#10-string-reverse)
  - [11. String Right Trim](#11-string-right-trim)
  - [12. String Tolower](#12-string-tolower)
  - [13. String Toupper](#13-string-toupper)
  - [14. String Trim](#14-string-trim)
  - [15. String Wordend](#15-string-wordend)
  - [16. String Wordstart](#16-string-wordstart)
- [Special Characters in the String](#special-characters-in-the-string)

## String Operators

### 1. String Append

Appends string2 at the end of string1 (change is made in the parent variable, so we should not use $string1).


#### Example
```tcl
set string1 "I am an ASIC Physical Design"
set string2 "Engineer"
puts [append string1 $string2]
```

#### Output
```text
I am an ASIC Physical DesignEngineer
```

### 2. String Compare

- If string1=string2 --> result is 0
- If string1 comes alphabetically after string2 --> result is 1
- If string1 comes alphabetically before string2 --> result is -1


#### Example
```tcl
set string1 "ASIC Physical"
set string2 "ASIC Physical"
set result [string compare $string1 $string2]
puts $result
```

#### Output
```text
0
```


#### Example
```tcl
set string1 "ASIC Physical"
set string2 "Design Engineer"
set result [string compare $string1 $string2]
puts $result
```

#### Output
```text
-1
```


#### Example
```tcl
set string1 "asic Physical"
set string2 "ASIC Physical"
set result [string compare $string1 $string2]
puts $result
```

#### Output
```text
1
```

### 3. String First

If string1 is in string2 --> then it will return the char index of the first occurence.

If string1 is not in string2 --> then it will return -1.

#### Example
```tcl
set string1 "ASIC Physical"
set string2 "ASIC Physical Design Engineer"
set result [string first $string1 $string2]
puts $result
```

#### Output
```text
0
```


#### Example
```tcl
set string1 "ASIC Physical"
set string2 "Design Engineer"
set result [string first $string1 $string2]
puts $result
```

#### Output
```text
-1
```

### 4. String Index

#### Example
```tcl
set string1 "ASIC Physical"
puts "The element at index 4 is [string index $string1 5]"
```

#### Output
```text
P
```

### 5. String Last

If string1 is in string2 --> then it will return the char index of the last occurence.

If string1 is not in string2 --> then it will return -1.


#### Example
```tcl
set string1 "Physical"
set string2 "ASIC Physical Design Engineer"
set result [string last $string1 $string2]
puts $result
```

#### Output
```text
5
```

#### Example
```tcl
set string1 "ASIC Physical"
set string2 "Design Engineer"
set result [string last $string1 $string2]
puts $result
```

#### Output
```text
-1
```

### 6. String Left Trim

If will trim the reference character at the left end. By default, it will trim white spaces.


#### Example
```tcl
set string1 "sss  ASIC Physicalssss"
puts [string trimleft $string1 "s"]
```

#### Output
```text
  ASIC Physicalssss
```

As we defined "s". It will trimleft only "s" characters, not white spaces.


#### Example
```tcl
set string1 "sss  ASIC Physicalssss"
puts [string trimleft $string1 "s "]
```

#### Output
```text
ASIC Physicalssss
```

As we defined "s ". It will trimleft "s" and " " i.e "s" characters and white spaces if any.


### 7. String Length


#### Example
```tcl
set string1 "ASIC Physical Design"
puts [string length $string1]
```

#### Output
```text
20
```

### 8. String Match

If both the strings are same, then it will return 1, else it will return 0.


#### Example
```tcl
set string1 "ASIC Physical Design"
set string2 "ASIC Physical Design"
puts [string match $string1 $string2]
```

#### Output
```text
1
```

#### Example
```tcl
set string1 "ASIC Physical Design"
set string2 "aSIC Physical Design"
puts [string match $string1 $string2]
```

#### Output
```text
0
```

### 9. String Range

It will return the characters in the defined range, of string.


#### Example
```tcl
set string1 "ASIC Physical Design"
puts [string range $string1 3 7]
```

#### Output
```text
C Phy
```

### 10. String Reverse

It will reverse the characters in the defined string.


#### Example
```tcl
set string1 "ASIC Physical Design"
puts [string reverse $string1]
```

#### Output
```text
ngiseD lacisyhP CISA
```

### 11. String Right Trim

If will trim the reference character at the right end. By default, it will trim white spaces.


#### Example
```tcl
set string1 "sss  ASIC Physicalssss"
puts [string trimright $string1 "s"]
```

#### Output
```text
sss  ASIC Physical
```

### 12. String Tolower

If will convert the string to lower case.


#### Example
```tcl
set string1 "ASIC Physical"
puts [string tolower $string1]
```

#### Output
```text
asic physical
```

### 13. String Toupper

If will convert the string to upper case.


#### Example
```tcl
set string1 "ASIC Physical"
puts [string toupper $string1]
```

#### Output
```text
ASIC PHYSICAL
```

### 14. String Trim

If will trim the reference character at both left and right end. By default, it will trim white spaces.


#### Example
```tcl
set string1 "sss  ASIC Physicalssss"
puts [string trim $string1 "s"]
```

#### Output
```text
  ASIC Physical
```

### 15. String wordend


#### Example
```tcl
set string1 "I am an ASIC Physical Design Engineer"
puts [string wordend $string1 9]
```

#### Output
```text
12
```

### 16. String wordstart


#### Example
```tcl
set string1 "I am an ASIC Physical Design Engineer"
puts [string wordstart $string1 11]
```

#### Output
```text
8
```

## Special Characters in the String

| Char | Description          |
| ---- | -------------------- |
| \\'  | print a single quote |
| \\"  | print a double quote |
| \\\  | print a backslash    |
| \\?  | print a ?            |
| \a   | alert bell           |
| \n   | new line             |
| \t   | tab space            |
| \v   | vertical tab         |


#### Example
```tcl
set string1 "\"I am an ASIC Physical Design Engineer\""
puts $string1
```

#### Output
```text
"I am an ASIC Physical Design Engineer"
```

Prints with " at the start and end of the string.


#### Example
```tcl
set string1 "I\nam\nan\nASIC\nPhysical\nDesign\nEngineer"
puts $string1
```

#### Output
```text
I
am
an
ASIC
Physical
Design
Engineer
```

#### Example
```tcl
set string1 "I\tam\tan\tASIC\tPhysical\tDesign\tEngineer"
puts $string1
```

#### Output
```text
I  am  an  ASIC    Physical    Design  Engineer
```

#### Example
```tcl
set string1 "I\vam\van\vASIC\vPhysical\vDesign\vEngineer"
puts $string1
```

#### Output
```text
I
    am
        an
            ASIC
                    Physical
                                Design
                                        Engineer
```
