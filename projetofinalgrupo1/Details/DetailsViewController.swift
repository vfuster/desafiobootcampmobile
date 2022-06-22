//
//  DetailsViewController.swift
//  projetofinalgrupo1
//
//  Created by Máira Talma on 15/06/22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var specieLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    private let animalModel: Animal
    
    init(animalModel: Animal) {
        self.animalModel = animalModel
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Detalhes"
        setupData()
        imageView.layer.cornerRadius = 8
        imageView.contentMode = .scaleAspectFill
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.tintColor = .systemBlue
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.systemBlue
        ]
    }
    
    private func setupData(){
        loading.startAnimating()
        setupImage(imageUrl: animalModel.image)
        nameLabel.text = animalModel.name
        specieLabel.text = animalModel.species
        descriptionLabel.text = animalModel.description
    }
    
    private func setupImage(imageUrl: String){
        
        guard let url = URL(string: imageUrl) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, responseError) in
            
            if let imageData = data {
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: imageData)
                    self.loading.stopAnimating()
                    self.loading.isHidden = true
                }
            }
        }
        task.resume()
    }
}
