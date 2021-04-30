//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 阿部俊一 on 2021/04/25.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var scaleImageView: UIImageView!
    
        var soccer = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scaleImageView.image = UIImage(named: soccer)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
