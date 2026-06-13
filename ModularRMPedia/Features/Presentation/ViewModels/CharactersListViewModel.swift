//
//  CharactersListViewModel.swift
//  ModularRMPedia
//
//  Created by Arthur Danylenko on 13.06.2026.
//

import Foundation
import Combine

class CharactersListViewModel: ObservableObject {
    @Published var viewItem = ViewItem(characters: [], canLoadMore: false, isLoading: false)
    var currentPage: Int = 40
    
    private let fetchCharactersUseCase: FetchCharactersUseCase
    init(fetchCharactersUseCase: FetchCharactersUseCase) {
        self.fetchCharactersUseCase = fetchCharactersUseCase
    }
    
    func fetchFirstCharacters() {
        self.fetchCharacters(forPage: 41)
    }
    
    func loadMore() {
        self.fetchCharacters(forPage: currentPage + 1)
    }
    
    private func fetchCharacters(forPage page: Int) {
        print("fetching for \(page)")
        startLoading()
        
        Task {
            try? await Task.sleep(for: .seconds(2))
            
            do {
                let (useCaseEntities, isLast) = try await fetchCharactersUseCase.execute(forPage: page)
                let newCharacters = useCaseEntities.map { RMCharacterUIModel(from: $0) }
                
                let viewItem = ViewItem(
                    characters: viewItem.characters + newCharacters,
                    canLoadMore: !isLast,
                    isLoading: false
                )
                
                self.viewItem = viewItem
                currentPage += 1
            } catch {
                print(error)
                print(error.localizedDescription)
            }
        }
    }
    
    private func startLoading() {
        let viewItem = ViewItem(
            characters: viewItem.characters,
            canLoadMore: viewItem.canLoadMore,
            isLoading: true
        )
        
        self.viewItem = viewItem
    }
}

extension CharactersListViewModel {
    struct ViewItem {
        let characters: [RMCharacterUIModel]
        let canLoadMore: Bool
        let isLoading: Bool
    }
}
