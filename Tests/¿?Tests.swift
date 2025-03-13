import HMError
import Testing
private import Thrappture

struct ErrorCoalescingOperatorTests {
  @Test func errorCoalescing() {
    let none: Bool? = .none
    #expect(try none.get() ¿? { true })
    #expect(throws: Bool?.Nil.self) {
      try none.get() ¿? none.get
    }

    struct Error1: Error { }
    #expect(throws: Error1.self) {
      try none.get() ¿? Error1().throw
    }

    struct Error2: Error { }
    #expect(throws: Error2.self) {
      try (none.get() ¿? Error1().throw) ¿? Error2().throw
    }
  }

  @Test func errorCoalescing_async() async {
    await #expect(throws: SomeError.self) {
      func `throw`() async throws(SomeError) {
        throw .init()
      }
      try await (await `throw`()) ¿? `throw`
    }
  }

  @Test func transformation() async {
    #expect(throws: 🦹.👿) {
      var value: Void {
        get throws(👿) { throw .👿 }
      }
      try value ¿? 🦹.init
    }
  }

  @Test func transformation_async() async {
    await #expect(throws: 🦹.👿) {
      var value: Void {
        get async throws(👿) { throw .👿 }
      }
      try await (await value) ¿? 🦹.init
    }
  }
}

private enum 👿: Error { case 👿 }
private enum 🦹: Error {
  case 👿, 🦹
  init(_: 👿) { self = .👿 }
}
