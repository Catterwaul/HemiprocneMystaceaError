/// Just some error.
///
/// `Hashable` for potential convenience.
public struct SomeError {
  public init() { }
}

extension SomeError: Error { }
extension SomeError: Hashable { }
