#!/bin/bash

# This script demonstrates a race condition bug.

count=0

function increment_count() {
  local new_count=$((count + 1))
  count=$new_count
}

# Create two processes that increment the count simultaneously
increment_count &
increment_count &

wait # Wait for background processes to finish

echo "Final count: $count"