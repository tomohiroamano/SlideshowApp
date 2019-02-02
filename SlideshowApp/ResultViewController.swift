//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 天野智広 on 2019/02/01.
//  Copyright © 2019 天野智広. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var imageView2: UIImageView!
    var image : UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageView2.image = image
        
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
