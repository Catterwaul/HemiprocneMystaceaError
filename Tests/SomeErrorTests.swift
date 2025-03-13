import HMError
import Testing

struct SomeErrorTests {
  @Test func hashable() throws {
    let set = [SomeError()] as Set
    #expect(set == set)
  }
}
