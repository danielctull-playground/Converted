
import Converted

struct Name: Convertible {
    let rawValue: String
    init(_ rawValue: String) {
        self.rawValue = rawValue
    }
}

struct Email: OptionalConvertible {
    let rawValue: String
    init?(_ rawValue: String) {
        guard rawValue.contains("@") else { return nil }
        self.rawValue = rawValue
    }
}

struct Phone: ThrowingConvertible {
    let rawValue: String
    init(_ rawValue: String) throws {
        struct Failure: Error {}
        guard rawValue.allSatisfy(\.isNumber) else { throw Failure() }
        self.rawValue = rawValue
    }
}
