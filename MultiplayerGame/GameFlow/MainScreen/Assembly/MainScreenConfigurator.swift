//
//  MainScreenConfigurator.swift
//  MultiplayerGame
//
//  Created by Ilya Turin on 21.03.2023.
//

enum MainScreenConfigurator {

    static func configure() -> PresentationViewModule<MainScreenModuleInput> {
        let router = MainScreenRouter()
        let interactor = MainScreenInteractor()
        let presenter = MainScreenPresenter(
            interactor: interactor,
            router: router
        )
        let view = MainScreenViewController(presenter: presenter)

        interactor.presenter = presenter
        presenter.view = view
        router.transitionHandler = view

        return .init(interface: presenter, view: view)
    }

}
