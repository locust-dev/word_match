//
//  GameTypeRouter.swift
//  MultiplayerGame
//
//  Created Ilya Turin on 21.03.2023.
//

import UIKit

protocol GameTypeRouterInput {
    func openGame(with type: GameType)
}

final class GameTypeRouter {

    // MARK: - Properties

    var transitionHandler: TransitionHandlerProtocol?

}

extension GameTypeRouter: GameTypeRouterInput {

    func openGame(with type: GameType) {
        let model = GameCreateConfigurator.Model(gameType: type)
        let module = GameCreateConfigurator.configure(with: model)
        transitionHandler?.push(module.view, animated: true)
    }
}
