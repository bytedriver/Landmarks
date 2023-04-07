//
//  PageViewController.swift
//  Landmarks
//
//  88                                                     88              88                                     
//  88                          ,d                         88              ""                                     
//  88                          88                         88                                                     
//  88,dPPYba,   8b       d8  MM88MMM  ,adPPYba,   ,adPPYb,88  8b,dPPYba,  88  8b       d8   ,adPPYba,  8b,dPPYba,
//  88P'    "8a  `8b     d8'    88    a8P_____88  a8"    `Y88  88P'   "Y8  88  `8b     d8'  a8P_____88  88P'   "Y8
//  88       d8   `8b   d8'     88    8PP"""""""  8b       88  88          88   `8b   d8'   8PP"""""""  88        
//  88b,   ,a8"    `8b,d8'      88,   "8b,   ,aa  "8a,   ,d88  88          88    `8b,d8'    "8b,   ,aa  88        
//  8Y"Ybbd8"'       Y88'       "Y888  `"Ybbd8"'   `"8bbdP"Y8  88          88      "8"       `"Ybbd8"'  88        
//                   d8'                                                                                          
//                  d8'                 THE WORLD'S FIRST BYTE DNA ARCHITECT                                      
//
//  Created by @bytedriver on 4/7/23.
//  Copyright © 2023 bytedriver. All rights reserved.
//

import SwiftUI
import UIKit

struct PageViewController<Page: View>: UIViewControllerRepresentable {
    var pages: [Page]
    @Binding var currentPage: Int
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal
        )
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator
        
        return pageViewController
    }
    
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            [context.coordinator.controllers[currentPage]],
            direction: .forward,
            animated: true
        )
    }
    
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        var parent: PageViewController
        var controllers = [UIViewController]()
        
        init(_ pageViewController: PageViewController) {
            parent = pageViewController
            controllers = parent.pages.map { UIHostingController(rootView: $0) }
        }
        
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerBefore viewController: UIViewController) -> UIViewController?
        {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index == 0 {
                return controllers.last
            }
            return controllers[index - 1]
        }
        
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerAfter viewController: UIViewController) -> UIViewController?
        {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index + 1 == controllers.count {
                return controllers.first
            }
            return controllers[index + 1]
        }
        
        func pageViewController(
            _ pageViewController: UIPageViewController,
            didFinishAnimating finished: Bool,
            previousViewControllers: [UIViewController],
            transitionCompleted completed: Bool)
        {
            if completed,
               let visibleViewController = pageViewController.viewControllers?.first,
               let index = controllers.firstIndex(of: visibleViewController) {
                parent.currentPage = index
            }
        }
    }
}
