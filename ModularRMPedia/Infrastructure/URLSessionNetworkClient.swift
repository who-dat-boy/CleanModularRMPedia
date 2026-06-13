//
//  URLSessionNetworkClient.swift
//  ModularRMPedia
//
//  Created by Arthur Danylenko on 13.06.2026.
//

import Foundation

struct URLSessionNetworkClient: NetworkClient {
    func request(url: URL) async throws -> Data {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        return data
    }
}
