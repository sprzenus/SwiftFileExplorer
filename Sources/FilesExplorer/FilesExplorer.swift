import Foundation

public struct FilesExplorer {
    private let workingDirectoryPath: String
    
//    private let fileManager: CustomFileManager

    public init(workingDirectoryPath: String) {
        self.workingDirectoryPath = workingDirectoryPath
//        self.fileManager = CustomFileManager()
    }
    
    public func discoverFiles(withExtension ext: String) -> [FilePath] {
        FileManager.default.changeCurrentDirectoryPath(workingDirectoryPath)
        let fileExtension = ext.removingPrefix(".")
        var discoveredFiles: [FilePath] = []
        let enumerator = FileManager.default.enumerator(
            at: URL(filePath: FileManager.default.currentDirectoryPath, directoryHint: .isDirectory),
            includingPropertiesForKeys: nil,
            options: [.skipsHiddenFiles],
            errorHandler: nil
        )
        while let file = enumerator?.nextObject() as? URL {
            print(file.absoluteString)
        }
        
        return discoveredFiles
    }
}

public struct FilePath: Equatable, Hashable {
    public let path: String
    public let name: String
    public let fileExtension: String
}

extension StringProtocol {
    func removingPrefix(_ other: some StringProtocol) -> SubSequence {
        guard self.hasPrefix(other) else { return self[...] }
        let firstIndex = index(startIndex, offsetBy: other.count)
        return self[firstIndex...]
    }
}

extension Substring {
    func toString() -> String {
        String(self)
    }
}


//final class CustomFileManager {
//    private let fileManager = FileManager.default
//
//    var currentDirectoryPath: String {
//        fileManager.currentDirectoryPath
//    }
//
//    func contentsOfCurrentDirectory() throws -> [String] {
//        fileManager.enumerator(
//            at: URL(filePath: currentDirectoryPath, directoryHint: .isDirectory),
//            includingPropertiesForKeys: nil,
//            options: [.skipsHiddenFiles],
//            errorHandler: nil
//        )
//    }
//}
