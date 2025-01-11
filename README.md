# Objective-C NSManagedObjectContext Thread Safety Issue

This repository demonstrates a common error in Objective-C related to thread safety when using `NSManagedObjectContext`.  Attempting to save changes to the context from a background thread can result in unexpected crashes or data corruption. The solution showcases how to properly handle context saving using `performBlock:` or `performBlockAndWait:` to ensure thread safety.

## Problem
Saving the managed object context from a background thread is not thread-safe and can lead to crashes or corrupted data.

## Solution
Always use `performBlock:` or `performBlockAndWait:` to save changes on the main thread where the context was created.  `performBlockAndWait:` blocks the current thread until the save operation completes, which might not be suitable for background tasks. For background tasks, `performBlock:` is better. 