//
//  ViewController.swift
//  Ricky&Morty
//
//  Created by Bruna Drago on 26/01/21.
//

import UIKit


class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemRed
        
        let url = "https://rickandmortyapi.com/api/character"
        NetworkManager.request(url: url) { characters in
            print(characters)
        }
    }
}

