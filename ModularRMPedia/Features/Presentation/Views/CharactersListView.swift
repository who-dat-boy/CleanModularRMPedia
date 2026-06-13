//
//  CharactersListView.swift
//  ModularRMPedia
//
//  Created by Arthur Danylenko on 13.06.2026.
//

import SwiftUI

struct CharactersListView: View {
    @StateObject private var viewModel: CharactersListViewModel
    
    init(viewModel: CharactersListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                if viewModel.viewItem.characters.isEmpty {
                    CharactersListSkeleton()
                        .padding(.horizontal)
                } else {
                    LazyVStack(spacing: 10) {
                        ForEach(viewModel.viewItem.characters) { character in
                            CharactersListCell(
                                state: .result(character)
                            )
                        }
                        
                        loadMoreButton()
                    }
                    .padding(.horizontal)
                }
            }
            .navigationTitle("Rick & Morty Wiki")
            .onAppear(perform: viewModel.fetchFirstCharacters)
        }
    }
    
    @ViewBuilder
    func loadMoreButton() -> some View {
        if viewModel.viewItem.canLoadMore {
            if viewModel.viewItem.isLoading {
                ProgressView()
            } else {
                Button("Load more", action: viewModel.loadMore)
            }
        }
    }
}

#Preview {
    CharactersListComposer.makeView()
}
