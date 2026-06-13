//
//  NetworkClient.swift
//  ModularRMPedia
//
//  Created by Arthur Danylenko on 13.06.2026.
//

import Foundation

protocol NetworkClient {
    func request(url: URL) async throws -> Data
}
