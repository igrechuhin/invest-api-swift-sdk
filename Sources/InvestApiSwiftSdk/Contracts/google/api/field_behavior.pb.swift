// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: google/api/field_behavior.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

// Copyright 2023 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
    struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
    typealias Version = _2
}

/// An indicator of the behavior of a given field (for example, that a field
/// is required in requests, or given as output but ignored as input).
/// This **does not** change the behavior in protocol buffers itself; it only
/// denotes the behavior and may affect how API tooling handles the field.
///
/// Note: This enum **may** receive new values in the future.
public enum Google_Api_FieldBehavior: SwiftProtobuf.Enum {
    public typealias RawValue = Int
    
    /// Conventional default for enums. Do not use this.
    case unspecified // = 0
    
    /// Specifically denotes a field as optional.
    /// While all fields in protocol buffers are optional, this may be specified
    /// for emphasis if appropriate.
    case `optional` // = 1
    
    /// Denotes a field as required.
    /// This indicates that the field **must** be provided as part of the request,
    /// and failure to do so will cause an error (usually `INVALID_ARGUMENT`).
    case `required` // = 2
    
    /// Denotes a field as output only.
    /// This indicates that the field is provided in responses, but including the
    /// field in a request does nothing (the server *must* ignore it and
    /// *must not* throw an error as a result of the field's presence).
    case outputOnly // = 3
    
    /// Denotes a field as input only.
    /// This indicates that the field is provided in requests, and the
    /// corresponding field is not included in output.
    case inputOnly // = 4
    
    /// Denotes a field as immutable.
    /// This indicates that the field may be set once in a request to create a
    /// resource, but may not be changed thereafter.
    case immutable // = 5
    
    /// Denotes that a (repeated) field is an unordered list.
    /// This indicates that the service may provide the elements of the list
    /// in any arbitrary  order, rather than the order the user originally
    /// provided. Additionally, the list's order may or may not be stable.
    case unorderedList // = 6
    
    /// Denotes that this field returns a non-empty default value if not set.
    /// This indicates that if the user provides the empty value in a request,
    /// a non-empty value will be returned. The user will not be aware of what
    /// non-empty value to expect.
    case nonEmptyDefault // = 7
    case UNRECOGNIZED(Int)
    
    public init() {
        self = .unspecified
    }
    
    public init?(rawValue: Int) {
        switch rawValue {
        case 0: self = .unspecified
        case 1: self = .optional
        case 2: self = .required
        case 3: self = .outputOnly
        case 4: self = .inputOnly
        case 5: self = .immutable
        case 6: self = .unorderedList
        case 7: self = .nonEmptyDefault
        default: self = .UNRECOGNIZED(rawValue)
        }
    }
    
    public var rawValue: Int {
        switch self {
        case .unspecified: return 0
        case .optional: return 1
        case .required: return 2
        case .outputOnly: return 3
        case .inputOnly: return 4
        case .immutable: return 5
        case .unorderedList: return 6
        case .nonEmptyDefault: return 7
        case .UNRECOGNIZED(let i): return i
        }
    }
    
}

#if swift(>=4.2)

extension Google_Api_FieldBehavior: CaseIterable {
    // The compiler won't synthesize support with the UNRECOGNIZED case.
    public static let allCases: [Google_Api_FieldBehavior] = [
        .unspecified,
        .optional,
        .required,
        .outputOnly,
        .inputOnly,
        .immutable,
        .unorderedList,
        .nonEmptyDefault,
    ]
}

#endif  // swift(>=4.2)

#if swift(>=5.5) && canImport(_Concurrency)
extension Google_Api_FieldBehavior: @unchecked Sendable {}
#endif  // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Extension support defined in field_behavior.proto.

// MARK: - Extension Properties

// Swift Extensions on the exteneded Messages to add easy access to the declared
// extension fields. The names are based on the extension field name from the proto
// declaration. To avoid naming collisions, the names are prefixed with the name of
// the scope where the extend directive occurs.

