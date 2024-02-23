//
//  Path.swift
//  voiceMemo
//
//  Created by tecace on 2024/02/21.
//

import Foundation

class PathModel : ObservableObject {
    @Published var paths : [PathType]
    
    init(paths: [PathType] = []) {
        self.paths = paths
    }
}
