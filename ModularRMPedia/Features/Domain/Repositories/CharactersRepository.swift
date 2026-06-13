//
//  CharactersRepository.swift
//  ModularRMPedia
//
//  Created by Arthur Danylenko on 13.06.2026.
//

protocol CharactersRepository {
    func fetchCharacters(forPage page: Int) async throws -> ([RMCharacter], Bool)
}
