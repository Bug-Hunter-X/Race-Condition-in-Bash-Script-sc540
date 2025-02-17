# Race Condition in Bash Script

This repository demonstrates a race condition bug in a bash script.  Two processes attempt to increment a shared counter concurrently, resulting in an unpredictable and often incorrect final count.  The `bug.sh` file contains the buggy code, and `bugSolution.sh` provides a corrected version using a locking mechanism.

## Bug Description

A race condition occurs when multiple processes access and manipulate shared resources concurrently, leading to unexpected behavior.  In this case, the `count` variable is shared between the two processes.  The increment operation is not atomic (it involves multiple steps), allowing for inconsistencies when processes interleave their execution.

## Solution

The solution involves using a locking mechanism (in this case, a file lock) to ensure that only one process can access and modify the shared counter at a time, preventing race conditions. The corrected script demonstrates this.