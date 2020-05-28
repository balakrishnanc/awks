#!/usr/bin/env awk -f
# -*- mode: awk; coding: utf-8; fill-column: 80; -*-
#
# Swap two columns.
# The caller could specify the two columns to swap, if the input stream
# contains more than one column.
#
# [ Options ]
#
# lt: Left-column index (one-based)
# rt: Right-column index (one-based)
#

BEGIN {
    if ((length(lt) == 0) && (length(rt) == 0)) {
        # Swap first two columns.
        lt = 1
        rt = 2
    } else if ((length(lt) != 0) && (length(rt) != 0)) {
        lt = int(lt)
        rt = int(rt)
    } else {
        msg = "Either specify both 'lt' and 'rt' columns or specify none!"
        print msg > "/dev/stderr"
        exit 1
    }
}

{
    t = $(lt)
    $(lt) = $(rt)
    $(rt) = t
    print $0
}
