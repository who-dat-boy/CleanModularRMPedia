//
//  CharactersRepository.swift
//  ModularRMPedia
//
//  Created by Arthur Danylenko on 13.06.2026.
//

struct CharactersRepositoryImpl: CharactersRepository {
    let remoteDataSource: CharactersClientDataSource
    
    func fetchCharacters(forPage page: Int) async throws -> [RMCharacter] {
        let root = try await remoteDataSource.fetchCharacters(forPage: page)
        return characters(from: root)
    }
    
    func characters(from root: Root) -> [RMCharacter] {
        root.results.map { characterNetwork in
            RMCharacter(
                id: characterNetwork.id,
                name: characterNetwork.name,
                image: characterNetwork.image,
                location: characterNetwork.location.name,
                origin: characterNetwork.origin.name,
                gender: characterNetwork.gender,
                episodes: characterNetwork.episode
            )
        }
    }
}
