//
//  CharactersListViewModel.swift
//  ModularRMPedia
//
//  Created by Arthur Danylenko on 13.06.2026.
//

import Foundation
import Combine

class CharactersListViewModel: ObservableObject {
    @Published var characters: [RMCharacterUIModel] = []
    @Published var canLoadMore: Bool = false
    var currentPage: Int = 0
    
    private let fetchCharactersUseCase: FetchCharactersUseCase
    init(fetchCharactersUseCase: FetchCharactersUseCase) {
        self.fetchCharactersUseCase = fetchCharactersUseCase
    }
    
    func fetchFirstCharacters() {
        self.fetchCharacters(forPage: 1)
    }
    
    func loadMore() {
        self.fetchCharacters(forPage: currentPage + 1)
    }
    
    private func fetchCharacters(forPage page: Int) {
        print("fetching for \(page)")
        Task {
            try? await Task.sleep(for: .seconds(2))
            
            do {
                let useCaseEntities = try await fetchCharactersUseCase.execute(forPage: page)
                let newCharacters = useCaseEntities.map { RMCharacterUIModel(from: $0) }
                characters.append(contentsOf: newCharacters)
                currentPage += 1
            } catch {
                print(error)
                print(error.localizedDescription)
            }
        }
    }
}
