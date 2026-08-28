#!/bin/bash
# Make sure the user has provided the CSV URL.
if [ -z "$1" ]; then
    echo "Usage: $0 <csv-url>"
    exit 1
fi
csv_url="$1"
temp_file=$(mktemp)
# CSV to temporary file.
if ! curl -L -s --fail "$csv_url" -o "$temp_file"; then
    echo "Error: unable to download the CSV file."
    rm -f "$temp_file"
    exit 1
fi

# Select company, location & founding year.
awk -F',' '
NR > 1 {
    company = $2
    location = $5
    year = $8

    gsub(/^"|"$/, "", company)
    gsub(/^"|"$/, "", location)
    gsub(/^"|"$/, "", year)

    print year "|" company "|" location
}
' "$temp_file" |
sort -t'|' -k1,1n |
awk -F'|' '
BEGIN {
    printf "%-8s %-45s %s\n", "Year", "Company", "Location"
    printf "%-8s %-45s %s\n", "--------", "---------------------------------------------", "--------------------"
}
{
    printf "%-8s %-45s %s\n", $1, $2, $3
}
'

# Delete temporary file if completed 
rm -f "$temp_file"


#End
