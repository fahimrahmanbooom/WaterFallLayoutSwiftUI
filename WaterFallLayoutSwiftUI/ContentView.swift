//
//  ContentView.swift
//  WaterFallLayoutSwiftUI
//
//  Created by Fahim Rahman on 21/9/22.
//

import SwiftUI

struct ContentView: View {
    
    struct GridItem: Identifiable {
        let id = UUID()
        let height: CGFloat
    }
    
    // increase gridItem to get more columns
    private let columns: [GridItem] = [GridItem(height: 200), GridItem(height: 230)]
    private let spacing: CGFloat = 10
    private let horizontalPadding: CGFloat = 10
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                HStack(alignment: .top, spacing: spacing, content: {
                    ForEach(columns) { column in
                        LazyVStack(spacing: spacing) {
                            // MARK: - Replace The Range With Data Count
                            ForEach(0..<40, id: \.self) { _ in
                                self.getItemView(gridItem: column)
                            }
                        }
                    }
                })
                .padding(.horizontal, horizontalPadding)
            }
            .navigationTitle("WaterFall")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func getItemView(gridItem: GridItem) -> some View {
        ZStack {
            GeometryReader { reader in
                // MARK: - Replace Your Dynamic View Here
                Rectangle()
                    .frame(width: reader.size.width, height: reader.size.height, alignment: .center)
                    .foregroundColor(.black.opacity(0.85))
            }
        }
        .frame(height: gridItem.height)
        .frame(maxWidth: .infinity)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
