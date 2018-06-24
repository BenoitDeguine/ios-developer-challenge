//
//  ComicViewController.swift
//  StreetbeesiOSChallenge
//
//  Created by Benoit Deguine on 23/06/2018.
//  Copyright © 2018 Benoit Deguine. All rights reserved.
//

import UIKit

class ComicViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
        
    var dataManager = {
        return DataManager(baseURL: API.BaseURL)
    }()
    
    var comics:[ComicData] = [] {
        didSet {
            self.collectionView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Comics"
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.collectionView.register(UINib(nibName: "ComicCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ComicCollectionViewCell")
        
        dataManager.getComic { (response, error) in
            if let error = error {
                print(error)
            } else if let response = response {
                self.comics = response.comics
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension ComicViewController:UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.comics.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell: ComicCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ComicCollectionViewCell", for: indexPath) as? ComicCollectionViewCell
        {
            let comicDataVieModel = ComicViewViewModel(comicData: self.comics[indexPath.row])
            cell.configure(viewModel: comicDataVieModel)
            
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let numberOfColumns: CGFloat = 3
        
        let itemWidth = ((self.collectionView!.frame.width) - (numberOfColumns - 1)) / numberOfColumns
        
        return CGSize(width: itemWidth, height: itemWidth)
    }
}