extension SwiftProtobuf.Google_Protobuf_FieldOptions {
    
    /// A designation of a specific field behavior (required, output only, etc.)
    /// in protobuf messages.
    ///
    /// Examples:
    ///
    ///   string name = 1 [(google.api.field_behavior) = REQUIRED];
    ///   State state = 1 [(google.api.field_behavior) = OUTPUT_ONLY];
    ///   google.protobuf.Duration ttl = 1
    ///     [(google.api.field_behavior) = INPUT_ONLY];
    ///   google.protobuf.Timestamp expire_time = 1
    ///     [(google.api.field_behavior) = OUTPUT_ONLY,
    ///      (google.api.field_behavior) = IMMUTABLE];
    public var Google_Api_fieldBehavior: [Google_Api_FieldBehavior] {
        get {return getExtensionValue(ext: Google_Api_Extensions_field_behavior) ?? []}
        set {setExtensionValue(ext: Google_Api_Extensions_field_behavior, value: newValue)}
    }
    /// Returns true if extension `Google_Api_Extensions_field_behavior`
    /// has been explicitly set.
    public var hasGoogle_Api_fieldBehavior: Bool {
        return hasExtensionValue(ext: Google_Api_Extensions_field_behavior)
    }
    /// Clears the value of extension `Google_Api_Extensions_field_behavior`.
    /// Subsequent reads from it will return its default value.
    public mutating func clearGoogle_Api_fieldBehavior() {
        clearExtensionValue(ext: Google_Api_Extensions_field_behavior)
    }
    
}

// MARK: - File's ExtensionMap: Google_Api_FieldBehavior_Extensions

/// A `SwiftProtobuf.SimpleExtensionMap` that includes all of the extensions defined by
/// this .proto file. It can be used any place an `SwiftProtobuf.ExtensionMap` is needed
/// in parsing, or it can be combined with other `SwiftProtobuf.SimpleExtensionMap`s to create
/// a larger `SwiftProtobuf.SimpleExtensionMap`.
public let Google_Api_FieldBehavior_Extensions: SwiftProtobuf.SimpleExtensionMap = [
    Google_Api_Extensions_field_behavior
]

// Extension Objects - The only reason these might be needed is when manually
// constructing a `SimpleExtensionMap`, otherwise, use the above _Extension Properties_
// accessors for the extension fields on the messages directly.

/// A designation of a specific field behavior (required, output only, etc.)
/// in protobuf messages.
///
/// Examples:
///
///   string name = 1 [(google.api.field_behavior) = REQUIRED];
///   State state = 1 [(google.api.field_behavior) = OUTPUT_ONLY];
///   google.protobuf.Duration ttl = 1
///     [(google.api.field_behavior) = INPUT_ONLY];
///   google.protobuf.Timestamp expire_time = 1
///     [(google.api.field_behavior) = OUTPUT_ONLY,
///      (google.api.field_behavior) = IMMUTABLE];
public let Google_Api_Extensions_field_behavior = SwiftProtobuf.MessageExtension<SwiftProtobuf.PackedEnumExtensionField<Google_Api_FieldBehavior>, SwiftProtobuf.Google_Protobuf_FieldOptions>(
    _protobuf_fieldNumber: 1052,
    fieldName: "google.api.field_behavior"
)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

extension Google_Api_FieldBehavior: SwiftProtobuf._ProtoNameProviding {
    public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        0: .same(proto: "FIELD_BEHAVIOR_UNSPECIFIED"),
        1: .same(proto: "OPTIONAL"),
        2: .same(proto: "REQUIRED"),
        3: .same(proto: "OUTPUT_ONLY"),
        4: .same(proto: "INPUT_ONLY"),
        5: .same(proto: "IMMUTABLE"),
        6: .same(proto: "UNORDERED_LIST"),
        7: .same(proto: "NON_EMPTY_DEFAULT"),
    ]
}
