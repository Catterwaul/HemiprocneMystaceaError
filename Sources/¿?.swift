infix operator ¿?: NilCoalescingPrecedence

/// When one throwing operation fails, attempt another.
///
/// This is an "**error-coalescing operator**".
/// - Bug: Autoclosures lose error type information, so `value1` has to be a closure,
/// not an autoclosure.
/// - Remark: `shift-option-?` *makes the `¿` symbol.*
public func ¿? <Value, Error1>(
  _ value0: @autoclosure () throws -> Value,
  _ value1: () throws(Error1) -> Value
) throws(Error1) -> Value {
  do { return try value0() }
  catch { return try value1() }
}

/// When one throwing operation fails, attempt another.
///
/// This is an "**error-coalescing operator**".
/// - Note: The compiler cannot deal with another overload where `value1` is  not`async`.
///   **Workaround**: When the compiler gains the ability to use sync overloads in an async context,
///   store the intermediate result and use the synchronous version of `??` on it.
/// - Bug: Autoclosures lose error type information, so `value1` has to be a closure,
/// not an autoclosure.
/// - Remark: `shift-option-?` *makes the `¿` symbol.*
public func ¿? <Value, Error1>(
  _ value0: @autoclosure () async throws -> Value,
  _ value1: () async throws(Error1) -> Value
) async throws(Error1) -> Value {
  do { return try await value0() }
  catch { return try await value1() }
}

// MARK: - Error transformation

/// Transform one error into another when an operation fails.
/// - Parameters:
///   - success: A potentially throwing value to evaluate.
///   - transform: A conversion to a different error type.
/// - Remark: `shift-option-?` *makes the `¿` symbol.*
public func ¿?<Success, Failure, NewFailure>(
  _ success: @autoclosure () throws(Failure) -> Success,
  _ transform: (Failure) -> NewFailure,
) throws(NewFailure) -> Success {
  do { return try success() }
  catch { throw transform(error) }
}

/// Transform one error into another when an operation fails.
/// - Parameters:
///   - success: A potentially throwing value to evaluate.
///   - transform: A conversion to a different error type.
/// - Remark: `shift-option-?` *makes the `¿` symbol.*
public func ¿?<Success, Failure, NewFailure>(
  _ success: @autoclosure () async throws(Failure) -> Success,
  _ transform: (Failure) -> NewFailure,
) async throws(NewFailure) -> Success {
  do { return try await success() }
  catch { throw transform(error) }
}
