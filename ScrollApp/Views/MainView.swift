//
//  MainView.swift
//  ScrollApp
//
//  Created by Kim Nordin on 2024-02-06.
//

import SwiftUI

struct MainView: View {
    @State private var currentScroll: CGFloat = 150
    @State private var minScroll: CGFloat = 50
    @State private var maxScroll: CGFloat = 250
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(height: currentScroll)
                .frame(maxWidth: 300)
                .background(Color.red)
            ScrollContainerView(currentScroll: $currentScroll, minScroll: minScroll, maxScroll: maxScroll) {
                ForEach(0..<10) { cellIndex in
                    Text("Cell #\(cellIndex)")
                        .foregroundColor(.red)
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
