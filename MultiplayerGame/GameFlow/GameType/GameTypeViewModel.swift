//
//  GameTypeViewModel.swift
//  MultiplayerGame
//
//  Created Ilya Turin on 21.03.2023.
//

struct GameTypeViewModel {

    struct Item {
        let gameType: GameType
        let viewModel: GameTypeCell.Model
    }

    let items: [Item]
}
