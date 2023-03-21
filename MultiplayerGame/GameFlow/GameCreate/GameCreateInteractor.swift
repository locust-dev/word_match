//
//  GameCreateInteractor.swift
//  MultiplayerGame
//
//  Created Ilya Turin on 22.03.2023.
//

import UIKit
import GameSessionProvider

protocol GameCreateInteractorInput {
    func startSession(with roomNumber: String)
}

protocol GameCreateInteractorOutput: AnyObject {
    func didStartConnection()
    func didCloseConnection()
}

final class GameCreateInteractor {

    // MARK: - Properties

    weak var presenter: GameCreateInteractorOutput?

    private let gameSessionManager = GameSessionTaskManager.shared

}

extension GameCreateInteractor: GameCreateInteractorInput {

    func startSession(with roomNumber: String) {
        gameSessionManager.delegate = self
      //  gameSessionManager.configure(roomID: roomNumber)
        gameSessionManager.startSession()
    }
    
}


// MARK: - GameSessionTaskManagerDelegate
extension GameCreateInteractor: GameSessionTaskManagerDelegate {

    func didOpenConnection() {
        presenter?.didStartConnection()
    }

    func didCloseConnection() {
        presenter?.didCloseConnection()
    }

    func didReceive(_ task: GameSessionTaskManager, data: Data) {

    }

}
