//
//  ContentView.swift
//  MyAssets
//
//  Created by HyeonSoo Kim on 2022/02/12.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection: Tab = .asset //기본설정. 첫 화면.
    //$ 통해 정보 들어오면 업데이트 될 것임. 이 뷰에서만 사용되기에 private.
    
    enum Tab { //열거형 ; Tab Bar 설정위한.
        case asset
        case recommend
        case alert
        case setting
    }
    
    var body: some View { //@State변수의 binding위한 $.
        TabView(selection: $selection) { //열거형 Tab
            AssetView()
                .tabItem {
                    Image(systemName: "dollarsign.circle.fill")
                    Text("자산")
                }
                .tag(Tab.asset)
            Color.blue
                .edgesIgnoringSafeArea(.all)
                .tabItem {
                    Image(systemName: "hand.thumbsup.fill")
                    Text("추천")
                }
                .tag(Tab.recommend)
            Color.yellow
                .edgesIgnoringSafeArea(.all)
                .tabItem {
                    Image(systemName: "bell.fill")
                    Text("알림")
                }
                .tag(Tab.alert)
            Color.red
                .edgesIgnoringSafeArea(.all)
                .tabItem {
                    Label("설정", systemImage: "gearshape.fill")
                } //이렇게 Label로 더 간편히 설정가능. but 안되는경우도 있다...주의!
                .tag(Tab.setting)
        }
        .accentColor(.purple) //강조컬러. 탭바의 경우, 선택 시 나타나는 컬러.
        .onAppear {
            UITabBar.appearance().backgroundColor = UIColor.lightGray
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
