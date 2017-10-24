//
//  SecondViewController.swift
//  PresentationDemo
//
//  Created by echessa on 2/23/16.
//  Copyright © 2016 Career Foundry. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func actionButtonTapped(_ sender: UIBarButtonItem) {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "InformationViewController")
        viewController.modalPresentationStyle = .popover
        let popover: UIPopoverPresentationController = viewController.popoverPresentationController!
        popover.barButtonItem = sender
        popover.delegate = self
        present(viewController, animated: true, completion: nil)
        
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .fullScreen
    }
    
    func presentationController(_ controller: UIPresentationController, viewControllerForAdaptivePresentationStyle style: UIModalPresentationStyle) -> UIViewController? {
        let navigationController = UINavigationController(rootViewController: controller.presentedViewController)
        let doneButton = UIBarButtonItem(title:"Done", style: .done, target: self, action: #selector(SecondViewController.dismissViewController))
        navigationController.topViewController?.navigationItem.rightBarButtonItem = doneButton
        
        return navigationController
        
        
    }
    @objc func dismissViewController(){
        self.dismiss(animated: true, completion: nil)
    }


}

