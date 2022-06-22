//
//  GreenViewController.swift
//  projetofinalgrupo1
//
//  Created by Amanda Karolina Santos da Fonseca Paiva on 15/06/22.
//

import UIKit

class RegisterViewController: UIViewController {
    
    // MARK: Outlets
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
            showAlert(message: "Informe um nome válido")
            return
        }
        
        guard let linkImage = animalImageLink.text, isValidUrl(urlString: linkImage) else {
            showAlert(message: "Informe um link válido")
            return
        }
        
        guard let description = animalDescription.text, isValidString(string: description) else {
            showAlert(message: "Informe uma descrição válida")
            return
        }
        
        guard let species = animalSpecies.text, isValidString(string: species) else {
            showAlert(message: "Informe uma espécie válida")
            return
        }
        
        guard let age = animalAge.text, isValidString(string: age), let ageAsInt = Int(age) else {
            showAlert(message: "Informe uma idade válida")
            return
        }
        
        request(name: name, description: description, age: ageAsInt, species: species, image: linkImage)
    }
    
    private func request(name: String, description: String, age: Int, species: String, image: String) {
        
        guard let url = URL(string: "https://bootcamp-ios-api.herokuapp.com/api/v1/animals") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let animal = Animal(name: name, description: description, age: age, species: species, image: image)
        
        let jsonData = try? JSONEncoder().encode(animal)
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                print(error)
                
                DispatchQueue.main.async {
                    self.showAlert(message: "Ocorreu um erro ao cadastrar, tente novamente!")
                }
                return
            } else {
                DispatchQueue.main.async {
                    self.animalName.text = ""
                    self.animalAge.text = ""
                    self.animalSpecies.text = ""
                    self.animalImageLink.text = ""
                    self.animalDescription.text = ""
                    
                    self.showAlert(message: "Animal cadastrado com sucesso!")
                }
            }
        }
        task.resume()
    }
    
    // MARK: Validations
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
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Atenção", message: message, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(ok)
        
        self.present(alert, animated: true, completion: nil)
    }
}
