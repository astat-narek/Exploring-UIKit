//
//  Model.swift
//  Mafia
//
//  Created by Narek Danielyan on 18.04.2022.
//

import Foundation
import UIKit

struct Game {
    let partyId: Int
    let partyType: PartyType
    let player: [Player]

    enum PartyType {
        case free, tournament
    }
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

struct Card {

    let role: Role
    let roleImage: UIImage?
    let cardColor: UIColor
    let fontColor: UIColor
    
    enum Role: String {
        case sheriff = "Шериф"
        case villager = "Мирный"
        case mafiosi = "Мафия"
        case don = "Дон"
    }
}

let sheriffCard = Card(
    role: Card.Role.sheriff,
    roleImage: Constants.Image.sheriff ?? UIImage(),
    cardColor: Constants.Colors.yellow,
    fontColor: Constants.Colors.black
)

let villagerCard = Card(
    role: Card.Role.villager,
    roleImage: Constants.Image.villager ?? UIImage(),
    cardColor: Constants.Colors.red,
    fontColor: Constants.Colors.light
)


let mafiosiCard = Card(
    role: Card.Role.mafiosi,
    roleImage: Constants.Image.mafiosi ?? UIImage(),
    cardColor: Constants.Colors.black,
    fontColor: Constants.Colors.light
)

let donCard = Card(
    role: Card.Role.don,
    roleImage: Constants.Image.don ?? UIImage(),
    cardColor: Constants.Colors.purple,
    fontColor: Constants.Colors.light
)
