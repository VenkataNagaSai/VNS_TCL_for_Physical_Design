# TCL

## Table of Contents

- [1. Tcl Basics](#1-tcl-basics)
- [2. Operators](#2-operators)
  - [Arithmetic](#arithmetic)
  - [Comparison](#comparison)
  - [Logical](#logical)
  - [Bitwise](#bitwise)
  - [String operators](#string-operators)
- [3. Conditional Statements](#3-conditional-statements)
- [4. Loops](#4-loops)
  - [for](#for)
  - [while](#while)
  - [foreach](#foreach)
- [5. Loop Control](#5-loop-control)
- [6. Lists](#6-lists)
- [7. Arrays](#7-arrays)
- [8. Dictionaries](#8-dictionaries)
- [9. String Commands](#9-string-commands)
- [10. Regular Expressions](#10-regular-expressions)
- [11. File Handling](#11-file-handling)
- [12. Procedures](#12-procedures)
- [13. Expressions](#13-expressions)
- [14. Useful Built-in Math Functions](#14-useful-builtin-math-functions)
- [15. Formatting](#15-formatting)
- [16. Time Commands](#16-time-commands)
- [17. Information Commands](#17-information-commands)
- [18. Namespace Commands](#18-namespace-commands)
- [19. Error Handling](#19-error-handling)
- [20. Package Commands](#20-package-commands)
- [21. Report Parsing](#21-report-parsing)
- [22. Common Tcl Scripts in Physical Design](#22-common-tcl-scripts-in-physical-design)
- [23. Synopsys/Cadence Collection Commands](#23-synopsyscadence-collection-commands)
- [24. Most Used Physical Design Commands](#24-most-used-physical-design-commands)
- [25. File Search Utilities](#25-file-search-utilities)
- [26. Linux Commands Used Inside Tcl](#26-linux-commands-used-inside-tcl)
- [27. Advanced Tcl](#27-advanced-tcl)
- [28. General Programs](#28-general-programs)
- [29. Physical Design Report Parsing Questions](#29-physical-design-report-parsing-questions)
- [30. Tool-Specific Tcl Knowledge](#30-toolspecific-tcl-knowledge)
- [High-Priority Topics for Physical Design](#highpriority-topics-for-physical-design)

## 1. Tcl Basics

* Variables (`set`, `unset`, `incr`)
* Data types
* Comments
* Quoting (`""`, `{}`, `[]`)
* Escape characters
* Expressions (`expr`)
* Operators
* Command substitution
* Variable substitution

### Example:

```tcl
set width 100
set height 200
puts "Area = [expr {$width*$height}]"
```

## 2. Operators

### Arithmetic

``` tcl
+
-
*
/
%
**
```
### Comparison

``` tcl
==
!=
>
<
>=
<=
```

### Logical

``` tcl
&&
||
!
```

### Bitwise

``` tcl
& 
|
^
~
<<
>>
```

### String operators

``` tcl
eq
ne
string compare
string equal
```

## 3. Conditional Statements

```tcl
if {} {}

if {} {
} elseif {} {
} else {
}
```

``` tcl
switch
```

## 4. Loops

### for

```tcl
for {set i 0} {$i<10} {incr i} {
    puts $i
}
```

### while

```tcl
while {$i<100} {
    puts $i
}
```

### foreach

```tcl
foreach cell $cells {
    }
```

## 5. Loop Control

```tcl
break
continue
return
```

## 6. Lists

Commands

``` tcl
list
llength
lindex
linsert
lappend
lreplace
lrange
lsort
lsearch
join
split
concat
```

### PD Example

```tcl
set cells [get_cells *]
foreach cell $cells {
    puts $cell
}
```

## 7. Arrays

```tcl
array set
array get
array names
array exists
array size
array unset
```

## 8. Dictionaries

``` tcl
dict create
dict get
dict set
dict exists
dict keys
dict values
```

## 9. String Commands

``` tcl
string length
string compare
string equal
string first
string last
string index
string range
string trim
string toupper
string tolower
string map
string match
```


### PD Example

```tcl
string match "*DFF*" $cell
```
## 10. Regular Expressions

```tcl
regexp
regsub
```
Very important for report parsing.

### Example

```tcl
regexp {slack\s+(-?\d+\.\d+)} $line
```
Gives slack

## 11. File Handling

```tcl
open
close
gets
puts
read
seek
tell
eof
glob
file exists 
file delete
file copy 
file rename
```
### Example

```tcl
set fp [open timing.rpt r]
while {[gets $fp line] >=0} {
    puts $line
}
close $fp
```

## 12. Procedures

```tcl
proc
return
global
upvar
uplevel
```

### Example

```tcl
proc area {w h} {
    return [expr {$w*$h}]
}
```

## 13. Expressions

```tcl
expr
```

Always use

```tcl
expr {$a+$b}
```

## 14. Useful Built-in Math Functions

```tcl
abs()
sqrt()
pow()
sin()
cos()
tan()
log()
log10()
exp()
round()
floor()
ceil()
rand()
srand()
int()
double()
hypot()
fmod()
```

## 15. Formatting

``` tcl
format
scan
binary
```

## 16. Time Commands

``` tcl
clock seconds
clock format
clock clicks
```

## 17. Information Commands

``` tcl
info commands
info vars
info exists
info globals
info locals
info body
info procs
```

## 18. Namespace Commands

``` tcl
namespace eval
namespace import
namespace export
```

## 19. Error Handling

``` tcl
catch
error
try
```

## 20. Package Commands

``` tcl
package require
package provide 
source
```
## 21. Report Parsing

### Examples:

* Parse timing reports
* Parse utilization reports
* Parse congestion reports
* Parse DRC reports
* Parse power reports
* Parse CTS reports
* Parse IR drop reports
* Parse EM reports

## 22. Common Tcl Scripts in Physical Design

* Find worst slack
* Count setup violations
* Count hold violations
* Count DRCs
* Count cells
* Count macros
* Find high fanout nets
* Find unplaced cells
* Find floating pins
* Parse CTS reports
* Parse congestion reports
* Parse utilization
* Parse clock skew
* Extract frequencies
* Parse PrimeTime reports
* Parse Innovus reports
* Parse ICC2 reports

## 23. Synopsys/Cadence Collection Commands

```tcl
sizeof_collection
foreach_in_collection
filter_collection
remove_from_collection
add_to_collection
index_collection
sort_collection
```


### Example

```tcl
set cells [get_cells *]
foreach_in_collection c $cells {
    puts [get_object_name $c]
}
```

## 24. Most Used Physical Design Commands

```tcl
get_cells
get_pins
get_ports
get_nets
get_clocks
get_lib_cells
get_lib_pins
get_attribute
set_attribute
report_timing
report_constraints
report_qor
report_power
report_clock
report_area
```

## 25. File Search Utilities

``` tcl
glob file 
dirname file 
tail 
pwd 
cd 
exec
```


## 26. Linux Commands Used Inside Tcl

``` tcl
exec grep
exec awk
exec sed
exec sort
exec uniq
exec gzip
exec gunzip
exec wc
exec head
exec tail
```
### Example

``` tcl
exec grep slack timing.rpt
```

## 27. Advanced Tcl


* Nested procedures
* Recursion
* Lambdas
* Eval
* Uplevel
* Upvar
* Variable scope
* Namespaces

## 28. General Programs

* Factorial
* Prime numbers
* Fibonacci
* Palindrome
* Armstrong number
* Reverse string
* Count words
* Count characters
* Count lines
* Duplicate removal
* Frequency counter
* Matrix multiplication
* Bubble sort
* Binary search
* File parser
* Report parser

## 29. Physical Design Report Parsing Questions

* Find Worst Negative Slack (WNS)
* Find Total Negative Slack (TNS)
* Count setup violations
* Count hold violations
* Find max transition
* Find max capacitance
* Find max fanout
* Find clock skew
* Find insertion delay
* Find latency
* Parse DRC summary
* Parse utilization percentage
* Parse congestion hotspots
* Find IR-drop violations
* Find EM violations

## 30. Tool-Specific Tcl Knowledge

For Synopsys tools (ICC2, PrimeTime, Fusion Compiler):

* Collections (`foreach_in_collection`, `sizeof_collection`)
* `get_*` and `report_*` commands
* Attribute access (`get_attribute`, `set_attribute`)
* Constraint scripting (SDC)
* ECO automation scripts
* QoR report parsing

For Cadence tools (Innovus, Tempus):

* Database commands (`dbGet`, `dbSet`)
* Object queries
* Floorplan automation
* Placement and routing automation
* Timing and DRC report extraction

## High-Priority Topics for Physical Design

1. Variables, expressions, and operators
2. Conditions and loops
3. Lists and arrays
4. Strings and regular expressions
5. File handling
6. Procedures
7. Report parsing (`regexp`, `split`, `lindex`)
8. Linux command integration (`exec`)
9. Synopsys collection commands (`foreach_in_collection`, `sizeof_collection`)
10. Tool commands (`get_cells`, `get_pins`, `get_nets`, `report_timing`, `get_attribute`)
11. Timing, DRC, and QoR automation scripts
12. Practical report-parsing and debugging exercises
