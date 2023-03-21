//
//  MainScreenViewController.swift
//  MultiplayerGame
//
//  Created by Ilya Turin on 21.03.2023.
//

import UIKit
import SnapKit

protocol MainScreenViewInput: AnyObject {
    func update(with viewModel: MainScreenViewModel)
}

protocol MainScreenViewOutput {
    func viewIsReady()
    func didTapRulesButton()
    func didTapPlayButton()
}

final class MainScreenViewController: UIViewController {

    // MARK: - Protperties

    private let presenter: MainScreenViewOutput

    private lazy var logoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 40)
        label.numberOfLines = 0
        label.text = "It is a match!"
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()

    private lazy var languageButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 50
        button.setTitle("Язык", for: .normal)
        button.backgroundColor = .green
        return button
    }()

    private lazy var playButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 12
        button.setTitle("Играть", for: .normal)
        button.backgroundColor = .brown
        button.setTitleColor(.white, for: .normal)
        button.addAction(UIAction(handler: { [weak self] _ in
            self?.presenter.didTapPlayButton()
        }), for: .touchUpInside)
        return button
    }()

    private lazy var rulesButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 12
        button.setTitle("Правила", for: .normal)
        button.backgroundColor = .brown
        button.setTitleColor(.white, for: .normal)
        button.addAction(UIAction(handler: { [weak self] _ in
            self?.presenter.didTapRulesButton()
        }), for: .touchUpInside)
        return button
    }()



    // MARK: - Init

    init(presenter: MainScreenViewOutput) {
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
        view.backgroundColor = .blue

        let buttonStack = UIStackView(arrangedSubviews: [
            languageButton,
            playButton,
            rulesButton
        ])
        buttonStack.axis = .vertical
        buttonStack.alignment = .center
        buttonStack.spacing = 15

        view.addSubview(logoLabel)
        logoLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(50)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        view.addSubview(buttonStack)
        buttonStack.snp.makeConstraints { make in
            make.top.equalTo(logoLabel.snp.bottom).inset(20)
            make.bottom.equalToSuperview().inset(50)
            make.leading.trailing.equalToSuperview().inset(50)
        }
        languageButton.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 100, height: 100))
        }
        playButton.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        rulesButton.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
    }


}


extension MainScreenViewController: MainScreenViewInput {

    func update(with viewModel: MainScreenViewModel) {
        
    }
}
