//
//  AssetMenuButtonStyle.swift
//  MyAssets
//
//  Created by HyeonSoo Kim on 2022/02/13.
//

import SwiftUI

//Modifier와 거의 비슷한 형태.
struct AssetMenuButtonStyle: ButtonStyle { //SwiftUI에서 제공하는 ButtonStyle이란 프로토콜이 있음.
    let menu: AssetMenu //가지는 값에 따라서 다른 UI가 나타나도록.
    
    func makeBody(configuration: Configuration) -> some View {
        return VStack {
            Image(systemName: menu.systemImageName)
                .resizable()
                .frame(width: 30, height: 30)
                .padding([.leading, .trailing], 10)
                .shadow(color: .blue, radius: 7, x: 0, y: 5)
            Text(menu.title)
                .font(.system(size: 12, weight: .bold))
        }
        .padding()
        .foregroundColor(.blue)
        .background(Color.white)
        //overlay-RoundedRectangle-stroke의 경우 테두리를 보여주는 경우고,
        //clipShape의 경우 정한 테두리를 따라 오려내는 느낌.
        .clipShape(RoundedRectangle(cornerRadius: 10)) //*****
    }
}

struct AssetMenuButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 10) {
            HStack(spacing: 10) {
                Button("") {
                    print("")
                }
                .buttonStyle(AssetMenuButtonStyle(menu: .creditScore))
                Button("") {
                    print("")
                }
                .buttonStyle(AssetMenuButtonStyle(menu: .bankAccount))
                Button("") {
                    print("")
                }
                .buttonStyle(AssetMenuButtonStyle(menu: .investment))
                Button("") {
                    print("")
                }
                .buttonStyle(AssetMenuButtonStyle(menu: .loan))
            }
            HStack(spacing: 10) {
                Button("") {
                    print("")
                }
                .buttonStyle(AssetMenuButtonStyle(menu: .insurance))
                Button("") {
                    print("")
                }
                .buttonStyle(AssetMenuButtonStyle(menu: .creditCard))
                Button("") {
                    print("")
                }
                .buttonStyle(AssetMenuButtonStyle(menu: .cash))
                Button("") {
                    print("")
                }
                .buttonStyle(AssetMenuButtonStyle(menu: .realEstate))
            }
        }
        .background(Color.gray.opacity(0.2))
    }
}
