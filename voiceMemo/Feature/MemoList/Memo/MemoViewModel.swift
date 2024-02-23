//
//  MemoViewModel.swift
//  voiceMemo
//
//  Created by tecace on 2024/02/22.
//

import Foundation

class MemoViewModel : ObservableObject {
    @Published var memo: Memo
    
    init(memo: Memo) {
      self.memo = memo
    }
}
