# ``HMError``

This code primarily extends the functionality of [Swift Errors](https://developer.apple.com/documentation/swift/error).

### Usage Examples

You've got the source code, so aside from reading this documentation, see the **Tests** folder for example usage! 😺

## Topics

- ``SomeError``
- ``Swift/Error/throw()``

### Error Coalescing

- ``¿?(_:_:)-3h8k7``
- ``¿?(_:_:)-1sqz9``
- ``¿?(_:_:)-6z1ub``
- ``¿?(_:_:)-4puh3``

### Force Casting Errors

If you control the source for a throwing function, you should  provide its error type. If you don't control the source, use these! Each overload is a mechanism to interface between untyped and typed errors.

- ``¿!(_:_:)-1m4a0``
- ``forceCastError(to:_:)-39yeh``
- ``¿!(_:_:)-2tbvm``
- ``forceCastError(to:_:)-7uuo5``
