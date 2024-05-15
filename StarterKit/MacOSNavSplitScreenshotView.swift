#if canImport(AspirinShot)
import SwiftUI
import AspirinShot

@available(iOS 15.0, macOS 13.3, *)
extension Screenshot {
    static let macOSNavSplit = Screenshot("NavigationSplitView", for: .mac)
}

struct MacOSNavSplitScreenshotView: View {
    var body: some View {
        // On macOS, there's a lot that needs to be faked atm:
        // * NavigationSplitView: use a HStack
        // * controls & title bars: recreate them :/
        ScreenshotWithTitleView(.top(title: 0.2, screenshot: .fill(0.8))) {
            HStack(spacing: 1) {
                sidebar
                content
                detail
            }
            .foregroundStyle(.black)
            .background(Color(red: 0.835, green: 0.816, blue: 0.804, opacity: 1.0))
            .minimalBezel(borderStyle: .secondary, inset: true)
            .offset(y: 30)
        } title: {
            TextThatFills("This is a **work in progress**")
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .padding()
                .padding()
        } background: {
            Color.teal
        }
        .foregroundStyle(.white)
    }
    
    private var sidebar: some View {
        VStack(alignment: .leading) {
            HStack {
                MacOSWindowControls()
                    .macOSWindowBarStyle()
                Spacer()
                Image(systemName: "sidebar.leading")
                    .padding(.horizontal)
            }
            List {
                Section {
                    Text("Work", tableName: "AspirinShot")
                } header: {
                    Label("Favorites", systemImage: "star")
                        .font(.system(.body, weight: .regular))
                        .foregroundColor(.secondary)
                }
                Section {
                    Text("Work", tableName: "AspirinShot")
                    Text("In", tableName: "AspirinShot")
                    Text("Progress", tableName: "AspirinShot")
                } header: {
                    Label("Screenshots", systemImage: "folder")
                        .font(.system(.body, weight: .regular))
                        .foregroundColor(.secondary)
                }
            }
            .listStyle(.sidebar)
            .scrollContentBackground(.hidden)
            .background(.clear)
            .padding(.horizontal)
        }
        .frame(width: 250)
        .frame(maxHeight: .infinity)
        .background {
            Color(red: 0.918, green: 0.894, blue: 0.875, opacity: 1.0)
        }
    }
    
    private var content: some View {
        VStack(alignment: .leading, spacing: 1) {
            HStack {
                Text("Hello", tableName: "AspirinShot")
                    .font(.system(.title2, weight: .medium))
                    .padding(.leading)
                Spacer()
            }
            .frame(height: 52)
            .frame(maxWidth: .infinity)
            .background(Color(red: 0.941, green: 0.918, blue: 0.906, opacity: 1.0))
            List {
                Text("Hello", tableName: "AspirinShot")
                Text("Hello", tableName: "AspirinShot")
            }
        }
        .frame(width: 300)
    }
    
    private var detail: some View {
        VStack(alignment: .leading, spacing: 1) {
            HStack {
                
            }
            .frame(height: 52)
            .frame(maxWidth: .infinity)
            .background(Color(red: 0.941, green: 0.918, blue: 0.906, opacity: 1.0))
            
            VStack {
                Text("Hello", tableName: "AspirinShot")
                Text("@AspirinShot")
                    .bold()
            }
            .font(.largeTitle)
            .foregroundStyle(.black)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
        }
    }
}

struct MacOSNavSplitScreenshotView_Previews: PreviewProvider {
    static var previews: some View {
        ScreenshotPreviews(.minimalStyle, in: "en") {
            MacOSNavSplitScreenshotView()
        }
    }
}
#endif
