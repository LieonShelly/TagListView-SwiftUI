//
//  Tag.swift
//  TagListView
//
//  Created by Renjun Li on 2025/6/20.
//
import Foundation

public struct Tag {
    public var isSelected: Bool = false
    public var value: String
    public let tagId: String = UUID().uuidString
    
    public init(
        isSelected: Bool = false,
        value: String
    ) {
        self.isSelected = isSelected
        self.value = value
    }
}
