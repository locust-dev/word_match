//
//  GameTypeViewController.swift
//  MultiplayerGame
//
//  Created Ilya Turin on 21.03.2023.
//

import UIKit
import SnapKit

protocol GameTypeViewInput: AnyObject {
    func update(with viewModel: GameTypeViewModel)
}

protocol GameTypeViewOutput {
    func viewIsReady()
    func didTapOnItem(with gameType: GameType)
}

final class GameTypeViewController: UIViewController {

    // MARK: - Protperties

    private let presenter: GameTypeViewOutput

    private var viewModel: GameTypeViewModel?

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(
            width: UIScreen.main.bounds.width - 40,
            height: UIScreen.main.bounds.height / 4 - 70
        )
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(GameTypeCell.self, forCellWithReuseIdentifier: String(describing: GameTypeCell.self))
        return collectionView
    }()


    // MARK: - Init

    init(presenter: GameTypeViewOutput) {
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
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

}


extension GameTypeViewController: GameTypeViewInput {

    func update(with viewModel: GameTypeViewModel) {
        self.viewModel = viewModel
        collectionView.reloadData()
    }
}

extension GameTypeViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.items.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = viewModel?.items[indexPath.item],
              let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: GameTypeCell.self), for: indexPath) as? GameTypeCell
        else {
            return UICollectionViewCell()
        }

        cell.configure(with: item.viewModel)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let item = viewModel?.items[indexPath.item] else {
            return
        }
        presenter.didTapOnItem(with: item.gameType)
    }
}
