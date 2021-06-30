
import SwiftUI

@propertyWrapper
public struct Converted<Input, Output>: DynamicProperty {

    @State private var input: Input
    private let convert: (Input) -> Output?

    private init(input: Input, convert: @escaping (Input) -> Output?) {
        _input = State(wrappedValue: input)
        self.convert = convert
    }

    public var projectedValue: Binding<Input> { $input }

    public var output: Output? { convert(input) }

    public var wrappedValue: Input {
        get { input }
        nonmutating set { input = newValue }
    }
}

// MARK: - Convertible

public protocol Convertible {
    associatedtype RawValue
    init(_ rawValue: RawValue)
}

extension Converted where Output: Convertible, Output.RawValue == Input {

    public init(wrappedValue: Input) {
        self.init(input: wrappedValue, convert: Output.init)
    }
}

// MARK: - OptionalConvertible

public protocol OptionalConvertible {
    associatedtype RawValue
    init?(_ rawValue: RawValue)
}

extension Converted where Output: OptionalConvertible, Output.RawValue == Input {

    public init(wrappedValue: Input) {
        self.init(input: wrappedValue, convert: Output.init)
    }
}

// MARK: - ThrowingConvertible

public protocol ThrowingConvertible {
    associatedtype RawValue
    init(_ rawValue: RawValue) throws
}

extension Converted where Output: ThrowingConvertible, Output.RawValue == Input {

    public init(wrappedValue: Input) {
        self.init(input: wrappedValue, convert: { try? Output($0) })
    }
}
