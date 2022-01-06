//
//  String+Localizable.swift
//  TransartistryApp
//
//  Created by Матвей Бойков on 05.01.2022.
//

import Foundation

extension String {
    
    func localized(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
        return NSLocalizedString(self, tableName: tableName, value: .empty, comment: .empty)
    }
}
