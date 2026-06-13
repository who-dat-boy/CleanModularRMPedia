//
//  CharactersListComposer.swift
//  ModularRMPedia
//
//  Created by Arthur Danylenko on 13.06.2026.
//

struct CharactersListComposer {
    @MainActor
    static func makeView() -> CharactersListView {
        // Infrastructure Layer
        let networkClient = URLSessionNetworkClient()
        
        // Data Layer
        let remoteDataSource = CharactersClientDataSourceImpl(networkClient: networkClient)
        let repository = CharactersRepositoryImpl(remoteDataSource: remoteDataSource)
        
        // Domain Layer
        let useCase = FetchCharactersUseCaseImpl(charactersRepository: repository)
        
        // Presentation Layer
        let viewModel = CharactersListViewModel(fetchCharactersUseCase: useCase)
        
        // Compose
        return CharactersListView(viewModel: viewModel)
    }
}
