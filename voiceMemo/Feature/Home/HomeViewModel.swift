//
//  HomeViewModel.swift
//  voiceMemo
//
//  Created by tecace on 2024/02/21.
//

import Foundation

class HomeViewModel : ObservableObject {
    @Published var selectedTab : Tab
    @Published var todosCount : Int
    @Published var memoCount : Int
    @Published var voiceRecorderCount : Int
    
    init(
        selectedTab : Tab = .voiceRecorder,
        todosCount : Int = 0,
        memoCount : Int = 0,
        voiceRecorderCount : Int = 0
    ){
        self.selectedTab = selectedTab
        self.todosCount = todosCount
        self.memoCount = memoCount
        self.voiceRecorderCount = voiceRecorderCount
    }
}

extension HomeViewModel {
    func setTodoCount(_ count: Int){
        todosCount = count
    }
    
    func setMemoCount(_ count: Int){
        memoCount = count
    }
    
    func setVoiceRecorderCount(_ count: Int){
        voiceRecorderCount = count
    }
    
    func changeSelectedTab(_ tab : Tab){
        selectedTab = tab
    }
    
}
