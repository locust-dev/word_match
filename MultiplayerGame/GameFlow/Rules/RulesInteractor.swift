//
//  RulesInteractor.swift
//  MultiplayerGame
//
//  Created Ilya Turin on 21.03.2023.
//

import UIKit

protocol RulesInteractorInput { }

protocol RulesInteractorOutput: AnyObject { }

final class RulesInteractor {

    weak var presenter: RulesInteractorOutput?
}

extension RulesInteractor: RulesInteractorInput { }
