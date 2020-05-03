//
//  ViewController.swift
//  CafeProject
//
//  Created by Appendix on 29.04.2020.
//  Copyright © 2020 Appendix. All rights reserved.
//

import UIKit

class CafeController: UIViewController {
    
    //MARK: Outlets
    
    @IBOutlet weak var cafeList: UICollectionView!
    
    //MARK: Properties
    
    var cafeListArray = [Cafe]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "CafeListCell", bundle: nil)
        cafeList.register(nib, forCellWithReuseIdentifier: "CafeListCell")

        prepareBar()
        createCafeList()
    }
    
    func prepareBar() {
        let image = UIImage(named: "back_button")
        navigationController?.navigationBar.backIndicatorImage = image
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = image
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
    }

    func createCafeList() {
        let rawsters = Cafe(cafeLogo: "rawstersLogo", cafeName: "Rawsters", cafeLocation: "Rawsters / Nisantasi / Istanbul", cafeAddress: "Gayrettepe, Hoşsohbet Sokaği Selenium Residence D:Mağaza 1, 34349 Beşiktaş/İstanbul", cafePage: "www.rawsters.com", cafeWorkingHours: "Acilis: 09:00 Kapanis: 16:00", cafeDetail: "rawstersDetail")
        cafeListArray.append(rawsters)
        let moc = Cafe(cafeLogo: "mocLogo", cafeName: "MOC", cafeLocation: "MOC / Nisantasi / Istanbul", cafeAddress: "Gayrettepe, Hoşsohbet Sokaği Selenium Residence D:Mağaza 1, 34349 Beşiktaş/İstanbul", cafePage: "www.moc.com", cafeWorkingHours: "Acilis: 09:00 Kapanis: 16:00", cafeDetail: "mocDetail")
        cafeListArray.append(moc)
        let kronotrop = Cafe(cafeLogo: "kronotropLogo", cafeName: "Kronotrop", cafeLocation: "Kronotrop / Nisantasi / Istanbul", cafeAddress: "Gayrettepe, Hoşsohbet Sokaği Selenium Residence D:Mağaza 1, 34349 Beşiktaş/İstanbul", cafePage: "www.kronotrop.com", cafeWorkingHours: "Acilis: 09:00 Kapanis: 16:00", cafeDetail: "kronotropDetail")
        cafeListArray.append(kronotrop)
        let gron = Cafe(cafeLogo: "gronLogo", cafeName: "GRON", cafeLocation: "GRON / Nisantasi / Istanbul", cafeAddress: "Gayrettepe, Hoşsohbet Sokaği Selenium Residence D:Mağaza 1, 34349 Beşiktaş/İstanbul", cafePage: "www.gron.com", cafeWorkingHours: "Acilis: 09:00 Kapanis: 16:00", cafeDetail: "gronDetail")
        cafeListArray.append(gron)
        let petra = Cafe(cafeLogo: "petraLogo", cafeName: "Petra", cafeLocation: "Petra / Nisantasi / Istanbul", cafeAddress: "Gayrettepe, Hoşsohbet Sokaği Selenium Residence D:Mağaza 1, 34349 Beşiktaş/İstanbul", cafePage: "www.petra.com", cafeWorkingHours: "Acilis: 09:00 Kapanis: 16:00", cafeDetail: "petraDetail")
        cafeListArray.append(petra)
        let montag = Cafe(cafeLogo: "montagLogo", cafeName: "Montag", cafeLocation: "Montag / Nisantasi / Istanbul", cafeAddress: "Gayrettepe, Hoşsohbet Sokaği Selenium Residence D:Mağaza 1, 34349 Beşiktaş/İstanbul", cafePage: "www.montag.com", cafeWorkingHours: "Acilis: 09:00 Kapanis: 16:00", cafeDetail: "montagDetail")
        cafeListArray.append(montag)
        
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
        return cafeListArray.count
    }
    
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        insetForSectionAt section: Int) -> UIEdgeInsets {
//        let inset = 40
//        return UIEdgeInsets(top: CGFloat(inset), left: CGFloat(inset), bottom: CGFloat(inset), right: CGFloat(inset))
//    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: (self.cafeList.frame.width / 2) - 16 , height: (self.cafeList.frame.width / 2) + 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let layout = cafeList.collectionViewLayout as? UICollectionViewFlowLayout
        collectionView.collectionViewLayout = layout!
        let cell = cafeList.dequeueReusableCell(withReuseIdentifier: "CafeListCell", for: indexPath) as! CafeListCell
        let cafe = cafeListArray[indexPath.row]
        cell.prepareCell(cafe: cafe)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCafe = cafeListArray[indexPath.row]
        performSegue(withIdentifier: "toDetails", sender: selectedCafe)
    }
}
