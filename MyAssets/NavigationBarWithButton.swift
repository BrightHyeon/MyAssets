//
//  NavigationBarWithButton.swift
//  MyAssets
//
//  Created by HyeonSoo Kim on 2022/02/13.
//

import SwiftUI

struct NavigationBarWithButton: ViewModifier { //수정자. 메서드(). 함수형태로 body구현.
    
    var title: String = ""
    
    func body(content: Content) -> some View {
        return content
            .navigationBarItems(
                leading: Text(title) //"내 자산"이란 Static한 title을 바로 넣는 것보단 추후 외부입력에 의해 손쉽게 변화될 수 있도록 따로 변수설정하는 것을 추천.
                    .font(.system(size: 24, weight: .bold))
                    .padding(),
                trailing: Button(
                    action: {
                        print("자산추가버튼 tapped")
                    }, label: { //버튼의 전체적인 레이아웃들을 설정
                        Image(systemName: "plus")
                        Text("자산추가")
                            .font(.system(size: 12))
                    })
                    .accentColor(.black)
                    .padding(EdgeInsets(top: 3, leading: 3, bottom: 3, trailing: 13))
//                    .cornerRadius(10)
                    .overlay( //위에 덮이게하는.
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black) //테두리
                    ) //이런 Modifier설정 등은 우측 속성관리자에서 검색하여 코드를 자동으로 추가할 수 도 있으니 참고.
            )
            .navigationBarTitleDisplayMode(.inline) //?????
            .onAppear { //init의 기능과 유사. 글고 UIKit적 기능 가져올수있다.
                //나타날 때 실행. 초기화코드느낌인거즁.
                let appearance = UINavigationBarAppearance()
                appearance.configureWithTransparentBackground() //투명도 설정 가능여부
                appearance.backgroundColor = UIColor(white: 1, alpha: 0.9) //투명도 설정
                UINavigationBar.appearance().standardAppearance = appearance // ***
                UINavigationBar.appearance().compactAppearance = appearance
                UINavigationBar.appearance().scrollEdgeAppearance = appearance // ***
            }
    }
}

//View를 extension해서 설정한 modifier를 사용할 수 있도록 설정. modifier(설정한 modifier) //이거안해도 바로 modifier로 불러올수도있음.
extension View {
    func navigationBarWithButtonStyle(_ title: String) -> some View {
        return self.modifier(NavigationBarWithButton(title: title))
    }
}

struct NavigationBarWithButton_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Color.gray.edgesIgnoringSafeArea(.all)
                .navigationBarWithButtonStyle("내 자산")
        }
    }
}
