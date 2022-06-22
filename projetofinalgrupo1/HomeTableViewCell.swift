import UIKit

class HomeTableViewCell: UITableViewCell {
 
    // MARK: - Properties
    private let petImageView = UIImageView()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let starButton = UIButton(type: .system)
    private let filledStarImage = UIImage(named: "fav_star_filled")?
        .withRenderingMode(.alwaysTemplate)
    private let emptyStarImage = UIImage(named: "fav_star_empty")?
        .withRenderingMode(.alwaysTemplate)
    private let filledStarColor = UIColor(red: 1.00, green: 0.67, blue: 0.29, alpha: 1.00)
    private let emptyStarColor = UIColor(red: 0.40, green: 0.40, blue: 0.40, alpha: 1.00)
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupImage()
        setupTitle()
        setupSubtitle()
        setupFavoriteButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    func setupCell(imageUrl: String, title: String, subtitle: String, isFavorite: Bool) {
        titleLabel.text = title
        subtitleLabel.text = subtitle
        if isFavorite {
            setFavoriteImage()
        } else {
            setUnfavoriteImage()
        }
        
        guard let url = URL(string: imageUrl) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, responseError) in
            
            if let imageData = data {
                DispatchQueue.main.async {
                    self.petImageView.image = UIImage(data: imageData)
                }
            }
        }
        task.resume()
    }
    
    private func setupImage() {
        addSubview(petImageView)
        petImageView.translatesAutoresizingMaskIntoConstraints = false
        petImageView.backgroundColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.00)
        petImageView.layer.cornerRadius = 8
        petImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        petImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        petImageView.widthAnchor.constraint(equalToConstant: 65).isActive = true
        petImageView.heightAnchor.constraint(equalToConstant: 65).isActive = true
    }
    
    private func setupTitle() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = UIColor(red: 0.08, green: 0.55, blue: 0.75, alpha: 1.00)
        titleLabel.leadingAnchor.constraint(equalTo: petImageView.trailingAnchor, constant: 12).isActive = true
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 17).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 226).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 27).isActive = true
    }
    
    private func setupSubtitle() {
        addSubview(subtitleLabel)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.textColor = UIColor(red: 0.40, green: 0.40, blue: 0.40, alpha: 1.00)
        subtitleLabel.leadingAnchor.constraint(equalTo: petImageView.trailingAnchor, constant: 12).isActive = true
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2).isActive = true
        subtitleLabel.widthAnchor.constraint(equalToConstant: 226).isActive = true
        subtitleLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
    }
    
    private func setupFavoriteButton() {
        accessoryView = starButton
        starButton.frame = CGRect(x: 0, y: 0, width: 22.09, height: 21.07)
      
        starButton.addTarget(
            self,
            action: #selector(didTapFavoriteButton),
            for: .touchUpInside
        )
    }
    
    private func setFavoriteImage() {
        starButton.setImage(filledStarImage, for: .normal)
        tintColor = filledStarColor
    }
    
    private func setUnfavoriteImage() {
        starButton.setImage(emptyStarImage, for: .normal)
        tintColor = emptyStarColor
    }
    
    @objc private func didTapFavoriteButton() {
        // preencher aqui com ação de favoritar [:
        // caso o botão seja apertado, usar setFavoriteImage() para favoritar,
        // ou, caso contrário, usar setUnfavoriteImage()
    }
}
