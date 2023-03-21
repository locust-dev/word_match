//
//  GameViewController.swift
//  MultiplayerGame
//
//  Created by Ilya Turin on 17.03.2023.
//

import UIKit
import SnapKit
import GameSessionProvider

struct GameProvidedData: Codable {
    let values: [Int]
}

final class GameState {

    enum ValueType: Int {
        case null
        case cross
        case zero
    }

    private(set) var values: [Int] = Array(repeating: 0, count: 9)
    private(set) var turn: ValueType = .zero

    func setReceivedData(_ values: [Int]) {
        self.values = values
    }

    func set(at index: Int) {
        values[index] = turn.rawValue
    }

    func nextTurn() {
        turn = turn == .zero ? .cross : .zero
    }

    func reset() {
        values = Array(repeating: 0, count: 9)
        turn = .zero
    }
}

final class GameViewController: UIViewController {

    private var gameState = GameState()
    private let roomId: Int
    private let clientID: String

    private let gameSession = GameSessionTaskManager.shared

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let side = (UIScreen.main.bounds.width - 60) / 3
        layout.itemSize = CGSize(width: side, height: side)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .clear
        collection.isScrollEnabled = false
        collection.contentInset.left = 20
        collection.contentInset.right = 20
        collection.delegate = self
        collection.dataSource = self
        collection.register(GameCell.self, forCellWithReuseIdentifier: String(describing: GameCell.self))
        return collection
    }()

    private lazy var resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("  Сбросить  ", for: .normal)
        button.layer.cornerRadius = 12
        button.backgroundColor = .brown
        button.addTarget(self, action: #selector(reset), for: .touchUpInside)
        return button
    }()

    deinit {
        print("Выгрузился")
        gameSession.stopSession()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

        let initialData = GameProvidedData(values: gameState.values)
        let data = try! JSONEncoder().encode(initialData)

        gameSession.configure(roomID: String(roomId), initialData: data)
        gameSession.delegate = self
        gameSession.startSession()
    }

    init(roomId: Int, clientID: String) {
        self.roomId = roomId
        self.clientID = clientID
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(500)
        }
        view.addSubview(resetButton)
        resetButton.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).inset(30)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
        }
    }

    private func send() {
        let gameData = GameProvidedData(values: gameState.values)
        let data = try! JSONEncoder().encode(gameData)
        gameSession.send(data)
    }

    @objc private func reset() {
        gameState.reset()
        collectionView.reloadData()
    }

}

extension GameViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? GameCell
        else {
            return
        }
        cell.configure(with: gameState.turn)
        gameState.set(at: indexPath.item)
        gameState.nextTurn()
        send()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        gameState.values.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: GameCell.self), for: indexPath) as? GameCell
        let value = GameState.ValueType(rawValue: gameState.values[indexPath.item]) ?? .null
        cell?.configure(with: value)
        return cell ?? UICollectionViewCell()
    }
}

extension GameViewController: GameSessionTaskManagerDelegate {

    func didReceive(_ task: GameSessionTaskManager, data: Data) {
        guard let array = try? JSONDecoder().decode(GameProvidedData.self, from: data)
        else {
            return
        }
        gameState.setReceivedData(array.values)
        collectionView.reloadData()
    }

    func didOpenConnection() {

    }

    func didCloseConnection() {
        
    }

}
