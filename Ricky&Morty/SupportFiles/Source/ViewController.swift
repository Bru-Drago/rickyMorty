//
//  ViewController.swift
//  Ricky&Morty
//
//  Created by Bruna Drago on 26/01/21.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let request =  AF.request("https://rickandmortyapi.com/api/character", method: .get)
        request.responseJSON { response in
            switch response.result {
            case .success(_):
                print(response)
            case .failure:
                print(response.error)
            }
        }
        
    }
    
    
}

