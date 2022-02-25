//
//  AssetView.swift
//  MyAssets
//
//  Created by HyeonSoo Kim on 2022/02/13.
//

import SwiftUI

struct AssetView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 30) {
                    Spacer() //여백주는 놈.
                    AssetMenuGridView()
                    AssetBannerView()
                        .aspectRatio(5/2, contentMode: .fit)
                    AssetSummaryView()
                        .environmentObject(AssetSummaryData())
                }
            }
            .background(Color.gray.opacity(0.2))
            .navigationBarWithButtonStyle("내 자산") //이거 여기추가하구나. 한층 바깥에서하는줄. 네비뷰 안의 스크롤뷰에 딸리네. 스크롤뷰가 덮고 있어서 그런듯!
        }
    }
}

struct AssetView_Previews: PreviewProvider {
    static var previews: some View {
        AssetView()
    }
}
