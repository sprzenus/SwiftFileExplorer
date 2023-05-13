import Foundation

public struct FilesExplorer {
    private let workingDirectoryPath: String
    
    public init(workingDirectoryPath: String) {
        self.workingDirectoryPath = workingDirectoryPath
    }
    
    public func discoverFiles(withExtension ext: String) -> Set<FilePath> {
        let fileExtension = ext.removingPrefix(".").toString()
        var discoveredFiles: Set<FilePath> = []
        let enumerator = FileManager.default.enumerator(
            at: URL(string: workingDirectoryPath)!,
            includingPropertiesForKeys: nil,
            options: [],
            errorHandler: nil
        )
        while let file = enumerator?.nextObject() as? URL {
            let components = file.path().split(separator: "/", omittingEmptySubsequences: true).map { $0.toString() }
            guard let name = components.last,
                  name.hasSuffix("." + fileExtension)
            else { continue }
            
            discoveredFiles.insert(FilePath(path: file.path(), name: name, fileExtension: fileExtension))
        }
        
        return discoveredFiles
    }
}

public struct FilePath: Equatable, Hashable {
    public let path: String
    public let name: String
    public let fileExtension: String
    
    public init(path: String, name: String, fileExtension: String) {
        self.path = path
        self.name = name
        self.fileExtension = fileExtension
    }
}

extension StringProtocol {
    func removingPrefix(_ other: some StringProtocol) -> SubSequence {
        guard self.hasPrefix(other) else { return self[...] }
        let firstIndex = index(startIndex, offsetBy: other.count)
        return self[firstIndex...]
    }
}

extension StringProtocol {
    func toString() -> String {
        String(self)
    }
}
