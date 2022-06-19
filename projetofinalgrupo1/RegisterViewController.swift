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
    
    @IBAction func register(_ sender: Any) {
        guard let name = animalName.text, isValidString(string: name) else {
            showErrorAlert(message: "Informe um nome válido")
            return
        }
        
        guard let linkImage = animalImageLink.text, isValidUrl(urlString: linkImage) else {
            showErrorAlert(message: "Informe um link válido")
            return
        }
        
        guard let description = animalDescription.text, isValidString(string: description) else {
            showErrorAlert(message: "Informe uma descrição válida")
            return
        }
        
        guard let species = animalSpecies.text, isValidString(string: species) else {
            showErrorAlert(message: "Informe uma espécie válida")
            return
        }
        
        guard let age = animalAge.text, isValidString(string: age), let ageAsInt = Int(age) else {
            showErrorAlert(message: "Informe uma idade válida")
            return
        }
        
        print(name, linkImage, description, species, ageAsInt)
    }
    
    private func isValidUrl(urlString: String) -> Bool {
        if let url = NSURL(string: urlString) {
            return UIApplication.shared.canOpenURL(url as URL)
        } else {
            return false
        }
    }
    
    private func isValidString(string: String) -> Bool {
        return string.trimmingCharacters(in: .whitespacesAndNewlines).count > 0
    }
    
    private func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "Atenção", message: message, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(ok)
        
        self.present(alert, animated: true, completion: nil)
    }
}
