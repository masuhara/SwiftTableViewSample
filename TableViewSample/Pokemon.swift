//
//  Pokemon.swift
//  TableViewSample
//
//  Created by Masuhara on 2019/05/31.
//  Copyright © 2019 Ylab.inc. All rights reserved.
//

import UIKit

// ポケモンオブジェクトの設計図
class Pokemon {
    
    // プロパティ
    var name: String
    var imageName: String
    var detail: String
    
    // 初期化メソッド
    init(name: String, imageName: String, detail: String) {
        self.name = name
        self.imageName = imageName
        self.detail = detail
    }
    
}
