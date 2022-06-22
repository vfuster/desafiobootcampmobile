import UIKit

class HomeViewController: UIViewController {
    
    
    // MARK: - Properties
    private let tableView = UITableView()
    
    private var animals: [Animal] = []
    
    // MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        requestAnimals()
    }
    
    private func requestAnimals() {
        
        guard let url = URL(string: "https://bootcamp-ios-api.herokuapp.com/api/v1/animals") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let animalResponse = try decoder.decode(AnimalResponse.self, from: data)
                    self.animals = animalResponse.items
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch {
                    print(error)
                }
            }
        }
        task.resume()
    }
    
    
    // MARK: - Setups
    func setupUI() {
        setupView()
        setupTableView()
    }
    
    func setupView(){
        title = "Home"
        view.backgroundColor = .white
        let textColor = [NSAttributedString.Key.foregroundColor:UIColor(red: 0.08, green: 0.55, blue: 0.75, alpha: 1.00)]
        navigationController?.navigationBar.titleTextAttributes = textColor
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "identifier")
        tableView.rowHeight = 81
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "identifier", for: indexPath) as? HomeTableViewCell else { return UITableViewCell() }
        
        let currentAnimal = animals[indexPath.row]
        cell.setupCell(
            imageUrl: currentAnimal.image,
            title: currentAnimal.name,
            subtitle: currentAnimal.description,
            isFavorite: false
        )
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentAnimal = animals[indexPath.row]
        let viewController = DetailsViewController(animalModel: currentAnimal)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
