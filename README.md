# TCL_for_Physical_Design

---

# Table of Contents

* [Introduction](#introduction)
* [Tcl Operators](#tcl-operators)
* [Important Tcl Commands](#important-tcl-commands)
* [Lists](#lists)
* [Arrays](#arrays)
* [String Operations](#string-operations)
* [Procedures](#procedures)
* [File Handling](#file-handling)
* [Regular Expressions](#regular-expressions)
* [Important TCL Foundational Scripts](#important-tcl-foundational-scripts)
* [File Handling Scripts](#file-handling-scripts)
* [List and Array Scripts](#list-and-array-scripts)
* [Report Parsing](#report-parsing)
* [Physical Design Tool Commands](#physical-design-tool-commands)
* [Physical Design Tcl Scripts](#physical-design-tcl-scripts)
* [ECO Automation Scripts](#eco-automation-scripts)
* [Most Important Tcl Commands](#most-important-tcl-commands)

---

# Introduction

Tcl is heavily used in:

* Cadence Innovus
* Synopsys ICC2
* Synopsys PrimeTime
* Cadence Tempus
* Synopsys Fusion Compiler

Common applications:

* Timing report parsing
* ECO automation
* Collection handling
* CTS automation
* Placement checks
* Routing checks
* Design sanity checks
* Batch automation

---

# Tcl Operators

## Arithmetic Operators

| Operator | Description    |
| -------- | -------------- |
| +        | Addition       |
| -        | Subtraction    |
| *        | Multiplication |
| /        | Division       |
| %        | Modulus        |
| **       | Power          |

```tcl
set area [expr {$width * $height}]
```

---

## Relational Operators

| Operator | Description           |
| -------- | --------------------- |
| ==       | Equal                 |
| !=       | Not Equal             |
| >        | Greater Than          |
| <        | Less Than             |
| >=       | Greater Than or Equal |
| <=       | Less Than or Equal    |

```tcl
if {$slack < 0} {
    puts "Timing violation"
}
```

---

## Logical Operators

| Operator | Description |
| -------- | ----------- |
| &&       | AND         |
| ||       | OR          |
| !        | NOT         |

```tcl
if {$setup_slack < 0 && $hold_slack < 0} {
    puts "Both violations present"
}
```

---

## String Operators

| Operator | Description |
| -------- | ----------- |
| eq       | Equal       |
| ne       | Not Equal   |

```tcl
if {$cell_type eq "BUF"} {
    puts "Buffer found"
}
```

---

## Membership Operators

```tcl
if {$pin_name in {"clk" "rst" "scan_en"}} {
    puts "Special pin"
}
```

```tcl
if {$pin_name ni {"clk" "rst"}} {
    puts "Normal pin"
}
```

---

## Ternary Operator

```tcl
set result [expr {$slack >= 0 ? "PASS" : "FAIL"}]
```

---

# Important Tcl Commands

## Variables

```tcl
set var 10
puts $var
unset var
```

## Arithmetic

```tcl
set area [expr {$width * $height}]
```

## If Else

```tcl
if {$slack < 0} {
    puts "Violation"
}
```

## Loops

### For

```tcl
for {set i 1} {$i <= 10} {incr i} {
    puts $i
}
```

### While

```tcl
while {$count > 0} {
    incr count -1
}
```

### Foreach

```tcl
foreach cell $cell_list {
    puts $cell
}
```

---

# Lists

```tcl
set cells {U1 U2 U3}
```

### Length

```tcl
llength $cells
```

### Access

```tcl
lindex $cells 0
```

### Append

```tcl
lappend cells U4
```

### Search

```tcl
lsearch $cells U2
```

### Sort

```tcl
lsort $cells
```

### Sort Integer

```tcl
lsort -integer $nums
```

### Reverse

```tcl
lreverse $list
```

### Remove Duplicates

```tcl
lsort -unique $list
```

---

# Arrays

```tcl
array set slack {
    path1 -0.1
    path2 0.05
}

puts $slack(path1)
```

---

# String Operations

```tcl
string length $name
string compare $a $b
string match *CLK* $pin
string first CLK $pin
```

---

# Procedures

```tcl
proc add {a b} {
    return [expr {$a + $b}]
}

puts [add 10 20]
```

---

# File Handling

## Read File

```tcl
set fp [open report.rpt r]

while {[gets $fp line] >= 0} {
    puts $line
}

close $fp
```

## Copy File

```tcl
set in [open input.txt r]
set out [open output.txt w]

while {[gets $in line] >= 0} {
    puts $out $line
}

close $in
close $out
```

---

# Regular Expressions

## Extract Slack

```tcl
regexp {slack.*(-?\d+\.\d+)} $line match slack
```

## Find Violations

```tcl
if {[regexp {VIOLATED} $line]} {
    puts $line
}
```

---

# Important TCL Foundational Scripts

## Even Numbers

```tcl
for {set i 1} {$i <= 100} {incr i} {
    if {$i % 2 == 0} {
        puts $i
    }
}
```

## Odd Numbers

```tcl
for {set i 1} {$i <= 100} {incr i} {
    if {$i % 2 != 0} {
        puts $i
    }
}
```

## Prime Numbers

```tcl
for {set num 2} {$num <= 100} {incr num} {

    set prime 1

    for {set i 2} {$i < $num} {incr i} {
        if {$num % $i == 0} {
            set prime 0
            break
        }
    }

    if {$prime} {
        puts $num
    }
}
```

## Factorial

```tcl
proc factorial {n} {

    set fact 1

    for {set i 1} {$i <= $n} {incr i} {
        set fact [expr {$fact * $i}]
    }

    return $fact
}
```

## Fibonacci

```tcl
set a 0
set b 1

for {set i 1} {$i <= 10} {incr i} {

    puts $a

    set temp [expr {$a + $b}]
    set a $b
    set b $temp
}
```

## Palindrome

```tcl
if {$str eq [string reverse $str]} {
    puts "Palindrome"
}
```

---

# Report Parsing

## Extract Slack

```tcl
regexp {slack.*(-?\d+\.\d+)} $line match slack
```

## Extract WNS

```tcl
regexp {WNS:\s*(-?\d+\.\d+)} $line match wns
```

## Extract TNS

```tcl
regexp {TNS:\s*(-?\d+\.\d+)} $line match tns
```

## Extract Startpoint

```tcl
regexp {Startpoint:\s+(\S+)} $line match start
```

## Extract Endpoint

```tcl
regexp {Endpoint:\s+(\S+)} $line match end
```

## Count Violations

```tcl
if {[regexp {VIOLATED} $line]} {
    incr count
}
```

---

# Physical Design Tool Commands

```tcl
get_cells *
get_pins *
get_nets *
get_ports *
get_clocks *
```

### Iterate Collections

```tcl
foreach_in_collection cell [get_cells *] {
    puts $cell
}
```

### Attributes

```tcl
get_attribute $cell ref_name
get_attribute $cell area
```

### Filter Sequential Cells

```tcl
get_cells -filter "is_sequential==true"
```

---

# Physical Design Tcl Scripts

## Count Cells

```tcl
set count [sizeof_collection [get_cells *]]
puts $count
```

## Sequential Cells

```tcl
foreach_in_collection cell \
[get_cells -filter "is_sequential==true"] {

    puts [get_object_name $cell]
}
```

## High Fanout Nets

```tcl
foreach_in_collection net [get_nets *] {

    set fanout \
    [sizeof_collection [all_fanout -flat -from $net]]

    if {$fanout > 100} {
        puts [get_object_name $net]
    }
}
```

## Floating Nets

```tcl
foreach_in_collection net [get_nets *] {

    if {[sizeof_collection [all_connected $net]] < 2} {
        puts [get_object_name $net]
    }
}
```

## Unconnected Ports

```tcl
foreach_in_collection port [get_ports *] {

    if {[sizeof_collection [all_connected $port]] == 0} {
        puts [get_object_name $port]
    }
}
```

---

# ECO Automation Scripts

## Generate ECO Tcl

```tcl
set fp [open eco.tcl w]

puts $fp "size_cell U123 BUF_X4"

close $fp
```

## Generate Buffer ECO

```tcl
set fp [open eco_buf.tcl w]

foreach_in_collection net [get_nets *] {

    set fanout [sizeof_collection \
        [all_fanout -flat -from $net]]

    if {$fanout > 50} {
        puts $fp "insert_buffer [get_object_name $net]"
    }
}

close $fp
```

---

# Most Important Tcl Commands

* set
* puts
* expr
* if
* foreach
* for
* while
* proc
* return
* llength
* lindex
* lappend
* lsearch
* lsort
* array
* regexp
* open
* gets
* close
* string match
* foreach_in_collection
* get_cells
* get_pins
* get_nets
* get_ports
* get_attribute
* get_clocks
* all_fanout
* all_connected

---

# My Scripts

1. Prime Numbers
2. Factorial Using Proc
3. Fibonacci Series
4. Palindrome
5. Reverse String
6. Even Numbers
7. Odd Numbers
8. Count Lines in File
9. Count Words in File
10. Count Blank Lines
11. Remove Duplicate Lines
12. Sort Numbers
13. Maximum Number
14. Frequency Count
15. Extract Slack
16. Extract WNS/TNS
17. Count Violations
18. Sequential Cell Listing
19. High Fanout Nets
20. Floating Nets
21. ECO Script Generation
22. Count Buffers
23. Count Registers
24. List Macros
25. List Dont-Touch Cells

---

# MY COMPLETE TCL NOTES FOR VLSI PHYSICAL DESIGN

## Contents

1. Tcl Operators
2. Important Tcl Commands
3. Tcl Data Structures
4. File Handling
5. Regular Expressions
6. Tcl Procedures
7. Tcl Scripts Asked in Interviews
8. Report Parsing Scripts
9. Physical Design Tool-Based Tcl
10. ECO Automation Scripts
11. Most Important Interview Questions
12. Most Important Commands for PD Engineers

---

## SECTION 1: TCL OPERATORS

### Arithmetic Operators

* Addition

- Subtraction

* Multiplication
  /   Division
  %   Modulus
  **  Power

Example:

set area [expr {$width * $height}]
set rem [expr {$num % 2}]

---

### Relational Operators

== Equal
!= Not Equal

> Greater Than
> < Less Than
> = Greater Than or Equal
> <= Less Than or Equal

Example:

if {$slack < 0} {
puts "Timing violation"
}

---

### Logical Operators

&& AND
|| OR
!  NOT

Example:

if {$setup_slack < 0 && $hold_slack < 0} {
puts "Both setup and hold violations exist"
}

---

### String Comparison Operators

eq String Equal
ne String Not Equal

Example:

if {$cell_type eq "BUF"} {
puts "Buffer found"
}

Preferred Over:

if {$cell_type == "BUF"}

---

### Bitwise Operators

&  Bitwise AND
|  Bitwise OR
^  XOR
~  NOT
<< Left Shift

> > Right Shift

Example:

puts [expr {5 & 3}]

Output:

1

---

### Ternary Operator

set status [expr {$slack >= 0 ? "PASS" : "FAIL"}]

---

### Membership Operators

in

if {$pin_name in {"clk" "rst" "scan_en"}} {
puts "Special pin"
}

ni

if {$pin_name ni {"clk" "rst"}} {
puts "Normal pin"
}

---

## SECTION 2: IMPORTANT TCL COMMANDS

### Variables

set var 10
puts $var
unset var

---

### Arithmetic Operations

set area [expr {$width * $height}]
set util [expr {$stdcell_area*100.0/$core_area}]

---

### Conditional Statements

if {$slack < 0} {
puts "Violation"
} elseif {$slack == 0} {
puts "Boundary"
} else {
puts "Clean"
}

---

### Loops

FOR LOOP

for {set i 1} {$i <= 10} {incr i} {
puts $i
}

WHILE LOOP

while {$count > 0} {
incr count -1
}

FOREACH LOOP

foreach cell $cell_list {
puts $cell
}

---

## SECTION 3: LISTS

Create List

set cells {U1 U2 U3}

Length

llength $cells

Access Element

lindex $cells 0

Append

lappend cells U4

Search

lsearch $cells U2

Sort

lsort $cells

Sort Integer

lsort -integer $nums

Remove Duplicates

lsort -unique $list

Reverse List

lreverse $list

---

## SECTION 4: STRING OPERATIONS

string length $name

string compare $a $b

string match *CLK* $pin

string first CLK $pin

Example:

if {[string match *clk* $pin]} {
puts "Clock pin"
}

---

## SECTION 5: PROCEDURES

proc add {a b} {
return [expr {$a + $b}]
}

puts [add 10 20]

---

## SECTION 6: ARRAYS

array set slack {
path1 -0.10
path2 0.05
}

puts $slack(path1)

---

## SECTION 7: FILE HANDLING

Open File

set fp [open report.rpt r]

Read File

while {[gets $fp line] >= 0} {
puts $line
}

Close File

close $fp

---

Copy File

set in [open in.txt r]
set out [open out.txt w]

while {[gets $in line] >= 0} {
puts $out $line
}

close $in
close $out

---

## SECTION 8: REGULAR EXPRESSIONS

regexp {slack.*(-?\d+.\d+)} $line match slack

Example:

if {[regexp {VIOLATED} $line]} {
puts $line
}

---

## SECTION 9: COMMAND SUBSTITUTION

set count [llength $cells]

---

## SECTION 10: INTERVIEW PROGRAMS

EVEN NUMBERS

for {set i 1} {$i <= 100} {incr i} {
if {$i % 2 == 0} {
puts $i
}
}

---

ODD NUMBERS

for {set i 1} {$i <= 100} {incr i} {
if {$i % 2 != 0} {
puts $i
}
}

---

DIVISIBLE BY 4 AND STOP IN 70s

for {set i 1} {$i <= 100} {incr i} {

```
if {$i >= 70 && $i < 80} {
    break
}

if {$i % 4 == 0} {
    puts $i
}
```

}

---

PRIME NUMBERS 2 TO 100

for {set num 2} {$num <= 100} {incr num} {

```
set prime 1

for {set i 2} {$i < $num} {incr i} {

    if {$num % $i == 0} {
        set prime 0
        break
    }
}

if {$prime} {
    puts $num
}
```

}

---

CHECK PRIME NUMBER

set num 37
set prime 1

for {set i 2} {$i < $num} {incr i} {

```
if {$num % $i == 0} {
    set prime 0
    break
}
```

}

puts $prime

---

FACTORIAL

proc factorial {n} {

```
set fact 1

for {set i 1} {$i <= $n} {incr i} {
    set fact [expr {$fact * $i}]
}

return $fact
```

}

puts [factorial 5]

---

FIBONACCI

set a 0
set b 1

for {set i 1} {$i <= 10} {incr i} {
puts $a

```
set temp [expr {$a + $b}]
set a $b
set b $temp
```

}

---

SUM 1 TO 100

set sum 0

for {set i 1} {$i <= 100} {incr i} {
incr sum $i
}

puts $sum

---

LARGEST OF THREE NUMBERS

set max $a

if {$b > $max} {set max $b}
if {$c > $max} {set max $c}

---

SWAP TWO NUMBERS

set temp $a
set a $b
set b $temp

---

REVERSE STRING

set str "physicaldesign"

for {set i [expr {[string length $str]-1}]} {$i >= 0} {incr i -1} {
append rev [string index $str $i]
}

puts $rev

---

PALINDROME

set str "madam"

if {$str eq [string reverse $str]} {
puts "Palindrome"
}

---

## SECTION 11: FILE INTERVIEW QUESTIONS

COUNT LINES

set count 0

while {[gets $fp line] >= 0} {
incr count
}

puts $count

---

COUNT WORDS

set words 0

while {[gets $fp line] >= 0} {
incr words [llength $line]
}

puts $words

---

COUNT BLANK LINES

if {[string trim $line] eq ""} {
incr count
}

---

LONGEST LINE

if {[string length $line] > $maxlen} {
set maxlen [string length $line]
}

---

REMOVE DUPLICATE LINES

array set seen {}

while {[gets $fp line] >= 0} {

```
if {![info exists seen($line)]} {
    puts $line
    set seen($line) 1
}
```

}

---

## SECTION 12: LIST AND ARRAY QUESTIONS

SORT NUMBERS

set nums {50 20 10 40 30}

puts [lsort -integer $nums]

---

MAXIMUM NUMBER

set nums {5 8 2 20 1}

set max [lindex $nums 0]

foreach n $nums {
if {$n > $max} {
set max $n
}
}

puts $max

---

SECOND LARGEST

set nums {5 20 15 30 10}

set sorted [lsort -integer $nums]

puts [lindex $sorted end-1]

---

COMMON ELEMENTS

set list1 {A B C D}
set list2 {C D E F}

foreach item $list1 {

```
if {[lsearch $list2 $item] != -1} {
    puts $item
}
```

}

---

FREQUENCY COUNT

array set freq {}

foreach item {A B A A C B} {
incr freq($item)
}

parray freq

---

## SECTION 13: REPORT PARSING

EXTRACT SLACK

regexp {slack.*(-?\d+.\d+)} $line match slack

---

EXTRACT WNS

regexp {WNS:\s*(-?\d+.\d+)} $line match wns

---

EXTRACT TNS

regexp {TNS:\s*(-?\d+.\d+)} $line match tns

---

EXTRACT STARTPOINT

regexp {Startpoint:\s+(\S+)} $line match start

---

EXTRACT ENDPOINT

regexp {Endpoint:\s+(\S+)} $line match end

---

COUNT VIOLATIONS

if {[regexp {VIOLATED} $line]} {
incr count
}

---

WORST 10 SLACKS

lappend slacks $slack

set sorted [lsort -real $slacks]

puts [lrange $sorted 0 9]

---

FIND WNS

set wns 999

while {[gets $fp line] >= 0} {

```
if {[regexp {slack.*(-?\d+\.\d+)} $line match slack]} {

    if {$slack < $wns} {
        set wns $slack
    }
}
```

}

puts $wns

---

## SECTION 14: PHYSICAL DESIGN TOOL COMMANDS

get_cells *

get_pins *

get_nets *

get_ports *

get_clocks *

---

foreach_in_collection cell [get_cells *] {
puts $cell
}

---

get_attribute $cell ref_name

get_attribute $cell area

---

get_cells -filter "is_sequential==true"

---

## SECTION 15: PHYSICAL DESIGN TCL SCRIPTS

COUNT CELLS

set count [sizeof_collection [get_cells *]]

puts "Total cells = $count"

---

LIST SEQUENTIAL CELLS

foreach_in_collection cell [get_cells -filter "is_sequential==true"] {
puts [get_object_name $cell]
}

---

COUNT REGISTERS

set reg_count 
[sizeof_collection 
[get_cells -filter "is_sequential==true"]]

puts $reg_count

---

FIND BUFFERS

foreach_in_collection cell [get_cells *] {

```
set ref [get_attribute $cell ref_name]

if {[string match *BUF* $ref]} {
    puts [get_object_name $cell]
}
```

}

---

COUNT BUFFERS

set count 0

foreach_in_collection cell [get_cells *] {

```
set ref [get_attribute $cell ref_name]

if {[string match *BUF* $ref]} {
    incr count
}
```

}

puts $count

---

LIST CLOCKS

foreach_in_collection clk [get_clocks *] {
puts [get_object_name $clk]
}

---

LIST MACROS

foreach_in_collection cell [get_cells *] {

```
if {[get_attribute $cell is_hard_macro]} {
    puts [get_object_name $cell]
}
```

}

---

FIND UNPLACED CELLS

foreach_in_collection cell [get_cells *] {

```
if {![get_attribute $cell is_placed]} {
    puts [get_object_name $cell]
}
```

}

---

LIST DONT TOUCH CELLS

foreach_in_collection cell [get_cells *] {

```
if {[get_attribute $cell dont_touch]} {
    puts [get_object_name $cell]
}
```

}

---

HIGH FANOUT NETS

foreach_in_collection net [get_nets *] {

```
set fanout [sizeof_collection [all_fanout -flat -from $net]]

if {$fanout > 100} {
    puts "[get_object_name $net] : $fanout"
}
```

}

---

HIGH CAPACITANCE NETS

foreach_in_collection net [get_nets *] {

```
set cap [get_attribute $net capacitance]

if {$cap > 0.5} {
    puts [get_object_name $net]
}
```

}

---

FLOATING NETS

foreach_in_collection net [get_nets *] {

```
if {[sizeof_collection [all_connected $net]] < 2} {
    puts [get_object_name $net]
}
```

}

---

UNCONNECTED PORTS

foreach_in_collection port [get_ports *] {

```
if {[sizeof_collection [all_connected $port]] == 0} {
    puts [get_object_name $port]
}
```

}

---

CELLS IN AREA RANGE

foreach_in_collection cell [get_cells *] {

```
set x [get_attribute $cell x_coordinate]

if {$x > 100 && $x < 200} {
    puts [get_object_name $cell]
}
```

}

---

GENERATE ECO COMMANDS

set fp [open eco.tcl w]

puts $fp "size_cell U123 BUF_X4"

close $fp

---

GENERATE ECO BUFFER LIST

set fp [open eco_buf.tcl w]

foreach_in_collection net [get_nets *] {

```
set fanout [sizeof_collection \
    [all_fanout -flat -from $net]]

if {$fanout > 50} {
    puts $fp "insert_buffer [get_object_name $net]"
}
```

}

close $fp

---

CELL COUNT BY REFERENCE

array set count {}

foreach_in_collection cell [get_cells *] {

```
set ref [get_attribute $cell ref_name]

if {[info exists count($ref)]} {
    incr count($ref)
} else {
    set count($ref) 1
}
```

}

foreach ref [array names count] {
puts "$ref : $count($ref)"
}

---

## SECTION 16: MOST IMPORTANT TCL TOPICS FOR PD

1. set
2. puts
3. expr
4. if
5. foreach
6. for
7. while
8. proc
9. return
10. llength
11. lindex
12. lappend
13. lsort
14. lsearch
15. open
16. gets
17. close
18. regexp
19. string match
20. array
21. foreach_in_collection
22. get_cells
23. get_pins
24. get_nets
25. get_ports
26. get_attribute
27. all_fanout
28. all_connected
29. get_timing_paths
30. get_clocks

---

## SECTION 17: SOME IMPORTANT SCRIPTS

1. Prime Numbers (2–100)
2. Check Prime Number
3. Factorial Using Proc
4. Fibonacci Series
5. Odd Numbers
6. Even Numbers
7. Divisible by 4 Until 70s
8. Palindrome
9. Reverse String
10. Largest of Numbers
11. Swap Two Numbers
12. Count Lines in File
13. Count Words in File
14. Count Blank Lines
15. Remove Duplicate Lines
16. Sort Integers
17. Maximum Number
18. Second Maximum Number
19. Frequency Count
20. Common Elements in Lists
21. Extract Slack
22. Extract WNS
23. Extract TNS
24. Extract Startpoint
25. Extract Endpoint
26. Count Violations
27. Find Worst Slack
28. List Sequential Cells
29. Count Registers
30. Find Buffers
31. Count Buffers
32. Find High Fanout Nets
33. Find Floating Nets
34. Find Unconnected Ports
35. Find High Capacitance Nets
36. Generate ECO Commands
37. Generate ECO Buffer Lists
38. Count Cell Types
39. List Macros
40. List Dont-Touch Cells

This document covers majority of Tcl questions, report-parsing tasks, collection handling, ECO automation, and Physical Design scripting
