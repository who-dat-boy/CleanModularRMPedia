//
//  FetchCharactersUseCase.swift
//  ModularRMPedia
//
//  Created by Arthur Danylenko on 13.06.2026.
//

protocol FetchCharactersUseCase {
    func execute(forPage page: Int) async throws -> ([RMCharacter], Bool)
}

struct FetchCharactersUseCaseImpl: FetchCharactersUseCase {
    private let charactersRepository: CharactersRepository
    
    init(charactersRepository: CharactersRepository) {
        self.charactersRepository = charactersRepository
    }
    
    func execute(forPage page: Int) async throws -> ([RMCharacter], Bool) {
        try await charactersRepository.fetchCharacters(forPage: page)
    }
}
