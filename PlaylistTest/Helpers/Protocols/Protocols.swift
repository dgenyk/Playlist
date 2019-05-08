//
//  Protocols.swift
//  PlaylistTest
//
//  Created by Dmytro Genyk on 5/6/19.
//  Copyright © 2019 Dmytro Genyk. All rights reserved.
//

import UIKit

protocol ViewProtocol: class {
    func showError()
    func showLoading()
    func hideLoading()
}

protocol RouterProtocol: class {
    static func createModule() -> UIViewController
}

protocol ErrorHandlerProtocol: class {
    func onError()
}
