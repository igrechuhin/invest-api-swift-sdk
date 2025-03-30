/// Форма выпуска.
public enum IssueKindType: String, Codable, Sendable {
    /// Документарная.
    case documentary
    
    /// Бездокументарная.
    case nonDocumentary = "non_documentary"
}
