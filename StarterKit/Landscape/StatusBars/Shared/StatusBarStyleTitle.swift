import SwiftUI

@available(iOS 15.0, macOS 13.3, *)
struct StatusBarStyleTitle: ViewModifier {
    let title: String
    func body(content: Content) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .font(.headline)
                .padding(.leading, 24)
            content
        }
    }
}
