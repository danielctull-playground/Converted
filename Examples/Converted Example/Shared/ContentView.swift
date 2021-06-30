
import Converted
import SwiftUI

struct ContentView: View {

    @Converted<String, Name> private var name = ""
    @Converted<String, Email> private var email = ""
    @Converted<String, Phone> private var phone = ""

    var body: some View {
        VStack {
            Field(name: "Name", value: _name)
            Field(name: "Email", value: _email)
            Field(name: "Phone", value: _phone)
        }
        .padding()
    }
}

private struct Field<Output>: View {

    let name: String
    @Converted<String, Output> var value: String

    var body: some View {
        HStack {
            TextField(name, text: $value)
            ValidityMarker(isValid: _value.output != nil)
        }
    }
}

private struct ValidityMarker: View {

    let isValid: Bool

    var body: some View {
        if isValid {
            Image(systemName: "checkmark.circle.fill")
                .foregroundColor(.green)
        } else {
            Image(systemName: "xmark.circle.fill")
                .foregroundColor(.red)
        }
    }
}
