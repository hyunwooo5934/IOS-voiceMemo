//
//  OnboardingView.swift
//  voiceMemo
//
//  Created by tecace on 2024/02/21.
//

import SwiftUI

struct OnboardingView: View {
    
    @StateObject private var onboardingViewModel = OnboardingViewModel()
    @StateObject private var pathModel = PathModel()
    @StateObject private var todoListViewModel = TodoListViewModel()
    @StateObject private var memoListViewModel = MemoListViewModel()
    
    @State private var actionValue: Int? = 1
    
    var body: some View {
        
//        NavigationView {
//            VStack {
//                NavigationLink(
//                    destination: Text("HomeView"),
//                    tag: 1,
//                    selection: actionValue
//                ) {
//                    HomeView()
//                        .navigationBarBackButtonHidden()
//                        .environmentObject(todoListViewModel)
//                        .environmentObject(memoListViewModel)
//                }
//
//                NavigationLink(
//                    destination: Text("HomeView"),
//                    tag: 2,
//                    selection: actionValue
//                ) {
//                    TodoView()
//                        .navigationBarBackButtonHidden()
//                        .environmentObject(todoListViewModel)
//                }
//
//                NavigationLink(
//                    destination: Text("HomeView"),
//                    tag: 3,
//                    selection: actionValue
//                ) {
//                    MemoView(
//                        memoViewModel: true
//                        ? .init(memo: .init(title: "", content: "", date: .now))
//                        : .init(memo: .init(title: "", content: "", date: .now)),
//                        isCreateMode: true
//                    )
//                    .navigationBarBackButtonHidden()
//                    .environmentObject(memoListViewModel)
//                }
//
//            }
//        }
//    }
//}

        
        
        

//        NavigationStack(path: $pathModel.paths) {
//            OnboardingContentView(onboardingViewModel: onboardingViewModel)
//                .navigationDestination(
//                    for: PathType.self,
//                    destination: { pathType in
//                        switch pathType {
//                        case .homeView :
//                            HomeView()
//                                .navigationBarBackButtonHidden()
//                                .environmentObject(todoListViewModel)
//                                .environmentObject(memoListViewModel)
//
//                        case .todoView :
////                            TodoListVIew()
//                            TodoView()
//                                .navigationBarBackButtonHidden()
//                                .environmentObject(todoListViewModel)
//
//                        case let .memoView(isCreateMode, memo):
//                          MemoView(
//                            memoViewModel: isCreateMode
//                            ? .init(memo: .init(title: "", content: "", date: .now))
//                            : .init(memo: memo ?? .init(title: "", content: "", date: .now)),
//                            isCreateMode: isCreateMode
//                          )
//                            .navigationBarBackButtonHidden()
//                            .environmentObject(memoListViewModel)
//                        }
//                    }
//                )
//        }
//        .environmentObject(pathModel)
//    }
//}
        
        NavigationStack(path: $pathModel.paths) {
          OnboardingContentView(onboardingViewModel: onboardingViewModel)
            .navigationDestination(
              for: PathType.self,
              destination: { pathType in
                switch pathType {
                case .homeView:
                  HomeView()
                    .navigationBarBackButtonHidden()
                    .environmentObject(todoListViewModel)
                    .environmentObject(memoListViewModel)
                  
                case .todoView:
                  TodoView()
                    .navigationBarBackButtonHidden()
                    .environmentObject(todoListViewModel)
                  
                case let .memoView(isCreateMode, memo):
                  MemoView(
                    memoViewModel: isCreateMode
                    ? .init(memo: .init(title: "", content: "", date: .now))
                    : .init(memo: memo ?? .init(title: "", content: "", date: .now)),
                    isCreateMode: isCreateMode
                  )
                    .navigationBarBackButtonHidden()
                    .environmentObject(memoListViewModel)
                }
              }
            )
        }
        .environmentObject(pathModel)
      }
    }

    

// MARK : 온보딩 컨텐츠 뷰
private struct OnboardingContentView : View {
    @ObservedObject private var onboardingViewModel : OnboardingViewModel
    
    fileprivate init(onboardingViewModel : OnboardingViewModel){
        self.onboardingViewModel = onboardingViewModel
    }
    
