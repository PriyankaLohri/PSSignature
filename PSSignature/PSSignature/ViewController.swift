//
//  ViewController.swift
//  PSSignature
//
//  Created by e-Zest Admin on 19/06/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signatureView: PSDrawSignatureView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        signatureView.delegate = self

        let strSignaturePlaceholder = "Your Signature"
        signatureView.addPlaceHolder(placeHolderString:strSignaturePlaceholder,frame: CGRect(x:0,y:0,width:signatureView.frame.size.width,height:signatureView.frame.size.height))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changeStrokeColor(_ sender: Any) {
        signatureView.clear()

        let btn = sender as! UIButton
        let color = btn.backgroundColor
        signatureView.changeColor(textColor: color!)

    }
    
    @IBAction func deleteAction(_ sender: Any) {
        signatureView.clear()

    }
    
    @IBAction func captureAction(_ sender: Any) {
        
        
        let image = signatureView.getSignature() as! UIImage
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "PSFinalViewController_ID") as! PSFinalViewController
        self.present(newViewController, animated: true, completion: nil)
        
        newViewController.setSignatureImage(image: image)
        
       // self.signatureImageData = signatureData

    }
}

extension ViewController:YPSignatureDelegate{
    
    func didStart() {
        print("Started Drawing")
       // delegate?.handleTableViewOnSignature(allowScrolling: false)
    }
    
    // didFinish() is called rigth after the last touch of a gesture is registered in the view.
    // Can be used to enabe scrolling in a scroll view if it has previous been disabled.
    func didFinish() {
        print("Finished Drawing")
       // delegate?.handleTableViewOnSignature(allowScrolling: true)
        
        
    }
}
