//
//  RulesViewController.swift
//  MultiplayerGame
//
//  Created Ilya Turin on 21.03.2023.
//

import UIKit
import SnapKit

protocol RulesViewInput: AnyObject {
    func update(with viewModel: RulesViewModel)
}

protocol RulesViewOutput {
    func viewIsReady()
}

final class RulesViewController: UIViewController {

    // MARK: - Protperties

    private let presenter: RulesViewOutput


    // MARK: - Init

    init(presenter: RulesViewOutput) {
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
        title = "Правила"
        view.backgroundColor = .white
    }


}


extension RulesViewController: RulesViewInput {

    func update(with viewModel: RulesViewModel) {

    }
}
