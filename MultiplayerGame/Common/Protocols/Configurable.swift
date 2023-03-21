//
//  Configurable.swift
//  MultiplayerGame
//
//  Created by Ilya Turin on 22.03.2023.
//

protocol Configurable {
    associatedtype Model
    func configure(with model: Model)
}
