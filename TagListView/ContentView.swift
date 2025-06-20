//
//  ContentView.swift
//  TagListView
//
//  Created by Renjun Li on 2025/6/20.
//

import SwiftUI

struct ContentView: View {
    let sampleTags = ["VisionKitVisionKitVisionKitVisionKit", "VisionKitVisionKitVisionKitVisionKit", "SwiftUI", "Combine", "CoreData", "Metal", "UIKit", "UIKit", "VisionKitVisionKitVisionKitVisionKit", "RealityKit","VisionKitVisionKitVisionKitVisionKit", "asdf", "SwiftUasdfasI", "Combine", "CoreData", "Metal", "UIKit", "UIKit", "adsfasfd", "asdasdf","VisionKitVisionKitVisionKitVisionKit", "VisionKitVisionKitVisionKitVisionKit", "SwiftUI", "Combine", "CoreData", "Metal", "asdfasdf", "UIKit", "VisionKitVisionKitVisionKitVisionKit", "RealityKit","asdfasdf", "VisionKitVisionKitVisionKitVisionKit", "SwiftUI", "Combine", "CoreData", "Metal", "UIKit", "UIKit", "VisionKitVisionKitVisionKitVisionKit", "RealityKit",]
    
    var body: some View {
        ScrollView {
            TagListView(
                tags: sampleTags.map { Tag(value: $0) },
                textColor: .textPrimary,
                backgroundColor: .backgroundGray,
                selectedTextColor: .backgroundWhite,
                selectedBackgroundColor: .tintPrimary,
                cornorRadius: 10
            )
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    ContentView()
}
