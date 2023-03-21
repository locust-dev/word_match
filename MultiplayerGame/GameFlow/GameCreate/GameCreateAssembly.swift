//
//  GameCreateAssembly.swift
//  MultiplayerGame
//
//  Created Ilya Turin on 22.03.2023.
//

import UIKit

enum GameCreateConfigurator {

    struct Model {
        let gameType: GameType
    }

    static func configure(with model: Model) -> PresentationViewModule<GameCreateModuleInput> {
        let router = GameCreateRouter()
        let interactor = GameCreateInteractor()
        let presenter = GameCreatePresenter(
            interactor: interactor,
            router: router,
            gameType: model.gameType
        )
        let view = GameCreateViewController(presenter: presenter)

        interactor.presenter = presenter
        presenter.view = view

        return .init(interface: presenter, view: view)
    }

}
