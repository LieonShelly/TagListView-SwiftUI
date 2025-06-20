//
//  File.swift
//  TagListView
//
//  Created by Renjun Li on 2025/6/20.
//

import UIKit

extension String {
    func size(withFont font: UIFont) -> CGSize {
        let attributes = [NSAttributedString.Key.font: font]
        return (self as NSString).size(withAttributes: attributes)
    }
}
