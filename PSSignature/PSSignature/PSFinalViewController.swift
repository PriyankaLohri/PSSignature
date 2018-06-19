//
//  PSFinalPage.swift
//  PSSignature



import Foundation


import UIKit

class PSFinalViewController: UIViewController {
    @IBOutlet weak var signatureImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(true)
       
    }
    
    public func setSignatureImage(image:UIImage){
        signatureImageView.image = image
        
    }
    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