    fileprivate var body: some View {
        VStack {
            OnboardingCellListView(onboardingViewModel: onboardingViewModel)
            
            Spacer()
            
            StartBtnView()
            
            
            
        }
    }
}
    
    
    //  MARK: 온보딩 셀 리스트뷰
    private struct OnboardingCellListView: View {
        @ObservedObject private var onboardingViewModel: OnboardingViewModel
        @State private var selectedIndex: Int
        
        
        fileprivate init(
            onboardingViewModel: OnboardingViewModel,
            selectedIndex: Int = 0
        ) {
            self.onboardingViewModel = onboardingViewModel
            self.selectedIndex = selectedIndex
        }
        
        fileprivate var body: some View {
            ZStack {
                VStack {
                    TabView(selection: $selectedIndex) {
                        ForEach(Array(onboardingViewModel.onboardingContents.enumerated()), id: \.element) { index, onboardingContent in
                            OnboardingCellView(onboardingContent: onboardingContent)
                                .tag(index)
                        }
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.5)
                    .background(
                        selectedIndex % 2 == 0
                        ? Color.customSky
                        : Color.customBackgroundGreen
                    )
                    .clipped()
                    ControlBar
                }
            }
        }
        
        @ViewBuilder
        fileprivate var ControlBar: some View {
            HStack{
                PageIndicator(currentPage: $selectedIndex, numberOfPages: 4)
            }
        }
    }
    
    
    
    struct PageIndicator: UIViewRepresentable {
        @Binding var currentPage: Int // 현재 페이지 값
        var numberOfPages: Int // 총 페이지의 수
        var indicatorImage: String = "minus_sign" // 사용할 이미지 이름
        
        func makeUIView(context: Context) -> UIPageControl {
            let control = UIPageControl()
            control.numberOfPages = 1 // 초기화 값이고 update 하면서 덮어씌워질 것
            
            // 이미지를 적용하는 부분
            control.preferredIndicatorImage = UIImage(named: indicatorImage)
            control.currentPageIndicatorTintColor = UIColor(.black) // 현재 페이지 indicator의 강조 색상
            control.pageIndicatorTintColor = UIColor(.gray) // 기본 indicator의 강조 색상
            
            control.translatesAutoresizingMaskIntoConstraints = false // if you want to use auto layout to dynamically calculate the size and position of your view, you must set this property to false and then provide a non ambiguous, nonconflicting set of constraints for the view
            control.setContentHuggingPriority(.required, for: .horizontal) // hugging priority 낮을 수록 공간 차지 required = 1000 으로 최상위 우선순위
            
            return control
        }
        
        // binding property인 page 값이 update 시 call 된다.
        func updateUIView(_ control: UIPageControl, context: Context) {
            control.currentPage = currentPage // 현재 페이지 값을 갱신하여 강조 색상이 달라지게 한다.
            control.numberOfPages = numberOfPages
        }
    }
    
    
    // MARK: 온보딩 셀 뷰
    private struct OnboardingCellView : View {
        private var onboardingContent : OnboardingContent
        
        fileprivate init(onboardingContent: OnboardingContent) {
            self.onboardingContent = onboardingContent
        }
        
        fileprivate var body: some View {
            VStack{
                Image(onboardingContent.imageFileName)
                    .resizable()
                    .scaledToFit()
                HStack {
                    Spacer()
                    
                    VStack{
                        Spacer()
                            .frame(height: 46)
                        
                        Text(onboardingContent.title)
                            .font(.system(size: 16, weight: .bold))
                        
                        Spacer()
                            .frame(height: 5)
                        
                        Text(onboardingContent.subTitle)
                            .font(.system(size: 16))
                    }
                    
                    Spacer()
                    
                }
                .background(Color.customWhite)
                .cornerRadius(0)
            }
            .shadow(radius:  10)
        }
    }
    
    
    // MARK: 시작하기 버튼 뷰
    private struct StartBtnView : View {
        @EnvironmentObject private var pathModel : PathModel
        
        fileprivate var body: some View {
            Button (
                action: {
                    pathModel.paths.append(.homeView)
                },
                label: {
                    HStack {
                        Text("시작하기")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.customGreen)
                        
                        Image("startHome")
                            .renderingMode(.template)
                            .foregroundColor(.customGreen)
                        
                    }
                }
            )
            .padding(.bottom, 50)
        }
    }
    
    struct OnboardingView_Previews: PreviewProvider {
        static var previews: some View {
            OnboardingView()
        }
    }

