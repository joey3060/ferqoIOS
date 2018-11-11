//
//  Router.swift
//  FerqoIOS
//
//  Created by 蔡銘祐 on 2018/11/6.
//  Copyright © 2018 rae. All rights reserved.
//
import UIKit
import ReSwiftRouter



class RootRoute: Routable {
    let window: UIWindow
    let rootViewController: UIViewController
    let router: RouterModel
    
    init(window: UIWindow) {
        self.window = window
        self.rootViewController = window.rootViewController!
        self.router = RouterModel(window.rootViewController!)
    }
    
    func pushRouteSegment(
        _ routeElementIdentifier: RouteElementIdentifier,
        animated: Bool,
        completionHandler: @escaping RoutingCompletionHandler) -> Routable
    {
        if routeElementIdentifier == "menu" {
            router.loadToRoute("menuList", board: "Menu").preset()
        } else {
            router.loadToRoute("splashView", board: "Splash").preset()
        }
        
        return MainRouteable()
    }
    
    func changeRouteSegment(
        _ from: RouteElementIdentifier,
        to: RouteElementIdentifier,
        animated: Bool,
        completionHandler: @escaping RoutingCompletionHandler) -> Routable
    {
        
        print(to == "Login")
        if to == "Login" {
            router.loadToRoute("inputPage", board: "Login").preset()
        }
        
        return MainRouteable()
    }
}

class MainRouteable: Routable {}
