//
//  CharacterListInteractor.swift
//  Ricky&Morty
//
//  Created by Bruna Drago on 10/05/21.
//

import UIKit

protocol CharacterListInteractorProtocol {
    func fetchCharacter() 
}

class CharacterListInteractor: CharacterListInteractorProtocol{
    
    // MARK: - VIP Properties
    
    var presenter: CharacterListPresenterProtocol!
    
    let characterWorker: CharacterWorkerProtocol
    
    // MARK: - Inits
    
    init() {
        characterWorker = CharacterWorker()
    }
    
    init(characterWorker: CharacterWorkerProtocol) {
        self.characterWorker = characterWorker
    }
    
    func fetchCharacter() {
        characterWorker.fetchCharacter { [weak self] result in
            switch result {
            case .success(let characterResponse):
                self?.didFetchSuccess(characterResponse)
            case .failure(let error):
                self?.didFetchFailure(error)
            }
        }
    }
    
    // MARK: - Private Functions
    private func didFetchSuccess(_ response: CharacterResponse) {
        let characterList = response.results
        print(response.results)
        presenter.showCharacter(characterList)
    }
    
    private func didFetchFailure(_ error: CharacterError) {
        // Presenter show error
    }
}

