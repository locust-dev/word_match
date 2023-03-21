//
//  TransitionHandlerProtocol.swift
//  MultiplayerGame
//
//  Created by Ilya Turin on 21.03.2023.
//

import UIKit

protocol TransitionHandlerProtocol: AnyObject {
    func present(_ viewController: UIViewController, animated: Bool)
    func push(_ viewController: UIViewController, animated: Bool)
    func dismiss(animated: Bool)
    func pop(animated: Bool)
}

extension TransitionHandlerProtocol where Self: UIViewController {
    func present(_ viewController: UIViewController, animated: Bool) {
        present(viewController, animated: animated)
    }

    func push(_ viewController: UIViewController, animated: Bool) {
        navigationController?.pushViewController(viewController, animated: animated)
    }

    func dismiss(animated: Bool) {
        dismiss(animated: animated)
    }

    func pop(animated: Bool) {
        navigationController?.popViewController(animated: animated)
    }
}

extension UIViewController: TransitionHandlerProtocol { }
