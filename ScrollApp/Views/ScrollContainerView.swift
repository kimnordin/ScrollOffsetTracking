//
//  ScrollContainerView.swift
//  ScrollApp
//
//  Created by Kim Nordin on 2024-02-06.
//

import SwiftUI

struct ScrollPreferenceKey: PreferenceKey {
    static let defaultValue = CGFloat.zero

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
}

struct ScrollContainerView<Content: View>: View {
    @State private var collapsedState: Bool = false
    @Binding var currentScroll: CGFloat
    let minScroll: CGFloat
    let maxScroll: CGFloat
    let contentViews: () -> Content
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            GeometryReader { geometry in
                Color.clear.preference(key: ScrollPreferenceKey.self, value: geometry.frame(in: .named("ScrollContainerView")).minY)
            }
            contentViews()
        }
        .coordinateSpace(name: "ScrollContainerView")
        .onScroll { offset in
            updateCurrentScroll(offset)
        }
    }
    
    private func updateCurrentScroll(_ offset: CGFloat) {
        if currentScroll < minScroll {
            currentScroll = minScroll
        } else if currentScroll > maxScroll {
            currentScroll = maxScroll
        } else {
            currentScroll += offset
        }
    }
}

extension View {
    func onScroll(offset: @escaping (CGFloat) -> Void) -> some View {
        onPreferenceChange(ScrollPreferenceKey.self) { offsetValue in
            offset(offsetValue)
        }
    }
}

struct ScrollContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollContainerView(currentScroll: .constant(150), minScroll: 50, maxScroll: 250) {
            Text("Hello World!")
        }
    }
}
