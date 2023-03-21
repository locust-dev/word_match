//
//  GameCreatePresenter.swift
//  MultiplayerGame
//
//  Created Ilya Turin on 22.03.2023.
//

import Foundation

protocol GameCreateModuleInput { }

final class GameCreatePresenter {

    // MARK: - Properties

    weak var view: GameCreateViewInput?

    private let interactor: GameCreateInteractorInput
    private let router: GameCreateRouterInput
    private let gameType: GameType


    // MARK: - Init

    init(
        interactor: GameCreateInteractorInput,
        router: GameCreateRouterInput,
        gameType: GameType
    ) {
        self.interactor = interactor
        self.router = router
        self.gameType = gameType
    }
}

extension GameCreatePresenter: GameCreateViewOutput {

    func viewIsReady() {

    }

    func didTapCreateRoomButton() {
        let generatedRoomNumber = Int.random(in: 100...999)
        interactor.startSession(with: String(generatedRoomNumber))
    }

    func didTapJoinRoomButton(with roomNumber: String) {
        interactor.startSession(with: roomNumber)
    }
}

extension GameCreatePresenter: GameCreateInteractorOutput {

    func didStartConnection() {

    }

    func didCloseConnection() {

    }
}

extension GameCreatePresenter: GameCreateModuleInput { }
