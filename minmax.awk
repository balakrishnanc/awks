#!/usr/bin/env awk -f
# -*- mode: awk; coding: utf-8; fill-column: 80; -*-
#
# Compute the minimum and maximum value of items in the input stream.
# The caller could specify the exact column to analyze, if the input stream
# contains more than one column.
#
# [ Options ]
#
# col: Column index (one-based)
#

BEGIN {
    if (length(col) == 0) {
        col = 1
    } else {
        col=int(col)
    }
}

{ v = $(col) }

# Initialize MIN and MAX based with the first value.
NR == 1 {
    MIN = v
    MAX = v
    next
}

MIN > v {
    MIN = v
}

MAX < v {
    MAX = v
}

END {
    print MIN, MAX
}