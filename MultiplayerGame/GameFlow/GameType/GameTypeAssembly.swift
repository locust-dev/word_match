//
//  GameTypeAssembly.swift
//  MultiplayerGame
//
//  Created Ilya Turin on 21.03.2023.
//

import UIKit

enum GameTypeConfigurator {

    static func configure() -> PresentationViewModule<GameTypeModuleInput> {
        let router = GameTypeRouter()
        let interactor = GameTypeInteractor()
        let presenter = GameTypePresenter(
            interactor: interactor,
            router: router
        )
        let view = GameTypeViewController(presenter: presenter)

        interactor.presenter = presenter
        presenter.view = view
        router.transitionHandler = view

        return .init(interface: presenter, view: view)
    }

}
