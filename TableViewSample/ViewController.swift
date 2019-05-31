//
//  ViewController.swift
//  TableViewSample
//
//  Created by Masuhara on 2019/05/31.
//  Copyright © 2019 Ylab.inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var pokemonTableView: UITableView!
    
    var pokemonArray = [Pokemon]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setPokemonData()
        configureTableView()
    }
    
    func setPokemonData() {
        let pokemon1 = Pokemon(name: "ピカチュウ", imageName: "pikachu.png", detail: "たくさんの　ピカチュウを　あつめはつでんしょを　つくる　けいかくがさいきん　はっぴょう　された。　（『ポケモン サン』より")
        let pokemon2 = Pokemon(name: "ヒトカゲ", imageName: "hitokage.png", detail: "うまれたときから　しっぽに　ほのおがともっている。　ほのおが　きえたときその　いのちは　おわって　しまう。　（『ポケモン Ｙ』より）")
        let pokemon3 = Pokemon(name: "ゼニガメ", imageName: "zenigame.png", detail: "すいめんから　みずを　ふんしゃしてエサをとる。　あぶなくなると　こうらにてあしを　ひっこめて　みをまもる。　（『ポケモン Ｙ』より）")
        let pokemon4 = Pokemon(name: "フシギダネ", imageName: "fushigidane.png", detail: "うまれたときから　せなかにふしぎな　タネが　うえてあってからだと　ともに　そだつという。　（『ポケモン Ｘ』より）")
        
        pokemonArray.append(pokemon1)
        pokemonArray.append(pokemon2)
        pokemonArray.append(pokemon3)
        pokemonArray.append(pokemon4)
    }
    
    func configureTableView() {
        // DataSourceメソッドとDelegateメソッドの移譲先を指定
        pokemonTableView.dataSource = self
        pokemonTableView.delegate = self
        
        // カスタムセルをpokemonTableViewに登録
        let nib = UINib(nibName: "PokemonTableViewCell", bundle: Bundle.main)
        pokemonTableView.register(nib, forCellReuseIdentifier: "PokemonTableViewCell")
        
        // TableViewの高さを動的に変化させる
        pokemonTableView.rowHeight = UITableView.automaticDimension
        pokemonTableView.estimatedRowHeight = 44.0
        
        // 余計な横線を削除
        pokemonTableView.tableFooterView = UIView()
    }

    // 画面遷移するときに呼ばれる
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 詳細画面のオブジェクトを取得
        let detailViewController = segue.destination as! DetailViewController
        
        // 選択されたIndexPathを取得
        let selectedIndexPath = pokemonTableView.indexPathForSelectedRow!
        
        // ポケモン配列から、選択されたIndexPathに合わせてポケモンオブジェクトを取得し、詳細画面のpokemon変数に代入
        detailViewController.pokemon = pokemonArray[selectedIndexPath.row]
    }
}

// extensionでViewControllerを拡張し、TableViewのDataSourceメソッドとDelegateメソッドを追加
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    // セルの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonArray.count
    }
    
    // セルを生成
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonTableViewCell") as! PokemonTableViewCell
        let pokemon = pokemonArray[indexPath.row]
        cell.pokemonNameLabel.text = pokemon.name
        cell.pokemonImageView.image = UIImage(named: pokemon.imageName)
        cell.pokemonDetailTextView.text = pokemon.detail
        
        return cell
    }
    
    // セルをタップしたときに詳細画面に遷移
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Storyboardでひもづけた次の画面(詳細画面)に遷移(toDetailと名前のついたSegueを発動)
        self.performSegue(withIdentifier: "toDetail", sender: nil)
        
        // TableViewの選択状態の解除
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
