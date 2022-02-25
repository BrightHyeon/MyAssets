//
//  AssetSummaryData.swift
//  MyAssets
//
//  Created by HyeonSoo Kim on 2022/02/25.
//

import SwiftUI

class AssetSummaryData: ObservableObject {
    //data model ; Published - 어떠한 data를 내보낼지 표현하는 것. 발행.
    @Published var assets: [Asset] = load("assets.json")
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("\(filename)을 찾을 수 없습니다.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("\(filename)을 찾을 수 없습니다.")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("\(filename)을 \(T.self)로 parsing할 수 없습니다. \(error)")
    }
}

