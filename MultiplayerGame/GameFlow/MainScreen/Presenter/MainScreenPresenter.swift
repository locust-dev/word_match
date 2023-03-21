//
//  MainScreenPresenter.swift
//  MultiplayerGame
//
//  Created by Ilya Turin on 21.03.2023.
//

import Foundation

protocol MainScreenModuleInput { }

final class MainScreenPresenter {

    // MARK: - Properties

    weak var view: MainScreenViewInput?

    private let interactor: MainScreenInteractorInput
    private let router: MainScreenRouterInput


    // MARK: - Init

    init(
        interactor: MainScreenInteractorInput,
        router: MainScreenRouterInput
    ) {
        self.interactor = interactor
        self.router = router
    }
}

extension MainScreenPresenter: MainScreenViewOutput {

    func viewIsReady() {

    }

    func didTapRulesButton() {
        router.openRules()
    }

    func didTapPlayButton() {
        router.openGameTypes()
    }
}

extension MainScreenPresenter: MainScreenInteractorOutput { }

extension MainScreenPresenter: MainScreenModuleInput { }
