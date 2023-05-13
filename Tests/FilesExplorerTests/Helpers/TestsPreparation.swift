import Foundation

final class TestsPreparation {
    let workingDirectory = FileManager.default.temporaryDirectory.appending(
        path: "tmp/FilesExplorer-Swift-Tests"
    )
    
    @discardableResult
    func prepareForTests(files: [String]) throws -> URL {
        if FileManager.default.fileExists(atPath: workingDirectory.path()) {
            try FileManager.default.removeItem(at: workingDirectory)
        }
        try FileManager.default.createDirectory(at: workingDirectory, withIntermediateDirectories: true)
        
        for path in files {
            let components = path.split(separator: "/")
            if components.count > 1 {
                let dirPath = components[0..<components.count - 1].joined(separator: "/")
                try FileManager.default.createDirectory(at: workingDirectory.appending(path: dirPath), withIntermediateDirectories: true)
            }
            guard FileManager.default.createFile(
                atPath: workingDirectory.appending(path: path).path(),
                contents: "// main.swift".data(using: .utf8)
            ) else {
                throw "Cannot create the file"
            }
        }
        return workingDirectory
    }
}
