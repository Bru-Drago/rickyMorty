//
//  CharacterListBuilder.swift
//  Ricky&Morty
//
//  Created by Bruna Drago on 10/05/21.
//

import UIKit

class CharacterListBuilder {
    
    // MARK: - Public Functions
    
    static func build() -> UIViewController {
        let viewController = CharactersListVC()
        let interactor = CharacterListInteractor()
        let presenter = CharacterListPresenter()
        let router = CharacterListRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        
        return viewController
    }
}
