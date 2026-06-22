
## Tier-2: File Handling

# ---------------------------------------------
# Count Number of Lines in a File
# ---------------------------------------------

set fp [open input.txt r]
set count 0
while {[gets $fp line] >= 0} {
    incr count
}
close $fp
puts "Lines = $count"

# ---------------------------------------------
# Count Number of Words
# ---------------------------------------------

set fp [open input.txt r]
set words 0
while {[gets $fp line] >= 0} {
    incr words [llength $line]
}
close $fp
puts $words

# ---------------------------------------------
# Find Particular Pattern in File
# ---------------------------------------------

while {[gets $fp line] >= 0} {
    if {[regexp {VIOLATED} $line]} {
        puts $line
    }
}

# ---------------------------------------------
# Remove Duplicate Lines
# ---------------------------------------------

array set seen {}
while {[gets $fp line] >= 0} {
    if {![info exists seen($line)]} {
        puts $line
        set seen($line) 1
    }
}

# ---------------------------------------------
# Count Blank Lines
# ---------------------------------------------

set count 0
while {[gets $fp line] >= 0} {
    if {[string trim $line] eq ""} {
        incr count
    }
}

# ---------------------------------------------
# Count Occurrence of Word "slack"
# ---------------------------------------------

set count 0
while {[gets $fp line] >= 0} {
    if {[regexp {slack} $line]} {
        incr count
    }
}

# ---------------------------------------------
# Print Only VIOLATED Paths
# ---------------------------------------------

while {[gets $fp line] >= 0} {
    if {[regexp {VIOLATED} $line]} {
        puts $line
    }
}

# ---------------------------------------------
# Copy One File to Another
# ---------------------------------------------

set in [open in.txt r]
set out [open out.txt w]
while {[gets $in line] >= 0} {
    puts $out $line
}
close $in
close $out

# ---------------------------------------------
# Find Longest Line
# ---------------------------------------------

set maxlen 0
while {[gets $fp line] >= 0} {
    if {[string length $line] > $maxlen} {
        set maxlen [string length $line]
    }
}
puts $maxlen
