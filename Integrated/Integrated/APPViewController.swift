//
//  ViewController.swift
//  Integrated
//
//  Created by i9400506 on 2022/1/5.
//

import UIKit

class APPViewController: UIViewController {
    
    private var userDatas: [User] = [] {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }

    @IBOutlet private var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCollection()
    }
    
    private func setupCollection() {
        self.collectionView.register(.init(nibName: "\(UserCell.self)", bundle: nil), forCellWithReuseIdentifier: UserCell.identifier)
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }

    @IBAction private func capture(sender: UIButton) {
        
        var components: URLComponents = .init()
        // https://jsonplaceholder.typicode.com/users
        components.scheme = "https"
        components.host = "jsonplaceholder.typicode.com"
        components.path = "/users"
        // setup query
        //components.queryItems = [.init(name: "", value: "")]
        
        guard let url = components.url else {
            print("url is nil")
            return
        }
        let request: URLRequest = .init(url: url)
        URLSession.shared.dataTask(with: request) { [unowned self] data, resp, error in
            if let error = error {
                debugPrint(error)
                return
            }
            guard let data = data else {
                return
            }
            guard let users = try? JSONDecoder().decode([User].self, from: data) else {
                return
            }
            self.userDatas = users
        }.resume()
    }
}

extension APPViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.userDatas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserCell.identifier, for: indexPath)
        
        if let userCell = cell as? UserCell {
            userCell.nameLabel.text = userDatas[indexPath.item].name
            userCell.emailLabel.text = userDatas[indexPath.item].email
            userCell.phoneLabel.text = userDatas[indexPath.item].phone
            userCell.companyLabel.text = userDatas[indexPath.item].company.name
        }
        
        return cell
    }
}

extension APPViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width, height: 170)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let user: User = self.userDatas[indexPath.item]
        let editVC: EditViewController = .init(user: user, delegate: self)
        editVC.modalPresentationStyle = .formSheet
        self.present(editVC, animated: true)        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        2
    }
}

extension APPViewController: EditDelegate {
    func update(user: User) {
        guard let index = self.userDatas.firstIndex(where: { user.id == $0.id }) else {
            return
        }
        self.userDatas[index] = user
    }
}
