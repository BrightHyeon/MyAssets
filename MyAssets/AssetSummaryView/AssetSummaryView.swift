//
//  AssetSummaryView.swift
//  MyAssets
//
//  Created by HyeonSoo Kim on 2022/02/25.
//

import SwiftUI

struct AssetSummaryView: View {
    //외부에서 AssetSummaryData를 받아서 전체상태를 변경시키고 표현한다라는 의미의 프로퍼티래퍼.
    @EnvironmentObject var assetData: AssetSummaryData
    
    var assets: [Asset] {
        return assetData.assets
    }
    
    var body: some View {
        VStack(spacing: 20) {
            ForEach(assets) { asset in
                switch asset.type {
                case .creditCard:
                    AssetCardSectionView(asset: asset)
                        .frame(idealHeight: 250) //이상적인 height
                default:
                    AssetSectionView(assetSection: asset)
                }
            }
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding()
        }
    }
}

struct AssetSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        //@EnvironmentObject를 했을 때는 임의로 넣어줄 수 있음.
        AssetSummaryView()
            .environmentObject(AssetSummaryData())
            .background(Color.gray.opacity(0.2))
    }
}
