# CallTestAndUndo

A simple contract that allows you to perform stateful invariant tests without changing global state

## Use Cases

When you're doing tests and don't want to track their side effects into the global state

You can use this abstract contract to perform the test and then revert all state changes

This way you can keep the "Story" simple while testing complex behavior

## Usage

Make your contract inherit `CallTestAndUndo`

Edit the function you want to test to require it being called by `this`

Use `_doTestAndReturnResult` to call the function (use `encodeCall`)
