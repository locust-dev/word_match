//
//  GameCreateRouter.swift
//  MultiplayerGame
//
//  Created Ilya Turin on 22.03.2023.
//

import UIKit

protocol GameCreateRouterInput {
    func openJoinRoom(_ roomNumber: String)
    func openCreateRoom()
}

final class GameCreateRouter {

    // MARK: - Properties

    var transitionHandler: TransitionHandlerProtocol?
}

extension GameCreateRouter: GameCreateRouterInput {

    func openJoinRoom(_ roomNumber: String) {

    }

    func openCreateRoom() {

    }
}
