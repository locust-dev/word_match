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

    let clientID = UUID().uuidString

    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("  Играть  ", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.backgroundColor = .brown
        button.addTarget(self, action: #selector(play), for: .touchUpInside)
        return button
    }()

    private lazy var closeConnectionButton: UIButton = {
        let button = UIButton()
        button.setTitle("  флоу игры  ", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.backgroundColor = .brown
        button.addTarget(self, action: #selector(didTapCloseConnectionButton), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
//        gameSession.startSession()
    }

    private func setupUI() {
        title = "Крестики нолики"
        view.backgroundColor = .white
        let stack = UIStackView(arrangedSubviews: [
            button,
            closeConnectionButton
        ])
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.spacing = 15
        view.addSubview(stack)
        stack.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        button.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
    }

    @objc private func didTapCloseConnectionButton() {
        navigationController?.pushViewController(MainScreenConfigurator.configure().view, animated: true)
    }

    @objc private func play() {
        let alert = UIAlertController(title: "Введите номер комнаты", message: "", preferredStyle: .alert)
        alert.addTextField {
            $0.delegate = self
        }

        let ok = UIAlertAction(title: "Ok", style: .default) { _ in
            self.view.endEditing(true)
            self.navigationController?.pushViewController(
                GameViewController(roomId: self.roomId ?? 999, clientID: self.clientID),
                animated: true
            )
        }
        alert.addAction(ok)

        present(alert, animated: true)



    }


    var roomId: Int?

}

extension LoginViewController: UITextFieldDelegate {

    func textFieldDidEndEditing(_ textField: UITextField) {
        roomId = Int(textField.text ?? "")
    }
}
