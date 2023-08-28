#!/bin/bash

# How to use this script?
#
# It's a template which needs further setup. Duplicate the file, 
# remove `.template.` from the filename and set the date you want.
# Optionally, adjust the raycast.title and raycast.icon according to your needs.
# You may need to install coreutils via homebrew to make this script work (gdate function).
#
# Homebrew: https://brew.sh/
# Coreutils: https://formulae.brew.sh/formula/coreutils

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Countdown to Date
# @raycast.mode inline

# Conditional parameters:
# @raycast.refreshTime 10m

# Optional parameters:
# @raycast.icon ⏱

# Documentation:
# @raycast.author Valentin Chrétien
# @raycast.authorURL https://github.com/valentinchrt
# @raycast.description See how many days/hours until a specific date.

# Configuration

# 1. Set the date you want by replacing yyyy-mm-dd in TIMESTAMP_EVENT (e.g. 2022-12-31)
# 2. Optionaly, you can set the time by editing T00:00:00+00:00
# 3. Write the message you want to display when the countdown is at 0 ("Your message!" line 46)
# 4. Get the amount of days and hours left until friday

TODAY=$(date +%u)  # Get the current day of the week (1-7, where 1 is Monday)
DAYS_UNTIL_FRIDAY=$((5 - TODAY))  # Calculate the number of days until Friday (5 is Friday)

if [[ $DAYS_UNTIL_FRIDAY -lt 0 ]]; then
    DAYS_UNTIL_FRIDAY=$((DAYS_UNTIL_FRIDAY + 7))  # If today is already Friday, count the days until the next Friday
fi

if [[ $DAYS_UNTIL_FRIDAY -eq 0 ]]; then
    echo "Today is Friday!"
elif [[ $DAYS_UNTIL_FRIDAY -eq 1 ]]; then
    echo "There is 1 day left until Friday."
else
    echo "There are $DAYS_UNTIL_FRIDAY days left until Friday."
fi