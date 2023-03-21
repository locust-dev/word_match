//
//  GameTypePresenter.swift
//  MultiplayerGame
//
//  Created Ilya Turin on 21.03.2023.
//

import Foundation

protocol GameTypeModuleInput { }

final class GameTypePresenter {

    // MARK: - Properties

    weak var view: GameTypeViewInput?

    private let interactor: GameTypeInteractorInput
    private let router: GameTypeRouterInput


    // MARK: - Init

    init(
        interactor: GameTypeInteractorInput,
        router: GameTypeRouterInput
    ) {
        self.interactor = interactor
        self.router = router
    }
}

extension GameTypePresenter: GameTypeViewOutput {

    func viewIsReady() {
        let items = [
            GameTypeViewModel.Item(gameType: .first, viewModel: .init(title: "Режим 1")),
            GameTypeViewModel.Item(gameType: .second, viewModel: .init(title: "Режим 2")),
            GameTypeViewModel.Item(gameType: .third, viewModel: .init(title: "Режим 3")),
            GameTypeViewModel.Item(gameType: .fourth, viewModel: .init(title: "Режим 4"))
        ]
        view?.update(with: .init(items: items))
    }

    func didTapOnItem(with gameType: GameType) {
        router.openGame(with: gameType)
    }
}

extension GameTypePresenter: GameTypeInteractorOutput { }

extension GameTypePresenter: GameTypeModuleInput { }
