//
//  CharacterCell.swift
//  Ricky&Morty
//
//  Created by Bruna Drago on 13/05/21.
//

import UIKit
import Kingfisher

class CharacterCell: UICollectionViewCell {
    
    // MARK: - User Interface Components
    
    private lazy var characterImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var characterName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .white
        label.textAlignment = .center
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    // MARK: - Public Properties
    
    static let identifier = String(describing: CharacterCell.self)
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    // MARK: - Public Funtions
    
    func setup(_ character: Character){
        characterName.text = character.name
        characterImage.kf.setImage(with: URL(string: character.image))
    }
}

// MARK: - ViewCodeProtocol Extension

extension CharacterCell: ViewCodeProtocol {
    func setupSubviews() {
        addSubview(characterImage)
        addSubview(characterName)
    }
    
    func setupConstraints() {
        characterImage.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().inset(10)
            make.height.equalTo(240)
        }
        
        characterName.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().inset(8)
            make.bottom.equalToSuperview().inset(8)
        }
    }
    
    func setupComponents() {
        backgroundColor = .black
    }
}
    
