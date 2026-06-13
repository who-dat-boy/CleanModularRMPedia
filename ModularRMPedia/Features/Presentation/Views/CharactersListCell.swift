//
//  CharactersListCell.swift
//  ModularRMPedia
//
//  Created by Arthur Danylenko on 13.06.2026.
//

import SwiftUI

enum CharactersListCellState {
    case loading
    case result(RMCharacterUIModel)
    case error
}

struct CharactersListCell: View {
    let state: CharactersListCellState
    
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            characterImage()
            characterInfo
        }
        .background(.gray.opacity(0.04))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
    @ViewBuilder
    func characterImage() -> some View {
        switch state {
        case .loading:
            Color.gray
                .frame(width: 150, height: 200)
        case .result(let character):
            AsyncImage(url: URL(string: character.image)) { image in
                image.resizable().scaledToFill()
            } placeholder: {
                Color.gray
            }
            .frame(width: 150, height: 200)
            .clipped()
        case .error:
            Color.red
                .frame(width: 150, height: 200)
        }
    }
    
    var characterInfo: some View {
        VStack(alignment: .leading, spacing: 10) {
            switch state {
            case .loading:
                Rectangle()
                    .fill(.gray.opacity(0.2))
                    .frame(height: 25)
                
                VStack {
                    ForEach(0..<4, id: \.self) { _ in
                        Rectangle()
                            .fill(.gray.opacity(0.1))
                            .frame(height: 15)
                    }
                }
                .padding(.trailing)
            case .result(let character):
                Text(character.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading, spacing: 6) {
                    Label(character.location, systemImage: "globe")
                    Text("From: \(character.origin)")
                    Text("Total apperances: \(character.apperances)")
                    
                    Text("Sex: \(character.gender)")
                }
                .font(.callout)
            case .error:
                Color.red
            }
        }
        .padding([.vertical, .trailing])
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    CharactersListCell(
        state: .result(
            RMCharacterUIModel(
                id: 1,
                name: "Rick Sanchez",
                image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
                location: "Earth",
                origin: "Pussy",
                gender: "Male",
                apperances: "51"
            )
        )
    )
    .padding(20)
}
