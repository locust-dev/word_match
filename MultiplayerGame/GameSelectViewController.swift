//
//  GameSelectViewController.swift
//  MultiplayerGame
//
//  Created by Ilya Turin on 16.03.2023.
//

import UIKit

final class GameSelectViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presentMatch()
    }

    private func setupUI() {
        title = "Начать игру"
        view.backgroundColor = .white
    }

    private func presentMatch() {

    }
    
}
