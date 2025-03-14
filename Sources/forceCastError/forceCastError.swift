
// MARK: - synchronous

/// Convert a closure that throws `any Error` to a typed throwing closure.
///
/// When you know for certain that a closure may only throw one type of error,
/// but that guarantee is not (or, due to compiler bugs, cannot be) represented in the type system,
/// you can use this to "convert" it to "typed throws".
/// - Parameters:
///   - errorType: The error type known for certain to be thrown by `value`.
///   - untypedErrorClosure: A closure that might throw an `Error`.
/// - Important: A crash will occur if `value` throws any type but `Error`.
/// - Returns: A closure. It will have typed error information, which is good,
/// but of course will lose argument labels if `value` is a function.
public func forceCastError<each Input, Value, Error>(
  to errorType: Error.Type = Error.self,
  _ untypedErrorClosure: @escaping (repeat each Input) throws -> Value
) -> (repeat each Input) throws(Error) -> Value {
  { (input: repeat each Input) in
    try untypedErrorClosure(repeat each input) ¿! Error.self
  }
}

// MARK: - asynchronous

/// Convert a closure that throws `any Error` to a typed throwing closure.
///
/// When you know for certain that a closure may only throw one type of error,
/// but that guarantee is not (or, due to compiler bugs, cannot be) represented in the type system,
/// you can use this to "convert" it to "typed throws".
/// - Parameters:
///   - errorType: The error type known for certain to be thrown by `value`.
///   - value: A closure that might throw an `Error`.
/// - Important: A crash will occur if `value` throws any type but `Error`.
/// - Returns: A closure. It will have typed error information, which is good,
/// but of course will lose argument labels if `value` is a function.
public func forceCastError<each Input, Value, Error>(
  to errorType: Error.Type = Error.self,
  _ value: @escaping (repeat each Input) async throws -> Value
) -> (repeat each Input) async throws(Error) -> Value {
  { (input: repeat each Input) in
    try await (await value(repeat each input)) ¿! Error.self
  }
}
