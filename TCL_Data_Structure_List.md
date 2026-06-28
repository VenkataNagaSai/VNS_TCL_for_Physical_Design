# TCL Data Structure List

# Table of Contents

- [List](#list)
- [Methods of representing List](#methods-of-representing-list)
- [List Operators](#list-operators)
  - [1. List Append](#1-list-append)
  - [2. List Assign](#2-list-assign)
  - [3. List Concat](#3-list-concat)
  - [4. List Index](#4-list-index)
  - [5. List Insert](#5-list-insert)
  - [6. List Length](#6-list-length)
  - [7. List Range](#7-list-range)
  - [8. List Replace](#8-list-replace)
  - [9. List Set](#9-list-set)
  - [10. List Sort](#10-list-sort)
  - [11. List Split](#11-list-split)

## List

Similar to arrays. Lists are collection of items. Items can be either strings (or) real numbers (or) integers.

## Methods of representing List

- set a "I am an ASIC Physical Design Engineer"
- set a {I am an ASIC Physical Design Engineer}
- set a [list I am an ASIC Physical Design Engineer]


#### Example
```tcl
set role "ASIC Physical Design Engineer"
set work "I am an $role"
puts $work
```

#### Output
```text
I am an ASIC Physical Design Engineer
```

#### Example
```tcl
set role "ASIC Physical Design Engineer"
set work {I am an $role}
puts $work
```

#### Output
```text
I am an $role
```

No $role variable substitution, because { }, prevents variable substitution.


#### Example
```tcl
set role "ASIC Physical Design Engineer"
set work [list I am an $role]
puts $work
```

#### Output
```text
I am an ASIC Physical Design Engineer
```

# List Operators

## 1. List Append

Appends elements at the end (change is made in the parent variable, so we should not use $a).


#### Example
```tcl
set a [list I am an ASIC Physical Design]
lappend a Engineer
puts $a
```

#### Output
```text
I am an ASIC Physical Design Engineer
```

## 2. List Assign

To assign successive elements of a list with specified variables.


#### Example
```tcl
set a [list VLSI ASIC Physical Design]
lassign $a e0 e1 e2 e3
puts $e0
puts $e1
puts $e2
puts $e3
```

#### Output
```text
VLSI
ASIC
Physical
Design
```

## 3. List Concat

To combine lists, It merges two or more lists in specified order into a single list.


#### Example
```tcl
set a [list Design Engineer]
set b [list I am an ASIC Physical]

set c [concat $b $a]
puts $c
```

#### Output
```text
I am an ASIC Physical Design Engineer
```

## 4. List Index

Gives the element at the particular index.


#### Example
```tcl
set a [list ASIC Physical Design Engineer]
set b [lindex $a 2]
puts $b
```

#### Output
```text
Design
```

## 5. List Insert

Inserts one or more elements at a particular index.


#### Example
```tcl
set a [list I am Design Engineer]
set b [linsert $a 2 Physical]
puts $b

set c [linsert $a 2 an ASIC Physical]
puts $c
```

#### Output
```text
I am Physical Design Engineer
I am an ASIC Physical Design Engineer
```

## 6. List Length

Gives the length of the list.


#### Example
```tcl
set a [list I am an ASIC Physical Design Engineer]
set b [llength $a]
puts $b

set a [list I_am_an_ASIC_Physical_Design_Engineer]
set b [llength $a]
puts $b
```

#### Output
```text
7
1
```

## 7. List Range

It will return one or more adjacent elements from a list depending on the specified index range.


#### Example
```tcl
set a [list I am an ASIC Physical Design Engineer]
set b [lrange $a 3 5]
puts $b
```

#### Output
```text
ASIC Physical Design
```

## 8. List Replace

Replaces elements in the index range with the new elements specified.


#### Example
```tcl
set a [list I am an ASIC RTL Verification Engineer]
set b [lreplace $a 4 5 Physical Design]
puts $b
```

#### Output
```text
I am an ASIC Physical Design Engineer
```

## 9. List Set

Set a particular index with the new element (change is made in the parent variable, so we should not use $a).


#### Example
```tcl
set a [list I am an ASIC RTL Design Engineer]
lset a 4 Physical
puts $a
```

#### Output
```text
I am an ASIC Physical Design Engineer
```

## 10. List Sort

Sorts elements in particular order.


### 10a. lsort 

Sorts according to ASCII value.


#### Example
```tcl
set a [list I am an ASIC Physical Desin Engineer]
set b [lsort $a]
puts $b
```

#### Output
```text
ASIC Design Engineer I Physical am an
```

#### Example
```tcl
set c [list 126 12345 223 45]
set d [lsort $c]
puts $d
```

#### Output
```text
12345 126 223 45
```

### 10b. lsort -dictionary

Sorts according to Alphabetical value.


#### Example
```tcl
set a [list I am an ASIC Physical Design Engineer]
set b [lsort -dictionary $a]
puts $b
```

#### Output
```text
am an ASIC Design Engineer I Physical
```

### 10c. lsort -integer

Sorts according to Numerical value.


#### Example
```tcl
set c [list 126 12345 223 45]
set d [lsort -integer $c]
puts $d
```

#### Output
```text
45 126 223 12345
```

### 10d. lsort -real

Sorts decimal numbers according to Numerical value.


#### Example
```tcl
set c [list 2.75 1.1 67.34 567.12]
set d [lsort -real $c]
puts $d
```

#### Output
```text
1.1 2.75 67.34 567.12
```

### 10e. lsort -unique

Sorts according to ASCII or Alphabetical or Numerical value as specified and displays unique occurences.


#### Example
```tcl
set a [list I am an ASIC Physical am Engineer an I ASIC]
set b [lsort -unique $a]
puts $b
```

#### Output
```text
ASIC Engineer I Physical am an
```

#### Example
```tcl
set a [list I am an ASIC Physical am Engineer an I ASIC]
set b [lsort -dictionary -unique $a]
puts $b
```

#### Output
```text
am an ASIC Engineer I Physical
```

#### Example
```tcl
set c [list 126 12345 223 45 126 67 45]
set d [lsort -integer -unique $c]
puts $d
```

#### Output
```text
45 67 126 223 12345
```

## 11. List Split
Splits into elements of a list based on a particular reference character.


#### Example
```tcl
set a [list I_am_an_ASIC_Physical_Design_Engineer]
set b [split $a "_"]
puts $b
```

#### Output
```text
I am an ASIC Physical Design Engineer
```
