//
//  CharacterListView.swift
//  Ricky&Morty
//
//  Created by Bruna Drago on 10/05/21.
//

import UIKit
import SnapKit

class CharacterListView: UIView {
    
    // MARK: - User Interface Components
    
    private lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collection = UICollectionView(
            frame: .zero, collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = .systemBackground
        return collection
    }()
    
    private var characters: [Character] = []
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    // MARK: - Public Functions
    
    func setup(_ character: [Character]) {
        self.characters = character
        collection.reloadData()
    }
    
}

extension CharacterListView: ViewCodeProtocol {
    func setupSubviews() {
        addSubview(collection)
    }
    
    func setupConstraints() {
        collection.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
    }
    
    func setupComponents() {
        backgroundColor = .black
        CharacterCell.registerOn(collection)
    }
    
}

// MARK: - UICollectionViewDataSource Extension

extension CharacterListView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = CharacterCell.identifier
        
        guard let cell = collection.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? CharacterCell else { return UICollectionViewCell()}
        
        cell.setup(characters[indexPath.item])
        
        return cell
    }
    
    
}

extension CharacterListView: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDelegateFlowLayout Extension

extension CharacterListView: UICollectionViewDelegateFlowLayout {
    
    private var margin: CGFloat { 4.0 }
    
    private var insetForSections: UIEdgeInsets {
        UIEdgeInsets(top: margin, left:margin, bottom: margin, right: margin)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let padding = insetForSections.left + insetForSections.right + margin
        let width = (bounds.size.width - padding) / 2
        let ratio: CGFloat = 1.5
        let height = width * ratio
        
        return CGSize(width: width, height: height)
    }
}
