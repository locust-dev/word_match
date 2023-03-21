//
//  GameTypeInteractor.swift
//  MultiplayerGame
//
//  Created Ilya Turin on 21.03.2023.
//

import UIKit

protocol GameTypeInteractorInput { }

protocol GameTypeInteractorOutput: AnyObject { }

final class GameTypeInteractor {

    weak var presenter: GameTypeInteractorOutput?
}

extension GameTypeInteractor: GameTypeInteractorInput { }
