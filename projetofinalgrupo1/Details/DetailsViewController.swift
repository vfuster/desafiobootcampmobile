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
    
    private let animalModel: AnimalModel
    
    init(animalModel: AnimalModel) {
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
        imageView.image = animalModel.image
        nameLabel.text = animalModel.name
        specieLabel.text = animalModel.specie
        descriptionLabel.text = animalModel.description
    }
}
