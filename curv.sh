#!/bin/bash

# list of curvature values you want to loop through
CURV_VALUES=(
#"1e-19" "1e-18" "1e-17" 
#"1e-16" "1.5e-16" "2e-16" "3e-16" "4e-16" "5e-16" "6e-16" "7e-16" "8e-16" "9e-16"
#"1e-15" "1.5e-15" "2e-15" "3e-15" "4e-15" "5e-15" "6e-15" "7e-15" "8e-15" "9e-15"
#"1e-14" "1.5e-14" "2e-14" "3e-14" "4e-14" "5e-14" "6e-14" "7e-14" "8e-14" "9e-14"
#"1e-13" "1.5e-13" "2e-13" "3e-13" "4e-13" "5e-13" "6e-13" "7e-13" "8e-13" "9e-13"
"1e-12" "1.5e-12" "2e-12" "3e-12" "4e-12" "5e-12" "6e-12" "7e-12" "8e-12" "9e-12"
"1e-11" "1.5e-11" "2e-11" "3e-11" "4e-11" "5e-11" "6e-11" "7e-11" "8e-11" "9e-11"
"1e-10" "1.5e-10" "2e-10" "3e-10" "4e-10" "5e-10" "6e-10" "7e-10" "8e-10" "9e-10"
"1e-9" "1.5e-9" "2e-9" "3e-9" "4e-9" "5e-9" "6e-9" "7e-9" "8e-9" "9e-9"
"1e-8" "1.5e-8" "2e-8" #"3e-8" "4e-8" "5e-8" "6e-8" "7e-8" "8e-8" "9e-8"
#"1e-7" "1.5e-7" "2e-7" "3e-7" "4e-7" "5e-7" "6e-7" "7e-7" "8e-7" "9e-7"
#"1e-6"
)

# output file where results will be saved
OUTPUT_FILE="znd_25iso.txt"

# initialize output file and write a header
echo "curv D lson" > "$OUTPUT_FILE"

# the actual file name in directory
REAL_FILE="znd.dat"

# check if the znd.dat file exists
if [ ! -f "$REAL_FILE" ]; then
    echo "Error: '$REAL_FILE' not found in this directory!"
    exit 1
fi

#echo "Backing up original $REAL_FILE..."
#cp "$REAL_FILE" "${REAL_FILE}.bak"

echo "Starting..."
echo "------------------------------------------------------"

# loop through each curv value
for curv in "${CURV_VALUES[@]}"; do
    echo "Running simulation for curv = $curv ..."

    # modify the curv line in znd.dat directly
    # find line starting with curv and replaces it
    sed -i '' "s/^curv .*/curv $curv/" "$REAL_FILE"

    # launch mg_torch and feed it $read znd
    sim_output=$(mg_torch << 'EOF'
$read znd
EOF
)
    # grab the line directly underneath curv D lson
    data_line=$(echo "$sim_output" | awk '/curv D lson/{getline; print}')

    # save data if successfully found
    if [ -n "$data_line" ]; then
        echo "$data_line" >> "$OUTPUT_FILE"
        echo "   -> Saved: $data_line"
    else
        echo "   -> Warning: Could not find output data for curv $curv"
    fi
done

echo "------------------------------------------------------"

echo "Complete! Results saved to $OUTPUT_FILE"