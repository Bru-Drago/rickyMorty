//
//  CharactersListVC.swift
//  Ricky&Morty
//
//  Created by Bruna Drago on 10/05/21.
//

import UIKit

protocol CharactersListVCProtocol: AnyObject {
    
    func showCharacter(_ character: [Character])
}

class CharactersListVC: UIViewController {
    
    // MARK: - VIP Properties
    
    var interactor: CharacterListInteractorProtocol!
    
    var router: CharacterListRouterProtocol!
    
    // MARK: - Private Properties
    
    private let characterListView = CharacterListView()
    
    // MARK: - View Lifecycle
    
    override func loadView() {
        self.view = characterListView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.fetchCharacter()
        view.backgroundColor = .black
    }
}

extension CharactersListVC: CharactersListVCProtocol{
    func showCharacter(_ character: [Character]) {
        characterListView.setup(character)
        print("characters :\(character)")
    }
}
