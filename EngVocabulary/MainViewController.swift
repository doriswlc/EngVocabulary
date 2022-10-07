//
//  ViewController.swift
//  EngVocabulary
//
//  Created by doriswlc on 2022/10/6.
//

import UIKit

class MainViewController: UIViewController {
    var words = [Vocabulary]()
    @IBOutlet var alphabetButton: [UIButton]!
    @IBOutlet weak var enLabel: UILabel!
    @IBOutlet weak var enSentenseLabel: UILabel!
    @IBOutlet weak var chLabel: UILabel!
    @IBOutlet weak var chSentenseLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func alphabetButtonTap(_ sender: UIButton) {
        words = []
        let alphabet: String = (alphabetButton[alphabetButton.firstIndex(of: sender)!].titleLabel?.text)!
        if let data = NSDataAsset(name: String(describing: alphabet))?.data, let content = String(data: data, encoding: .utf16) {
            let array = content.components(separatedBy: "\n")
            for line in array {
                let elements = line.components(separatedBy: "\t")
                words.append(Vocabulary(en: elements[0], ch: elements[1], enSentence: elements[2], chSentence: elements[3]))
            }
            enLabel.text = words[0].en
            enSentenseLabel.text = words[0].enSentence
            chLabel.text = words[0].ch
            chSentenseLabel.text = words[0].chSentence
        }
    }
    
}

