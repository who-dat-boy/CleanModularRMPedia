//
//  RMCharacterUIModel+Mapper.swift
//  ModularRMPedia
//
//  Created by Arthur Danylenko on 13.06.2026.
//

extension RMCharacterUIModel {
    init(from domainEntity: RMCharacter) {
        self.id = domainEntity.id
        self.name = domainEntity.name
        self.image = domainEntity.image
        self.location = domainEntity.location
        self.origin = domainEntity.origin
        self.gender = domainEntity.gender
        self.apperances = String(domainEntity.episodes.count)
    }
}
