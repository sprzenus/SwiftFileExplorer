import XCTest
@testable import FilesExplorer

final class FilesExplorerTests: XCTestCase {
    private let testPreparation = TestsPreparation()
    
    private var sut: FilesExplorer!
    
    private let swiftFiles: [String] = [
        "main.swift",
        "d1/f1.swift",
        "d1/f2.swift",
        "d2/d1/f3.swift",
    ]
    
    private let kotlinFiles: [String] = [
        "main.kt",
        "d1/f1.kt",
        "d1/f2.kt",
        "d2/d1/f3.kt",
    ]
    
    // MARK: - Setup
        
    override func setUp() async throws {
        let url = testPreparation.workingDirectory
        sut = FilesExplorer(workingDirectoryPath: url.path())
    }
    
    // MARK: - Tests
    
    func test_swiftExtension() throws {
        // Arrange
        try testPreparation.prepareForTests(files: swiftFiles)
        let filenames: [String] = swiftFiles.map { $0.split(separator: "/").last?.toString() ?? "" }
        
        // Act
        let files = sut.discoverFiles(withExtension: "swift")
        
        // Assert
        XCTAssertEqual(Set(files.map(\.name)), Set(filenames))
    }
    
    func test_swiftExtension_withDot() throws {
        // Arrange
        try testPreparation.prepareForTests(files: swiftFiles)
        let filenames: [String] = swiftFiles.map { $0.split(separator: "/").last?.toString() ?? "" }
        
        // Act
        let files = sut.discoverFiles(withExtension: ".swift")
        
        // Assert
        XCTAssertEqual(Set(files.map(\.name)), Set(filenames))
    }
    
    
    func test_kotlinExtension() throws {
        // Arrange
        try testPreparation.prepareForTests(files: kotlinFiles)
        let filenames: [String] = kotlinFiles.map { $0.split(separator: "/").last?.toString() ?? "" }
        
        // Act
        let files = sut.discoverFiles(withExtension: "kt")
        
        // Assert
        XCTAssertEqual(Set(files.map(\.name)), Set(filenames))
    }
}
