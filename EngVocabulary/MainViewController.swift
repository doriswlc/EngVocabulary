//
//  ViewController.swift
//  EngVocabulary
//
//  Created by doriswlc on 2022/10/6.
//

import UIKit

class MainViewController: UIViewController {
    var words = [Vocabulary]()
    var alphabet = "A"
    var index = 0
    @IBOutlet var alphabetButton: [UIButton]!
    @IBOutlet weak var enLabel: UILabel!
    @IBOutlet weak var enSentenseLabel: UILabel!
    @IBOutlet weak var chLabel: UILabel!
    @IBOutlet weak var chSentenseLabel: UILabel!
    @IBOutlet weak var remarkLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    func updateUI() {
        enLabel.text = words[index].en
        enSentenseLabel.text = words[index].enSentence
        chLabel.text = words[index].ch
        chSentenseLabel.text = words[index].chSentence
        remarkLabel.text = "字母\(alphabet)的第\(index + 1)筆資料"
    }
    
    @IBAction func alphabetButtonTap(_ sender: UIButton) {
        words = []
        alphabet = (alphabetButton[alphabetButton.firstIndex(of: sender)!].titleLabel?.text)!
        if let data = NSDataAsset(name: alphabet)?.data, let content = String(data: data, encoding: .utf16) {
            let array = content.components(separatedBy: "\n")
            for line in array {
                let elements = line.components(separatedBy: "\t")
                words.append(Vocabulary(en: elements[0], ch: elements[1], enSentence: elements[2], chSentence: elements[3]))
            }
            updateUI()
        }
    }
    
    @IBAction func Next(_ sender: UIButton) {
        index = (index + 1) % words.count
        updateUI()
    }
    @IBAction func Pre(_ sender: UIButton) {
        index -= 1
        if index < 0 {
            index = words.count - 1
        }
        updateUI()
    }
}

