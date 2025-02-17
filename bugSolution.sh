#!/bin/bash

# This script demonstrates a solution to the race condition bug using a lock file.

count=0
lock_file="count.lock"

function increment_count() {
  # Acquire lock
  flock -n "$lock_file" || exit 1 # exit if lock not acquired immediately

  local new_count=$((count + 1))
  count=$new_count
  echo "$new_count" > count.txt

  # Release lock
  flock -u "$lock_file"
}

# Create two processes that increment the count simultaneously
increment_count &
increment_count &

wait # Wait for background processes to finish

echo "Final count: $(cat count.txt)"