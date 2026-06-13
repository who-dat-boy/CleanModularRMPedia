//
//  FetchCharactersUseCase.swift
//  ModularRMPedia
//
//  Created by Arthur Danylenko on 13.06.2026.
//

protocol FetchCharactersUseCase {
    func execute(forPage page: Int) async throws -> [RMCharacter]
}

struct FetchCharactersUseCaseImpl: FetchCharactersUseCase {
    private let charactersRepository: CharactersRepository
    
    init(charactersRepository: CharactersRepository) {
        self.charactersRepository = charactersRepository
    }
    
    func execute(forPage page: Int) async throws -> [RMCharacter] {
        try await charactersRepository.fetchCharacters(forPage: page)
    }
}
