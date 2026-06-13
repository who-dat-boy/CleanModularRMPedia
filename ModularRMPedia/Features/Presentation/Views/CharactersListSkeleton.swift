//
//  CharactersListSkeleton.swift
//  ModularRMPedia
//
//  Created by Arthur Danylenko on 13.06.2026.
//

import SwiftUI

struct CharactersListSkeleton: View {
    var body: some View {
        VStack(spacing: 10) {
            ForEach(0..<20, id: \.self) { _ in
                CharactersListCell(state: .loading)
            }
        }
    }
}

#Preview {
    CharactersListSkeleton()
}
