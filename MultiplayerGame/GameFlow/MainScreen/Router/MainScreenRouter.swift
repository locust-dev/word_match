//
//  MainScreenRouter.swift
//  MultiplayerGame
//
//  Created by Ilya Turin on 21.03.2023.
//

protocol MainScreenRouterInput {
    func openRules()
    func openGameTypes()
}

final class MainScreenRouter {

    // MARK: - Properties

    weak var transitionHandler: TransitionHandlerProtocol?
}

extension MainScreenRouter: MainScreenRouterInput {

    func openRules() {
        let rulesModule = RulesConfigurator.configure()
        transitionHandler?.push(rulesModule.view, animated: true)
    }

    func openGameTypes() {
        let gameTypesModule = GameTypeConfigurator.configure()
        transitionHandler?.push(gameTypesModule.view, animated: true)
    }
}
