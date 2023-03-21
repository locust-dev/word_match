//
//  Module.swift
//  MultiplayerGame
//
//  Created by Ilya Turin on 21.03.2023.
//

import UIKit

public final class PresentationViewModule<Module> {

    // MARK: - Public properties

    public let interface: Module
    public let view: UIViewController


    // MARK: - Init

    public init(interface: Module, view: UIViewController) {
        self.interface = interface
        self.view = view
    }

}

public final class ViewModule {

    // MARK: - Public properties

    public let view: UIViewController


    // MARK: - Init

    public init(view: UIViewController) {
        self.view = view
    }

}

public final class PresentationModule<Module> {

    // MARK: - Public properties

    public let interface: Module


    // MARK: - Init

    public init(interface: Module) {
        self.interface = interface
    }

}
