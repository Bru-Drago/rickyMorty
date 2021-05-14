//
//  CharacterListPresenter.swift
//  Ricky&Morty
//
//  Created by Bruna Drago on 10/05/21.
//

import Foundation

protocol CharacterListPresenterProtocol {
    func showCharacter(_ character: [Character])
}

class CharacterListPresenter: CharacterListPresenterProtocol {
 
    // MARK: - VIP Properties
    
    weak var viewController: CharactersListVCProtocol!
    
    func showCharacter(_ character: [Character]) {
        viewController.showCharacter(character)
    }
}
