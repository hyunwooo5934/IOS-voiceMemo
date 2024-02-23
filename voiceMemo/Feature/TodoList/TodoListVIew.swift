//
//  TodoListVIew.swift
//  voiceMemo
//
//  Created by tecace on 2024/02/21.
//

import SwiftUI

struct TodoListVIew: View {
    var body: some View {
        
        ZStack {
            VStack {
                TitleView()
                    .padding(.top, 20)
                
                AnnouncementView()
            }
            
            WriteTodoBtnView()
                .padding(.trailing, 20)
                .padding(.bottom, 50)
        }
        
    }
}


// MARK: - TodoList 안내 뷰
private struct AnnouncementView: View {
  fileprivate var body: some View {
    VStack(spacing: 15) {
      Spacer()
      
      Image("pencil")
        .renderingMode(.template)
      Text("\"매일 아침 5시 운동하자!\"")
      Text("\"내일 8시 수강 신청하자!\"")
      Text("\"1시 반 점심약속 리마인드 해보자!\"")
      
      Spacer()
    }
    .font(.system(size: 16))
    .foregroundColor(.customGray2)
  }
}

// MARK: - TodoList 타이틀 뷰
private struct TitleView: View {
  @EnvironmentObject private var todoListViewModel: TodoListViewModel
  
  fileprivate var body: some View {
    HStack {
        Text("To do list를\n추가해 보세요.")
        Spacer()
    }
    .font(.system(size: 30, weight: .bold))
    .padding(.leading, 20)
  }
}

// MARK: Todo 작성버트 뷰
private struct WriteTodoBtnView: View {
  @EnvironmentObject private var pathModel: PathModel
  
  fileprivate var body: some View {
    VStack {
      Spacer()
      
      HStack {
        Spacer()
        
        Button(
          action: {
            pathModel.paths.append(.todoView)
          },
          label: {
            Image("writeBtn")
          }
        )
      }
    }
  }
}

struct TodoListVIew_Previews: PreviewProvider {
    static var previews: some View {
        TodoListVIew()
    }
}
