import HMError
import Testing

struct ErrorTests {
  @Test func `throw`() throws {
    typealias Return = Void
    #expect(throws: SomeError()) { try SomeError().throw() as Return }
    #expect(throws: SomeError()) { try SomeError().throw(("🐈‍⬛", 9)) as Return }
  }
}
