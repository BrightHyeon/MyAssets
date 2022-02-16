//
//  PageControll.swift
//  MyAssets
//
//  Created by HyeonSoo Kim on 2022/02/16.
//

//각각의 PageViewControl에 들어갈 Page View에 대한 테이블.
import SwiftUI
import UIKit

struct PageControl: UIViewRepresentable {
    
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        control.addTarget(
            context.coordinator, //타겟
            action: #selector(Coordinator.updateCurrentPage(sender:)),
            for: .valueChanged //반응 매개체
        )
        
        return control
    }
    
    //UIView를 어떻게 update할지.
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
    
    class Coordinator: NSObject {
        var control: PageControl
        
        init(_ control: PageControl) {
            self.control = control
        }
        
        @objc func updateCurrentPage(sender: UIPageControl) {
            control.currentPage = sender.currentPage
        }
    }
}
