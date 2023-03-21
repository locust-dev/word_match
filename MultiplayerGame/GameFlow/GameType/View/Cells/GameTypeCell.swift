//
//  GameTypeCell.swift
//  MultiplayerGame
//
//  Created by Ilya Turin on 22.03.2023.
//

import UIKit
import SnapKit

final class GameTypeCell: UICollectionViewCell {

    // MARK: - Properties

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()


    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    // MARK: - SetupUI

    private func setupUI() {
        backgroundColor = .clear
        contentView.backgroundColor = .brown
        contentView.layer.cornerRadius = 8
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(20)
        }
    }

}


// MARK: - Configurable
extension GameTypeCell: Configurable {

    struct Model {
        let title: String
    }

    func configure(with model: Model) {
        titleLabel.text = model.title
    }
}
