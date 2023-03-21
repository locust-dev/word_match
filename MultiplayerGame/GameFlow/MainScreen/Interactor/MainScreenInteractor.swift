//
//  MainScreenInteractor.swift
//  MultiplayerGame
//
//  Created by Ilya Turin on 21.03.2023.
//

protocol MainScreenInteractorInput { }

protocol MainScreenInteractorOutput: AnyObject { }

final class MainScreenInteractor {

    weak var presenter: MainScreenInteractorOutput?
}

extension MainScreenInteractor: MainScreenInteractorInput { }
