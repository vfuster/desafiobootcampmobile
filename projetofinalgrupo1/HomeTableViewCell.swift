import UIKit

class HomeTableViewCell: UITableViewCell {
 
    // MARK: - Properties
    let image = UIImageView()
    let title = UILabel()
    let subtitle = UILabel()
    let starButtom = UIButton(type: .system)

    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupImage()
        setupTitle()
        setupSubtitle()
        setupFavoriteButtom()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    func setupImage() {
        addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.00)
        image.layer.cornerRadius = 8
        image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        image.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        image.widthAnchor.constraint(equalToConstant: 65).isActive = true
        image.heightAnchor.constraint(equalToConstant: 65).isActive = true
        
    }
    
    func setupTitle() {
        addSubview(title)
        title.text = "Bichinho"
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = UIColor(red: 0.08, green: 0.55, blue: 0.75, alpha: 1.00)
        title.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 12).isActive = true
        title.topAnchor.constraint(equalTo: topAnchor, constant: 17).isActive = true
        title.widthAnchor.constraint(equalToConstant: 226).isActive = true
        title.heightAnchor.constraint(equalToConstant: 27).isActive = true
    }
    
    func setupSubtitle() {
        addSubview(subtitle)
        subtitle.text = "Descrição do bichinho"
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        subtitle.textColor = UIColor(red: 0.40, green: 0.40, blue: 0.40, alpha: 1.00)
        subtitle.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 12).isActive = true
        subtitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 2).isActive = true
        subtitle.widthAnchor.constraint(equalToConstant: 226).isActive = true
        subtitle.heightAnchor.constraint(equalToConstant: 18).isActive = true
    }
    
    func setupFavoriteButtom() {
        addSubview(starButtom)
        accessoryView = starButtom
        starButtom.frame = CGRect(x: 0, y: 0, width: 22.09, height: 21.07)
        starButtom.setImage(
            UIImage(named: "fav_star_empty")?
                .withRenderingMode(.alwaysTemplate),
            for: .normal)
        tintColor = UIColor(red: 0.40, green: 0.40, blue: 0.40, alpha: 1.00)
        
        starButtom.translatesAutoresizingMaskIntoConstraints = false
        starButtom.topAnchor.constraint(equalTo: topAnchor, constant: 31).isActive = true
        starButtom.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 17).isActive = true
        
      //  starButtom.addTarget(self, action: #selector(handleMarkAsFavorite), for: .touchUpInside)
        
    }
}
