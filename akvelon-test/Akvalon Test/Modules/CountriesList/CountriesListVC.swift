//
//  CountriesListVC.swift
//  Akvalon Test
//
//  Created by Volodymyr on 17.04.2025.
//

import UIKit

class CountriesListVC: UIViewController {
    let vm: CountiresListVMProtocol
    
    private let table = UITableView()
    
    //MARK: - Lifecycle
    
    init(viewModel: CountiresListVMProtocol) {
        self.vm = viewModel
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK: - Private
    
    private func setupUI() {
        table.dataSource = self
        table.delegate = self
    }
    
    private func setupLayouts() {
        view.addSubview(table)
        NSLayoutConstraint.activate([
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            table.topAnchor.constraint(equalTo: view.topAnchor),
            table.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}


//MARK: - UITableDataSource & Delegate

extension CountriesListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let item = vm.dataSource[safe: indexPath.row] else { return UITableViewCell() }
        switch item {
        case .country(let vm):
            let cell = tableView.dequeueCell(CountryListItemTableCell.self)
            cell.configure(vm: vm)
            return cell
        }
    }
}

extension CountriesListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}


//MARK: - CountriesListVMDelegate

extension CountriesListVC: CountriesListVMDelegate {
    func dataLoaded() {
        table.reloadData()
    }
    
    func dataLoadedError(title: String, description: String, repeat: EmptyClosure?) {
        
    }
}
