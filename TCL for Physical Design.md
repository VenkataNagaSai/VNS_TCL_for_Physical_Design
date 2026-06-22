# TCL for Physical Design

# Table of Contents

* [Introduction](#introduction)
* [Tcl Operators](#tcl-operators)
* [Important Concepts in Tcl](#important-concepts-in-tcl)
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

| Operator | Description    | Example |
| -------- | -------------- | ------- |
| +        | Addition       | expr {$a + $b} |
| -        | Subtraction    | expr {$a - $b} |
| *        | Multiplication | expr {$a * $b} |
| /        | Division       | expr {$a / $b} |
| %        | Modulus        | expr {$a % 2}  |
| **       | Power          | expr {$a ** 2} |

```tcl
set width 10
set height 20

set area [expr {$width * $height}]
puts $area
```

---

## Relational Operators

Used in if, while, and filtering conditions.

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
| \|\|     | OR          |
| !        | NOT         |

```tcl
if {$setup_slack < 0 && $hold_slack < 0} {
    puts "Both setup and hold violations exist"
}
```

---

## String Comparision Operators

| Operator | Description |
| -------- | ----------- |
| eq       | String Equal|
| ne       | String Not Equal   |

```tcl
if {$cell_type eq "BUF"} {
    puts "Buffer found"
}
```
Preferred Over:

```tcl
if {$cell_type == "BUF"} ;# Avoid
```

---

## Membership Operators

### in

```tcl
if {$pin_name in {"clk" "rst" "scan_en"}} {
    puts "Special pin"
}
```
### ni

```tcl
if {$pin_name ni {"clk" "rst"}} {
    puts "Normal pin"
}
```

---

## Ternary Operator

Useful for compact conditions.

```tcl
set result [expr {$slack >= 0 ? "CLEAN" : "VIOLATION"}]
```

---

# Important Concepts in Tcl

## Variable Handling

```tcl
set var 10
puts $var
unset var
```

Used for: Storing slack, utilization, cell names, file names, etc.

---

## Arithmetic Operations

```tcl
set area [expr {$width * $height}]
set rem [expr {$num % 2}]
```

Used for: Area calculations, percentages, coordinates.

---

## Conditional Statements

```tcl
if {$slack < 0} {
    puts "Violation"
} elseif {$slack == 0} {
    puts "Boundary"
} else {
    puts "Clean"
}
```

Used for: Timing checks, report filtering.

---

## Loops

### for Loop

```tcl
for {set i 1} {$i <= 10} {incr i} {
    puts $i
}
```

### while Loop

```tcl
while {$count > 0} {
    incr count -1
}
```

### foreach Loop (Most Important)

```tcl
foreach cell $cell_list {
    puts $cell
}
```

Used extensively in PD tools.

---

## List Operations

### Create List

```tcl
set cells {U1 U2 U3}
```

### Length

```tcl
llength $cells
```

### Access Element

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

Very heavily used in PD scripts.

---

## String Operations

```tcl
string length $name
string compare $a $b
string match *CLK* $pin
string first CLK $pin
```
### Example

```tcl
if {[string match *clk* $pin]} {
    puts "Clock pin"
}
```

Used for report parsing and object filtering.

---

## Procedures (Functions)

```tcl
proc add {a b} {
    return [expr {$a + $b}]
}

puts [add 10 20]
```

Used to build reusable utilities.

---

## Arrays (Associative Arrays)

```tcl
array set slack {
    path1 -0.10
    path2 0.05
}

puts $slack(path1)
```

Used for storing timing data.

---

## File Handling

### Open a File

```tcl
set fp [open report.rpt r]
```

### Read lines in a File
```tcl
while {[gets $fp line] >= 0} {
    puts $line
}
```

### Close a File

```tcl
close $fp
```

### Read a complete File

```tcl
set fp [open report.rpt r]

while {[gets $fp line] >= 0} {
    puts $line
}

close $fp
```

### Copy a complete File

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

## Regular Expressions

### Extract Slack

```tcl
regexp {slack.*(-?\d+\.\d+)} $line match slack
```

### Find Violations

```tcl
if {[regexp {VIOLATED} $line]} {
    puts $line
}
```

Used to extract slack, WNS, TNS, cell names from reports.

---

## Command Substitution

```tcl
set count [llength $cells]
```

The command inside [ ] executes first.

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

# Most Important Tcl Commands Used in PD

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

1. Prime Numbers (2-100)
2. Factorial Using Proc
3. Fibonacci Series
4. Palindrome Check
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
