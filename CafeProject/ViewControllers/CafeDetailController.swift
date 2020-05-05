//
//  CafeDetailController.swift
//  CafeProject
//
//  Created by Appendix on 29.04.2020.
//  Copyright © 2020 Appendix. All rights reserved.
//

import UIKit

class CafeDetailController: UIViewController {

    //MARK: Outlets
    
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailCafeName: UILabel!
    @IBOutlet weak var detailCafeLocation: UILabel!
    @IBOutlet weak var detailCafeAddress: UILabel!
    @IBOutlet weak var detailCafePage: UILabel!
    @IBOutlet weak var detailWorkingHours: UILabel!
    
    //MARK: Properties
    
    var cafe = Cafe(cafeLogo: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailCafePage.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(clickToPage))
        detailCafePage.addGestureRecognizer(gestureRecognizer)
        
        prepareDetail()
    }
    @objc func clickToPage() {
        performSegue(withIdentifier: "toWebView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toWebView" {
            let destinationVC = segue.destination as! WebViewController
            destinationVC.webUrl = detailCafePage.text!
        }
    }
    
    func prepareDetail() {
        let image = UIImage(named: cafe.cafeDetail)
        detailImageView.image = image
        detailCafeName.text = cafe.cafeName
        detailCafeLocation.text = cafe.cafeLocation
        detailCafeAddress.text = cafe.cafeAddress
        detailCafePage.text = cafe.cafePage
        detailWorkingHours.text = cafe.cafeWorkingHours
    }
    
    @IBAction func callButton(_ sender: Any) {
        if let number = URL(string: "tel://05000000000") {
            UIApplication.shared.canOpenURL(number)
            UIApplication.shared.open(number, options: [:], completionHandler: nil)
        }
    }
}
