import XCTest
@testable import FilesExplorer

final class FilesExplorerTests: XCTestCase {
    private let sut = FilesExplorer(workingDirectoryPath: )
    
    func testExample() throws {
        XCTAssertEqual(sut.discoverFiles(withExtension: "swift"), [])
    }
}
