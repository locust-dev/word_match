//
//  RulesAssembly.swift
//  MultiplayerGame
//
//  Created Ilya Turin on 21.03.2023.
//

import UIKit

enum RulesConfigurator {

    static func configure() -> PresentationViewModule<RulesModuleInput> {
        let router = RulesRouter()
        let interactor = RulesInteractor()
        let presenter = RulesPresenter(
            interactor: interactor,
            router: router
        )
        let view = RulesViewController(presenter: presenter)

        interactor.presenter = presenter
        presenter.view = view

        return .init(interface: presenter, view: view)
    }

}
