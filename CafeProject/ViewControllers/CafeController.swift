//
//  ViewController.swift
//  CafeProject
//
//  Created by Appendix on 29.04.2020.
//  Copyright © 2020 Appendix. All rights reserved.
//

import UIKit

class CafeController: UIViewController{
    
    //MARK: Outlets
    
    @IBOutlet weak var cafeList: UICollectionView!
    
    //MARK: Properties
    
    var cafeListArray = [Cafe]()
    var searchBar = UISearchBar()
    var dataArray = [Cafe]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "CafeListCell", bundle: nil)
        cafeList.register(nib, forCellWithReuseIdentifier: "CafeListCell")

        prepareBar()
        createCafeList()
    }
    
    func prepareBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(prepareSearchbar))
        navigationItem.titleView = searchBar
        navigationItem.titleView?.isHidden = true
    }
    
    @objc func prepareSearchbar() {
        navigationItem.titleView?.isHidden = false
        searchBar.showsCancelButton = true
        searchBar.delegate = self
        searchBar.placeholder = NSLocalizedString("Search_bar", comment: "")
    }

    func createCafeList() {
        let rawsters = Cafe(cafeLogo: "rawstersLogo", cafeName: "Rawsters", cafeLocation: "Rawsters / Nisantasi / Istanbul", cafeAddress: "Gayrettepe, Hoşsohbet Sokaği Selenium Residence D:Mağaza 1, 34349 Beşiktaş/İstanbul", cafePage: "www.rawsters.com", cafeWorkingHours: NSLocalizedString("Working_hours", comment: ""), cafeDetail: "rawstersDetail")
        cafeListArray.append(rawsters)
        let moc = Cafe(cafeLogo: "mocLogo", cafeName: "MOC", cafeLocation: "MOC / Nisantasi / Istanbul", cafeAddress: "Gayrettepe, Hoşsohbet Sokaği Selenium Residence D:Mağaza 1, 34349 Beşiktaş/İstanbul", cafePage: "www.moc.com", cafeWorkingHours: NSLocalizedString("Working_hours", comment: ""), cafeDetail: "mocDetail")
        cafeListArray.append(moc)
        let kronotrop = Cafe(cafeLogo: "kronotropLogo", cafeName: "Kronotrop", cafeLocation: "Kronotrop / Nisantasi / Istanbul", cafeAddress: "Gayrettepe, Hoşsohbet Sokaği Selenium Residence D:Mağaza 1, 34349 Beşiktaş/İstanbul", cafePage: "www.kronotrop.com", cafeWorkingHours: NSLocalizedString("Working_hours", comment: ""), cafeDetail: "kronotropDetail")
        cafeListArray.append(kronotrop)
        let gron = Cafe(cafeLogo: "gronLogo", cafeName: "GRON", cafeLocation: "GRON / Nisantasi / Istanbul", cafeAddress: "Gayrettepe, Hoşsohbet Sokaği Selenium Residence D:Mağaza 1, 34349 Beşiktaş/İstanbul", cafePage: "www.gron.com", cafeWorkingHours: NSLocalizedString("Working_hours", comment: ""), cafeDetail: "gronDetail")
        cafeListArray.append(gron)
        let petra = Cafe(cafeLogo: "petraLogo", cafeName: "Petra", cafeLocation: "Petra / Nisantasi / Istanbul", cafeAddress: "Gayrettepe, Hoşsohbet Sokaği Selenium Residence D:Mağaza 1, 34349 Beşiktaş/İstanbul", cafePage: "www.petra.com", cafeWorkingHours: NSLocalizedString("Working_hours", comment: ""), cafeDetail: "petraDetail")
        cafeListArray.append(petra)
        let montag = Cafe(cafeLogo: "montagLogo", cafeName: "Montag", cafeLocation: "Montag / Nisantasi / Istanbul", cafeAddress: "Gayrettepe, Hoşsohbet Sokaği Selenium Residence D:Mağaza 1, 34349 Beşiktaş/İstanbul", cafePage: "www.montag.com", cafeWorkingHours: NSLocalizedString("Working_hours", comment: ""), cafeDetail: "montagDetail")
        cafeListArray.append(montag)
        
        dataArray = cafeListArray
        
        cafeList.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetails" {
            let destinationVC = segue.destination as! CafeDetailController
            if let cafe = sender as? Cafe {
                destinationVC.cafe = cafe
            }
        }
    }

}

extension CafeController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: (self.cafeList.frame.width / 2) - 16 , height: (self.cafeList.frame.width / 2) + 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let layout = cafeList.collectionViewLayout as? UICollectionViewFlowLayout
        collectionView.collectionViewLayout = layout!
        let cell = cafeList.dequeueReusableCell(withReuseIdentifier: "CafeListCell", for: indexPath) as! CafeListCell
        let cafe = dataArray[indexPath.row]
        cell.prepareCell(cafe: cafe)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCafe = dataArray[indexPath.row]
        performSegue(withIdentifier: "toDetails", sender: selectedCafe)
    }
}

extension CafeController: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        navigationItem.titleView?.isHidden = true
        dataArray = cafeListArray
        self.cafeList.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.dataArray.removeAll(keepingCapacity: false)
        
        if searchText.isEmpty == false {
            
            dataArray = cafeListArray
            
            let filteredData = cafeListArray.filter { $0.cafeName.replacingOccurrences(of: "", with: "").lowercased().contains(searchText.replacingOccurrences(of: "", with: "").lowercased()) }
           
            dataArray = filteredData
            self.cafeList.reloadData()
        }
        
        if searchText.isEmpty == true {
            dataArray = cafeListArray
            self.cafeList.reloadData()
        }
        
    }
}
