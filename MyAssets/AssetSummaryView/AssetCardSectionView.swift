//
//  AssetCardSectionView.swift
//  MyAssets
//
//  Created by HyeonSoo Kim on 2022/02/25.
//

import SwiftUI

struct AssetCardSectionView: View {
    @State private var selectedTab = 1 //default값.
    @ObservedObject var asset: Asset
    
    //얘는 바로 위 asset처럼 못가져오나...?
    var assetData: [AssetData] {
        return asset.data
    }
    
    var body: some View {
        VStack {
            AssetSectionHeaderView(title: asset.type.title)
            TabMenuView(
                tabs: ["지난달 결제", "이번달 결제", "다음달 결제"],
                selectedTab: $selectedTab,
                updated: .constant(.nextMonth(amount: "10000"))
            )
            TabView(
                selection: $selectedTab,
                content: {
                    ForEach(0...2, id: \.self) { i in
                        VStack {
                            ForEach(assetData) { data in
                                HStack {
                                    Text(data.title)
                                        .font(.title3)
                                        .foregroundColor(.secondary)
                                    Spacer()
                                    Text(data.creditCardAmounts![i].amount)
                                        .font(.title2)
                                        .foregroundColor(.primary)
                                }
                                Divider()
                            }
                        }
                        .tag(i)
                    }
                }
            )
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
        .padding()
    }
}

struct AssetCardSectionView_Previews: PreviewProvider {
    static var previews: some View {
        let asset = AssetSummaryData().assets[5]
        AssetCardSectionView(asset: asset)
    }
}
