//
//  DetailViewController.swift
//  TableViewSample
//
//  Created by Masuhara on 2019/05/31.
//  Copyright © 2019 Ylab.inc. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var pokemonImageView: UIImageView!
    
    @IBOutlet var pokemonNameLabel: UILabel!
    
    @IBOutlet var pokemonDetailTextView: UITextView!
    
    // 選択されたポケモンのオブジェクト
    var pokemon: Pokemon!

    override func viewDidLoad() {
        super.viewDidLoad()

        // 渡されてきたポケモンのデータを各パーツに表示
        pokemonImageView.image = UIImage(named: pokemon.imageName)
        pokemonNameLabel.text = pokemon.name
        pokemonDetailTextView.text = pokemon.detail
        
        // TextViewを編集できないようにする
        pokemonDetailTextView.isEditable = false
    }
    

}
