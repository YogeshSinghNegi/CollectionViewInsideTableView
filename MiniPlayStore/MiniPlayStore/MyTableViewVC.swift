//
//  ViewController.swift
//  MiniPlayStore
//
//  Created by appinventiv on 04/09/17.
//  Copyright © 2017 yogesh singh negi. All rights reserved.
//

import UIKit

//=============================================================//
//MARK: MyTableViewVC Class
//=============================================================//

class MyTableViewVC: UIViewController {
    
//=============================================================//
//MARK: Stored Properties
//=============================================================//
    
    // Array for displaying Section Header
    let sectionArray = ["Hockey","Cricket","FootBall","TT","VolleyBall"]
    
    var imageNameArray = [String]()
    
//=============================================================//
//MARK: Defining IBOutlets
//=============================================================//

    @IBOutlet weak var myTableViewOutlet: UITableView!
    
//=============================================================//
//MARK: View Methods
//=============================================================//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myTableViewOutlet.delegate = self
        self.myTableViewOutlet.dataSource = self
    }
    
}

//=============================================================//
//MARK: CustomTableViewClassVC Class Extension
//=============================================================//

extension MyTableViewVC: UITableViewDelegate, UITableViewDataSource {
    
//=============================================================//
//MARK: Setting Number Of Sections
//=============================================================//
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sectionArray.count
    }
    
//=============================================================//
//MARK: Setting Number Of Cells
//=============================================================//
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 1
    }
    
//=============================================================//
//MARK: Setting the Cell
//=============================================================//
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellForClass_ID", for: indexPath) as? CellForClass else { fatalError("Table View Item Failed To Load") }
        // Setting the section to load the row of the collectionView
        cell.mySection = indexPath.section
        return cell
    }
    
//=============================================================//
//MARK: Setting the Cell Header
//=============================================================//
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sectionArray[section]
    }
    
//=============================================================//
//MARK: Setting the Height of the Header
//=============================================================//
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
//=============================================================//
//MARK: Setting the Height of the Rows
//=============================================================//
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}

//=============================================================//
//MARK: Cell for row Class for TableViewCell
//=============================================================//

class CellForClass: UITableViewCell {
    
//=============================================================//
//MARK: Defining Properties
//=============================================================//
    
    // For Section
    var mySection = 0
    
    // For Section Rows Array
    let cricketImages = ["c1","c2","c3","c4","c5","c6","c7","c8","c9","c10","c11","c12"]
    let ttImages = ["t1","t2","t3","t4","t5","t6","t7","t8","t9","t10","t11","c12"]
    let volleyballImages = ["v1","v2","v3","v4","v5","v6","v7","v8","v9","v10","v11","c12"]
    let footballImages = ["t1","t2","t3","t4","t5","t6","t7","t8","t9","t10","t11","c12"]
    let hockeyImages = ["v1","v2","v3","v4","v5","v6","v7","v8","v9","v10","v11","c12"]
    
//=============================================================//
//MARK: IBOutlet for CollectionView
//=============================================================//
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
//=============================================================//
//MARK: awakeFromNib() Method
//=============================================================//
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.myCollectionView.delegate = self
        self.myCollectionView.dataSource = self
    }
    
//=============================================================//
//MARK: prepareForReuse() Method
//=============================================================//
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.myCollectionView.reloadData()
    }
    
    
}

//=============================================================//
//MARK: CellForClass Class Extension for Delegate and DataSource
//=============================================================//

extension CellForClass: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
//=============================================================//
//MARK: Setting the Number of Cell
//=============================================================//
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch self.mySection {
        case 0:
            return self.cricketImages.count
        case 1:
            return self.footballImages.count
        case 2:
            return self.hockeyImages.count
        case 3:
            return self.ttImages.count
        default:
            return self.volleyballImages.count
        }
        
    }
    
//=============================================================//
//MARK: Setting the Cell View
//=============================================================//

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "classForItem_ID", for: indexPath) as? ClassForItem else { fatalError("Collection View Item Failed To Load") }
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.backgroundColor = UIColor.init(red: 0.2, green: 0.5, blue: 0.2, alpha: 1)
        switch self.mySection {
        case 0:
            cell.imageViewName.image = UIImage(named: self.cricketImages[indexPath.row])
        case 1:
            cell.imageViewName.image = UIImage(named: self.footballImages[indexPath.row])
        case 2:
            cell.imageViewName.image = UIImage(named: self.hockeyImages[indexPath.row])
        case 3:
            cell.imageViewName.image = UIImage(named: self.ttImages[indexPath.row])
        default:
            cell.imageViewName.image = UIImage(named: self.volleyballImages[indexPath.row])
        }
        
        return cell
    }
    
//=============================================================//
//MARK: Setting the Cell Size
//=============================================================//
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
}

//=============================================================//
//MARK: Class For Item of CollectionViewCell
//=============================================================//

class ClassForItem: UICollectionViewCell {
    
//=============================================================//
//MARK: IBOutlet for imageView
//=============================================================//
    
    @IBOutlet weak var imageViewName: UIImageView!
    
}

