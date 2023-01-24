//
//  UIStackView+.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/03.
//

import Foundation
import UIKit.UIStackView

extension UIStackView {
    func addArrangedSubviews(_ views: [UIView]) {
        for view in views {
            self.addArrangedSubview(view)
        }
    }
}
