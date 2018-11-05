//
//  BaseReducer.swift
//  FerqoIOS
//
//  Created by 蔡銘祐 on 2018/11/6.
//  Copyright © 2018 rae. All rights reserved.
//

import ReSwift
import ReSwiftRouter

func baseReducer(action : Action, state: AppState?) -> AppState {
    return AppState(
        navigationState:  NavigationReducer.handleAction(action, state: state?.navigationState)
    )
}
