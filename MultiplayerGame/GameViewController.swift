//
//  GameViewController.swift
//  MultiplayerGame
//
//  Created by Ilya Turin on 17.03.2023.
//

import UIKit
import SnapKit

final class GameViewController: UIViewController {

    private let greenButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 12
        button.backgroundColor = .green
        return button
    }()

    private let redButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 12
        button.backgroundColor = .red
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        view.addSubview(greenButton)
        view.addSubview(redButton)
        greenButton.snp.makeConstraints { make in
            make.height.width.equalTo(100)
            make.center.equalToSuperview().offset(-100)
        }
        redButton.snp.makeConstraints { make in
            make.height.width.equalTo(100)
            make.center.equalToSuperview().offset(100)
        }
    }

}
