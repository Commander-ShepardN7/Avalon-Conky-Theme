#!/bin/bash
#Commander-ShepardN7 - to add more deadlines, just copy variables and change it to deadline2, d2 ad infinitum
#Deadline date in YYYY/MM/DD format
deadline1="2025-03-10"


# Fecha actual
date=$(date +%Y-%m-%d)

# Difference between deadline and today's date
d1=$(( ( $(date -d "$deadline1" +%s) - $(date -d "$date" +%s) ) / 86400 ))

# offset, literally blank spaces, fill or delete at your leisure
offset="                                                                                          "  

# Display
if [ $d1 -ge 0 ]; then
    echo "${offset}Deadline 1: 10/03/25
${offset}$d1 days left."
fi


