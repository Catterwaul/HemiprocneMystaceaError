public extension Error {
  /// `throw` this from a function, instead of returning a value.
  /// - Bug: You might think **`some Any`** would work as a return type,
  /// but no, [not yet at least](https://github.com/swiftlang/swift/issues/73558)?
  func `throw`<Never>() throws(Self) -> Never { throw self }

  /// `throw` this from a function, instead of returning a value.
  /// - Bug: You might think **`some Any`** would work as a return type,
  /// but no, [not yet at least](https://github.com/swiftlang/swift/issues/73558)?
  func `throw`<Input, Never>(_: Input) throws(Self) -> Never { throw self }
}
