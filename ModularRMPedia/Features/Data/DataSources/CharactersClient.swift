//
//  CharactersClient.swift
//  ModularRMPedia
//
//  Created by Arthur Danylenko on 13.06.2026.
//

import Foundation

protocol CharactersClientDataSource {
    func fetchCharacters(forPage page: Int) async throws -> Root
}

struct CharactersClientDataSourceImpl: CharactersClientDataSource {
    let networkClient: URLSessionNetworkClient
    
    func fetchCharacters(forPage page: Int) async throws -> Root {
        let url = try getUrl(forPage: page)
        let data = try await networkClient.request(url: url)
        
        return try JSONDecoder().decode(Root.self, from: data)
    }
    
    func getUrl(forPage page: Int) throws -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "rickandmortyapi.com"
        components.path = "/api/character"
        components.query = "page=\(page)"
        
        guard let url = components.url else {
#if DEBUG
            print("failed to get url")
#endif
            
            throw URLError(.badURL)
        }
        
        return url
    }
}
