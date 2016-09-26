//
//  AppManager.swift
//  SingingVoice
//
//  Created by 黄延 on 16/9/26.
//  Copyright © 2016年 黄延. All rights reserved.
//

import SnapKit


class AppManager: UIViewController {
    
    var anonymous: Bool = false
    
    enum State {
        case begin, sleep, logout, login
    }
    
    var state: State = .begin
    
    // app status control
    
    func login() {
        state = .login
    }
    
    func logout() {
        state = .logout
    }
    
    func sleep() {
        state = .sleep
    }
    
    func wakeUp() {
        if anonymous {
            state = .begin
        } else {
            state = .login
        }
    }
    
    //
    
    func checkAccountStatus() {
        
    }
    
    func initAlecrimCoreData() {
        
    }
    
    func initMessageManager() {
        
    }

}
