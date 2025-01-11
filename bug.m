In Objective-C, a common yet subtle issue arises when dealing with `NSManagedObjectContext` and its interaction with threads.  Specifically, attempting to save changes to the context from a thread other than the one it was created on can lead to unexpected crashes or data corruption. This is because the context's internal state isn't thread-safe. 

```objectivec
// Incorrect: Saving context from a background thread
dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    [managedObjectContext save:&error]; // Potential crash or data corruption
});
```