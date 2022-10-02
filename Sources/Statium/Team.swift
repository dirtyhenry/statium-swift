import Foundation

public struct Team {
    public let shortName: String
    public let mediumName: String
    public let longName: String
    public let abbreviatedName: String

    public init(mediumName: String) {
        shortName = mediumName
        self.mediumName = mediumName
        longName = mediumName
        abbreviatedName = mediumName
    }
}

public extension Team {
    enum FormatStyle {
        case short
        case medium
        case long
        case abbreviated
    }
}

extension Team.FormatStyle: Foundation.FormatStyle {
    public func format(_ value: Team) -> String {
        switch self {
        case .abbreviated: return value.abbreviatedName
        case .short: return value.shortName
        case .medium: return value.mediumName
        case .long: return value.longName
        }
    }
}

public extension Team.FormatStyle {
    enum ParsingError: Error {
        case invalidInput
    }

    struct ParseStrategy: Foundation.ParseStrategy {
        public func parse(_ value: String) throws -> Team {
            let mediumName = NSLocalizedString("\(value).medium", bundle: Bundle.module, comment: "")

            return Team(mediumName: mediumName)
        }
    }
}

extension Team.FormatStyle: ParseableFormatStyle {
    public var parseStrategy: Team.FormatStyle.ParseStrategy { .init() }
}

public extension Team {
    init(_ string: String) throws {
        self = try Team.FormatStyle.medium.parseStrategy.parse(string)
    }
}
