//
//  GreenViewController.swift
//  projetofinalgrupo1
//
//  Created by Amanda Karolina Santos da Fonseca Paiva on 15/06/22.
//

import UIKit

class RegisterViewController: UIViewController {

    //MARK: Outlets
    
    @IBOutlet private weak var animalName: UITextField!
    @IBOutlet private weak var animalImageLink: UITextField!
    @IBOutlet private weak var animalDescription: UITextField!
    @IBOutlet private weak var animalSpecies: UITextField!
    @IBOutlet private weak var animalAge: UITextField!
    @IBOutlet private weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupButton()
    }

    private func setupView() {
        title = "Cadastrar"
        view.backgroundColor = .white
    }
    
    private func setupButton() {
        registerButton.backgroundColor = UIColor().getPurple()
        registerButton.tintColor = .white
        registerButton.layer.cornerRadius = 8.0
    }
    

}
