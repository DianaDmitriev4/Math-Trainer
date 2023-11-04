//
//  SecondVC.swift
//  MathTrainer
//
//  Created by User on 02.11.2023.
//

import Foundation

import UIKit

final class SecondVC: UIViewController {
    //MARK: - IBOutlet
    @IBOutlet var answerButtons: [UIButton]!
    
    //MARK: - Properties
    var type: MathType = .add
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addShadow()
    }
    
    //MARK: - Methods
    private func addShadow() {
            answerButtons.forEach { button in
                button.layer.shadowColor = UIColor.darkGray.cgColor
                button.layer.shadowOffset = CGSize(width: 0, height: 2)
                button.layer.shadowOpacity = 0.4
                button.layer.shadowRadius = 3
            }
        }
}
