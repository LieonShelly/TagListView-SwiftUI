# TagListView-SwiftUI

A simple and customizable tag list view for SwiftUI.

## Demo

Below is a demonstration of the TagListView in action:

![TagListView Demo](TaglListView.mov)

## Features

- Easy to integrate into any SwiftUI project.
- Customizable tag appearance (colors, corner radius).
- Automatic layout that flows tags into multiple lines.
- Handles tag selection state and provides a callback for tap events.

## Usage

### 1. Define your tags

First, create an array of `Tag` objects. Each `Tag` represents a single tag in the list.

```swift
import SwiftUI

// In your view
@State private var tags: [Tag] = [
    Tag(value: "SwiftUI"),
    Tag(value: "iOS"),
    Tag(value: "macOS"),
    Tag(value: "Apple"),
    Tag(value: "Xcode"),
    Tag(value: "Developer"),
    Tag(value: "WWDC")
]
```

The `Tag` struct has the following properties:
- `value: String`: The text displayed on the tag.
- `isSelected: Bool`: A boolean indicating if the tag is currently selected. Defaults to `false`.
- `tagId: String`: A unique identifier for the tag, generated automatically.

### 2. Add `TagListView` to your view

Create an instance of `TagListView` and pass your tags and desired customizations.

```swift
import SwiftUI

struct ContentView: View {
    @State private var tags: [Tag] = [
        Tag(value: "SwiftUI"),
        Tag(value: "iOS"),
        Tag(value: "macOS"),
        Tag(value: "Apple"),
        Tag(value: "Xcode"),
        Tag(value: "Developer"),
        Tag(value: "WWDC")
    ]

    var body: some View {
        VStack {
            TagListView(
                tags: tags,
                textColor: .primary,
                backgroundColor: .gray.opacity(0.2),
                selectedTextColor: .white,
                selectedBackgroundColor: .blue,
                cornorRadius: 8,
                didTapTag: { tag in
                    print("Tapped tag: \(tag.value), isSelected: \(tag.isSelected)")
                }
            )
            .padding()

            Spacer()
        }
    }
}
```

## Customization

You can customize the `TagListView` using the following parameters in its initializer:

| Parameter               | Type                    | Description                                         |
|-------------------------|-------------------------|-----------------------------------------------------|
| `tags`                  | `[Tag]`                 | An array of `Tag` objects to display.               |
| `textColor`             | `Color`                 | The text color for unselected tags.                 |
| `backgroundColor`       | `Color`                 | The background color for unselected tags.           |
| `selectedTextColor`     | `Color`                 | The text color for selected tags.                   |
| `selectedBackgroundColor`| `Color`                 | The background color for selected tags.             |
| `cornorRadius`          | `CGFloat`               | The corner radius for the tags.                     |
| `didTapTag`             | `((Tag) -> Void)?`      | A closure that's called when a tag is tapped. The selected state of the tag is already toggled when this is called. |

## How it works

The `TagListView` automatically calculates the required space for each tag and arranges them in horizontal rows. If the tags exceed the available width, it wraps them to the next line. The view's height adjusts dynamically based on its content.