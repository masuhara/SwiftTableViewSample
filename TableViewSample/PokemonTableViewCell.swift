//
//  PokemonTableViewCell.swift
//  TableViewSample
//
//  Created by Masuhara on 2019/05/31.
//  Copyright © 2019 Ylab.inc. All rights reserved.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {
    
    @IBOutlet var pokemonImageView: UIImageView!
    
    @IBOutlet var pokemonNameLabel: UILabel!
    
    @IBOutlet var pokemonDetailTextView: UITextView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        configureImageView()
        configureTextView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // 画像表示のためのImageViewの設定
    func configureImageView() {
        // 丸くする
        pokemonImageView.layer.cornerRadius = pokemonImageView.bounds.width / 2
        pokemonImageView.layer.masksToBounds = true
    }
    
    // 詳細説明のためのTextViewの設定
    func configureTextView() {
        // 内容を編集できないようにする
        pokemonDetailTextView.isEditable = false
        
        // AutoLayoutで高さが動的に変化するためにスクロールを不可にする
        pokemonDetailTextView.isScrollEnabled = false
    }
    
}
