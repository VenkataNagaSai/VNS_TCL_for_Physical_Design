## Tier-3: Lists and Arrays

# ---------------------------------------------
# Sort Numbers in a List
# ---------------------------------------------

set nums {50 20 10 40 30}
puts [lsort -integer $nums]

# ---------------------------------------------
# Find Maximum Number in a List
# ---------------------------------------------

set nums {5 8 2 20 1}
set max [lindex $nums 0]
foreach n $nums {
    if {$n > $max} {
        set max $n
    }
}
puts $max

# ---------------------------------------------
# Count Occurrences in a List
# ---------------------------------------------

array set count {}
foreach item {A B A C B A} {
    incr count($item)
}
parray count

# ---------------------------------------------
# Remove Duplicates in a List
# ---------------------------------------------

set list {A B A C D B}
puts [lsort -unique $list]

# ---------------------------------------------
# Second Largest Number in a List
# ---------------------------------------------

set nums {5 20 15 30 10}
set sorted [lsort -integer $nums]
puts [lindex $sorted end-1]

# ---------------------------------------------
# Reverse a List
# ---------------------------------------------

set list {1 2 3 4 5}
puts [lreverse $list]

# ---------------------------------------------
# Find Common Elements in a List
# ---------------------------------------------

set list1 {A B C D}
set list2 {C D E F}
foreach item $list1 {
    if {[lsearch $list2 $item] != -1} {
        puts $item
    }
}
