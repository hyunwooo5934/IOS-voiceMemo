//
//  Todo.swift
//  voiceMemo
//
//  Created by tecace on 2024/02/26.
//

import Foundation

struct Todo : Hashable {
    var title : String
    var content : String
    var time : Date
    var day : Date
    var selected: Bool
    
    var convertedDayAndTime : String {
        String("\(day.formattedDay) - \(time.formattedTime)에 알림")
    }
    
}

