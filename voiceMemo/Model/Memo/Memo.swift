//
//  Memo.swift
//  voiceMemo
//
//  Created by tecace on 2024/02/21.
//

import Foundation

struct Memo : Hashable {
    var title : String
    var content : String
    var date : Date
    var id = UUID()
    
    var convertedDate: String {
      String("\(date.formattedDay) - \(date.formattedTime)")
    }

    
}
