//
//  UserListViewController.swift
//  PlaylistTest
//
//  Created by Dmytro Genyk on 5/5/19.
//  Copyright © 2019 Dmytro Genyk. All rights reserved.
//

import UIKit

class UserListViewController: UITableViewController {
    @IBOutlet private weak var timeLeftLabel: UILabel!
    
    var presenter: UserListPresenterProtocol?
    private var users: [UserItem] = []
    private var updatedUsers: [UserItem] = []
    private let cellIdentifier = "UserListCellIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupRefreshControl()
        presenter?.viewDidLoad()
    }
    
    private func setupRefreshControl() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(loadUsersByPullAction), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    @objc func loadUsersByPullAction() {
        tableView.refreshControl?.beginRefreshing()
        presenter?.loadUsers()
    }
    
    private func updateTileLeftLabel(_ left: Double) {
        DispatchQueue.main.async { [weak self] in
            self?.timeLeftLabel.text = "Autorefresh after: \(Int(left))"
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? UserListTableViewCell else {
            return UITableViewCell()
        }
        cell.user = users[indexPath.row];
        return cell
    }
}

extension UserListViewController: UserListViewProtocol {
    func refreshTimerUpdated(_ left: Double) {
        updateTileLeftLabel(left)
    }
    
    func show(users: [UserItem]) {
        let oldItemsSet = Set(self.users)
        let newItemsSet = Set(users)
        let objectsToRemove = Array(oldItemsSet.subtracting(newItemsSet))
        let indexesToRemove = objectsToRemove.compactMap({ self.users.firstIndex(of: $0)}).map({ IndexPath(row: $0, section: 0) })

        let itemsCountToAdd = users.count - self.users.count + indexesToRemove.count
        let indexPathsToAdd = (0 ..< itemsCountToAdd)
            .map { IndexPath(row: $0, section: 0) }
        
        self.users = users.sorted(by: { $0.score > $1.score })
        tableView.performBatchUpdates({
            tableView.deleteRows(at: indexesToRemove, with: .left)
            tableView.insertRows(at: indexPathsToAdd, with: .right)
        }, completion: { [weak self] _ in
            self?.tableView.reloadData()
        })
        
    }
    
    func showError() {
        print("Data loading error!")
    }
    
    func showLoading() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func hideLoading() {
        tableView.refreshControl?.endRefreshing()
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
}
