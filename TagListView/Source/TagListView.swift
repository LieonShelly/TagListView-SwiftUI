//
//  Tag.swift
//  TagListView
//
//  Created by Renjun Li on 2025/6/20.
//

import SwiftUI

public struct TagListView: View {
    @State private var tags: [Tag]
    @State private var intrinsicHeight: CGFloat = .zero
    private var didTapTag: ((Tag) -> Void)?
    private let itemSpacing: CGFloat = 10
    private let rowSpacing: CGFloat = 10
    private let textInset: EdgeInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
    private let font: UIFont = UIFont.systemFont(ofSize: 16)
    private let selectedTextColor: Color
    private let textColor: Color
    private let backgroundColor: Color
    private let selectedBackgroundColor: Color
    private let cornorRadius: CGFloat
    
    public init(
        tags: [Tag],
        textColor: Color,
        backgroundColor: Color,
        selectedTextColor: Color,
        selectedBackgroundColor: Color,
        cornorRadius: CGFloat,
        didTapTag: ((Tag) -> Void)? = nil
    ) {
        self.tags = tags
        self.didTapTag = didTapTag
        self.selectedTextColor = selectedTextColor
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.selectedBackgroundColor = selectedBackgroundColor
        self.cornorRadius = cornorRadius
    }
    
    public var body: some View {
        VStack {
            contentView()
        }
        .frame(height: intrinsicHeight)
    }
    
    private func contentView() -> some View {
        GeometryReader { geometry in
            var width: CGFloat = 0
            var rows: [[Tag]] = [[]]
            for tag in tags {
                let textWidth = tag.value.size(withFont: font).width
                let tagWidth = textWidth + textInset.leading + textInset.trailing
                let additionSpacing = rows[rows.count - 1].isEmpty ? 0 : itemSpacing
                let currentWidth = width + tagWidth + additionSpacing
                
                if currentWidth > geometry.size.width {
                    rows.append([tag])
                    width = tagWidth
                } else {
                    width += tagWidth + additionSpacing
                    rows[rows.count - 1].append(tag)
                }
            }
            
            return VStack(alignment: .center, spacing: rowSpacing) {
                ForEach(0 ..< rows.count, id: \.self) { rowIndex in
                    HStack(alignment: .center, spacing: itemSpacing) {
                        ForEach(rows[rowIndex], id: \.tagId) { tag in
                            tagView(tag)
                        }
                    }
                }
            }
            .background(
                GeometryReader { proxy in
                    Color.clear
                        .preference(key: ViewHeightKey.self, value: proxy.size.height)
                }
            )
        }
        .onPreferenceChange(ViewHeightKey.self) { value in
            intrinsicHeight = value
        }
    }
    
    private func tagView(_ tag: Tag) -> some View {
        Text(tag.value)
            .font(Font(font))
            .foregroundStyle(tag.isSelected ? selectedTextColor : textColor)
            .padding(textInset)
            .background(tag.isSelected ? selectedBackgroundColor : backgroundColor)
            .cornerRadius(cornorRadius)
            .onTapGesture {
                guard let index = tags.firstIndex(where: { $0.tagId == tag.tagId }) else { return }
                tags[index].isSelected = !tags[index].isSelected
                didTapTag?(tags[index])
            }
    }
}

private struct ViewHeightKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = max(value, nextValue())
    }
}
