//
//  GameCell.swift
//  MultiplayerGame
//
//  Created by Ilya Turin on 18.03.2023.
//

import UIKit
import SnapKit

final class GameCell: UICollectionViewCell {

    var currentTurn: GameState.ValueType?

    private let imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        backgroundColor = .white
        contentView.backgroundColor = .white
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(8)
        }
    }

    func configure(with value: GameState.ValueType) {
        currentTurn = value
        switch value {
        case .null:
            imageView.image = nil
        case .cross:
            imageView.image = R.image.cross()
        case .zero:
            imageView.image = R.image.circle()
        }
    }
}
