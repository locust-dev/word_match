//
//  GameCreateViewController.swift
//  MultiplayerGame
//
//  Created Ilya Turin on 22.03.2023.
//

import UIKit
import SnapKit

protocol GameCreateViewInput: AnyObject {
    func update(with viewModel: GameCreateViewModel)
}

protocol GameCreateViewOutput {
    func viewIsReady()
    func didTapCreateRoomButton()
    func didTapJoinRoomButton(with roomNumber: String)
}

final class GameCreateViewController: UIViewController {

    // MARK: - Protperties

    private var roomNumber: String?

    private let presenter: GameCreateViewOutput

    private lazy var createRoomButton: UIButton = {
        let button = UIButton()
        button.setTitle("Создать комнату", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .brown
        button.addAction(.init(handler: { [weak self] _ in
            self?.presenter.didTapCreateRoomButton()
        }), for: .touchUpInside)
        return button
    }()

    private lazy var joinRoomButton: UIButton = {
        let button = UIButton()
        button.setTitle("Подключиться к комнате", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .brown
        button.addAction(.init(handler: { [weak self] _ in
            self?.showAlert()
        }), for: .touchUpInside)
        return button
    }()


    // MARK: - Init

    init(presenter: GameCreateViewOutput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter.viewIsReady()
    }


    // MARK: - UI

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(createRoomButton)
        createRoomButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.leading.trailing.equalToSuperview().inset(50)
            make.height.equalTo(100)
        }
        view.addSubview(joinRoomButton)
        joinRoomButton.snp.makeConstraints { make in
            make.top.equalTo(createRoomButton.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(50)
            make.height.equalTo(100)
        }
    }

    private func showAlert() {
        let alertController = UIAlertController(title: "Подключиться", message: "Введите номер комнаты", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { [weak self] _ in
            guard let roomNumber = self?.roomNumber else {
                return
            }
            self?.presenter.didTapJoinRoomButton(with: roomNumber)
        }

        alertController.addTextField { [weak self] textField in
            textField.addAction(.init(handler: { _ in
                self?.textFieldTextDidChange(sender: textField)
            }), for: .editingChanged)
        }

        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }


    // MARK: - Actions

    @objc private func textFieldTextDidChange(sender: UITextField) {
        roomNumber = sender.text
    }


}


extension GameCreateViewController: GameCreateViewInput {

    func update(with viewModel: GameCreateViewModel) {

    }
}
