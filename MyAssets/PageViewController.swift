//
//  PageViewController.swift
//  MyAssets
//
//  Created by HyeonSoo Kim on 2022/02/13.
//

import SwiftUI
import UIKit

//미리만든 BannerCard란 Page를 다루는 PageViewController.
//Page로 View를 받고, UIViewControllerRepresentable프로토콜 채택.
struct PageViewController<Page: View>: UIViewControllerRepresentable {
    var pages: [Page]
    @Binding var currentPage: Int //현재 어떤 페이지가 보이고있는지를 확인.
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    } //일단 그냥 준수용.
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll, //전환형태
            navigationOrientation: .horizontal //전환방향
//            options: 옵션은 생략.
        )
        //페뷰컨의 dataSource및delegate는 context의 coordinator가 가져갈거야.
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator
        
        return pageViewController
    }
    
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            [context.coordinator.controllers[currentPage]],
            direction: .forward,
            animated: true
//            completion: 생략.
        )
    }
    
    //SwiftUI에서 UIKit의 UIPageViewController를 사용할건데 얘가 UIKit의 특징인 DataSource나 Delegate를 받을 수 있도록, 별도의 Coordinator(조정자)를 추가해줍니다. 이 안에서 DataSource, Delegate를 구현.
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        
        var parent: PageViewController
        var controllers = [UIViewController]()
        
        init(_ pageViewController: PageViewController) {
            parent = pageViewController
            controllers = parent.pages.map {
                UIHostingController(rootView: $0)
            }
        }
        //필수 UIPageViewControllerDelegate함수
        //지금 뷰컨의 이전 뷰컨은 누구냐? 하는 듯.
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController) else { return nil }
            if index == 0 {
                return controllers.last
            }
            
            return controllers[index - 1]
        }
        
        //지금 뷰컨의 다음 뷰컨을 지정.
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController) else { return nil } //firstIndex : 그 뷰컨이 나타난 위치의 인덱스
            if index == controllers.count - 1 {
                return controllers.first
            }
            
            return controllers[index + 1]
        }
    }
}
