//
//  ViewController.swift
//  Task 4
//
//  Created by Narek Danielyan on 10.03.2023.
//

import UIKit

struct Line: Hashable {
    var title: String
    var checked: Bool = false
}

class ViewController: UIViewController {
    
    var data = [Line]()
    
    var dataSource: UITableViewDiffableDataSource<Int,Line>!
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .insetGrouped)
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Task 4"
        
        for i in 1...30 {
            data.append(Line(title: String(i)))
        }
        
        setup()
        layout()
        
        configureDataSource()
        updateDataSource()
    }

    
    private func setup() {
        tableView.delegate = self

        navigationItem.rightBarButtonItem =  UIBarButtonItem(
            title: "Shuffle",
            style: .plain,
            target: self,
            action: #selector(shuffle)
        )
    }
    
    
    private func layout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
    @objc func shuffle() {
        data.shuffle()
        updateDataSource()
    }
}


extension ViewController: UITableViewDelegate {
    
    func configureDataSource() {
        dataSource = UITableViewDiffableDataSource(tableView: tableView)
        { tableView, indexPath, line -> UITableViewCell in
            let cell = tableView.dequeueReusableCell(withIdentifier: "System Cell") ?? UITableViewCell()
            cell.textLabel?.text = line.title
            cell.accessoryType = line.checked ? .checkmark : .none
            return cell
        }
    }
    
    
    func updateDataSource(animate: Bool = true) {
        var newSnapshot = NSDiffableDataSourceSnapshot<Int, Line>()
        newSnapshot.appendSections([0])
        newSnapshot.appendItems(data)
        dataSource.apply(newSnapshot, animatingDifferences: animate)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        data[indexPath.row].checked.toggle()
        updateDataSource(animate: false)

        if data[indexPath.row].checked {
            let element = data.remove(at: indexPath.row)
            data.insert(element, at: 0)
            updateDataSource(animate: true)
        }
    }
}
