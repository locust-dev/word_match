//
//  RulesPresenter.swift
//  MultiplayerGame
//
//  Created Ilya Turin on 21.03.2023.
//

import Foundation

protocol RulesModuleInput { }

final class RulesPresenter {

    // MARK: - Properties

    weak var view: RulesViewInput?

    private let interactor: RulesInteractorInput
    private let router: RulesRouterInput


    // MARK: - Init

    init(
        interactor: RulesInteractorInput,
        router: RulesRouterInput
    ) {
        self.interactor = interactor
        self.router = router
    }
}

extension RulesPresenter: RulesViewOutput {

    func viewIsReady() {

    }
}

extension RulesPresenter: RulesInteractorOutput { }

extension RulesPresenter: RulesModuleInput { }
