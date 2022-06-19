import UIKit

class HomeViewController: UIViewController {
    
    
    // MARK: - Properties
    private let tableView = UITableView()
    
    // MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()  
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
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "identifier")
        tableView.rowHeight = 81
        
        
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10 
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "identifier", for: indexPath) as? HomeTableViewCell else { return UITableViewCell() }
        return cell
    }
}
