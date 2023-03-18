//
//  LoginViewController.swift
//  MultiplayerGame
//
//  Created by Ilya Turin on 16.03.2023.
//

import UIKit
import SnapKit
import GameSessionProvider

final class LoginViewController: UIViewController {

    let gameSession = GameSessionTask()

    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Играть", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.backgroundColor = .brown
       // button.addTarget(self, action: #selector(didTapPlayButton), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

        gameSession.startSession()fff
    }

    private func setupUI() {
        title = "Крестики нолики"
        view.backgroundColor = .white
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize(width: 100, height: 50))
        }

        
    }

}

