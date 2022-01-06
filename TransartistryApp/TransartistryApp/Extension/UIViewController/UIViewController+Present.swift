//
//  UIViewController+Present.swift
//  TransartistryApp
//
//  Created by Матвей Бойков on 07.01.2022.
//

import Foundation
import UIKit

extension UIViewController {
    
    func present(viewController: UIViewController) {
        present(viewController, animated: true, completion: nil)
    }
}
