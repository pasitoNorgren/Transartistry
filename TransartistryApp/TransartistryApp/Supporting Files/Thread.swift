//
//  Thread.swift
//  TransartistryApp
//
//  Created by Матвей Бойков on 07.01.2022.
//

import Foundation

func asyncOnMainThread(execute: @escaping EmptyClosure) {
    if Thread.isMainThread {
        execute()
    } else {
        DispatchQueue.main.async {
            execute()
        }
    }
}
