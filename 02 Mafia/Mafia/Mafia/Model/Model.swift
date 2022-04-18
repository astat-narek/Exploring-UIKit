//
//  Model.swift
//  Mafia
//
//  Created by Narek Danielyan on 18.04.2022.
//

import Foundation

struct Game {
    let partyId: Int
    let partyType: PartyType
    let player: [Player]
}

struct Player {
    let id: Int
    let alias: String
    let city: String
    let stats: Stats
}

struct Stats {
    let numberOfGamesPlayed: Int
    let numberOfGamesWon: Int
    let numberOfGamseLost: Int
}

enum PartyType {
    case free, tournament
}
