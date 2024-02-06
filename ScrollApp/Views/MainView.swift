//
//  MainView.swift
//  ScrollApp
//
//  Created by Kim Nordin on 2024-02-06.
//

import SwiftUI

struct MainView: View {
    @State private var currentHeight: CGFloat = 150
    @State private var minHeight: CGFloat = 50
    @State private var maxHeight: CGFloat = 250
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerSize: .init(width: 10, height: 10))
                    .fill(.red)
                    .frame(height: currentHeight)
                    .frame(maxWidth: 300)
                Text("Height: \(Int(currentHeight))")
            }
            ScrollContainerView(currentScroll: $currentHeight, minScroll: minHeight, maxScroll: maxHeight) {
                ForEach(0..<10) { cellIndex in
                    ZStack {
                        SimpleCellView(index: cellIndex)
                    }
                }
            }
        }
    }
    
    @ViewBuilder private func SimpleCellView(index: Int) -> some View {
        ZStack {
            RoundedRectangle(cornerSize: .init(width: 5, height: 5))
                .fill(.blue)
                .frame(width: 200, height: 30)
            Text("Cell #\(index)")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
