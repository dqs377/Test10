//
//  ViewController.swift
//  Test10
//
//  Created by fpm0259 on 2018/12/17.
//  Copyright © 2018年 fpm0259. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let animationView:UIView = UIView.init();
    let view1:UIView = UIView.init();
    let view2:UIView = UIView.init();
    var animator:UIDynamicAnimator?
    override func viewDidLoad() {
        super.viewDidLoad()
        
       self.animation();
       
        
        let btn:UIButton = UIButton.init(frame: CGRect.init(x: 100, y: 200, width: 100, height: 100));
        btn.backgroundColor = UIColor.black;
        btn.addTarget(self, action: #selector(tap), for: .touchUpInside);
        self.view.addSubview(btn);
        self.setUpView();
    
        
        
        dynamicAnimtor();
        
        
    }
    func dynamicAnimtor() {
       
        let view5:UIView = UIView.init(frame: CGRect.init(x: 300, y: 150, width: 50, height: 50));
        view5.backgroundColor = UIColor.gray;
        self.view.addSubview(view5);
        view5.transform = CGAffineTransform.init(rotationAngle: CGFloat(Double.pi/2.0));
        
        
        let lineView:UIView = UIView.init(frame: CGRect.init(x: 100, y: self.view.frame.height - 50, width: 400, height: 50));
        lineView.backgroundColor = UIColor.gray;
        self.view.addSubview(lineView);
        
        
         animator = UIDynamicAnimator.init(referenceView: self.view);
        //自由落体
        let gravityB:UIGravityBehavior = UIGravityBehavior.init(items:[view5]);
       //碰撞
         let collision:UICollisionBehavior = UICollisionBehavior.init(items:[view5,lineView]);
        collision.setTranslatesReferenceBoundsIntoBoundary(with: UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0));
        
        
        
        
        animator?.addBehavior(gravityB);
        animator?.addBehavior(collision);
        
        
        
        
    }
    //(1)    基于UIView.transition实现如下动画效果：

    @objc func tap() {
       doTransitionWithType(.transitionCurlUp);
        transitionAnimation();
    }
    func setUpView(){
        view1.frame = self.view.frame;
        view1.backgroundColor = UIColor.red;
        
        view2.frame =  self.view.frame;
        view2.backgroundColor = UIColor.orange;
        
        self.view.addSubview(view1);
        self.view.sendSubviewToBack(view1);
        
        self.view.addSubview(view2);
        self.view.sendSubviewToBack(view2);
        
        
    }
    func transitionAnimation() {
      
        UIView.transition(with: self.view1, duration: 3, options: .allowUserInteraction, animations: {
            self.view1.backgroundColor = UIColor.green;
        }, completion: nil)
        
    }
    
    //切换两个子视图，
    func doTransitionWithType(_ animationTransitionType:UIView.AnimationOptions) {
      
            UIView.transition(from: view1, to: view2, duration: 3, options: animationTransitionType) { (finished) in
               
                self.view.sendSubviewToBack(self.view2);
            }
        
        
       
        
        
        
        
    }
    //Mark:基于UIView.animation实现如下动画效果
    func animation()  {
        //
        animationView.frame = CGRect.init(x: 100, y: 100, width: 100, height: 100);
        animationView.backgroundColor = UIColor.green;
        self.view.addSubview(animationView);
        
        //动起来
        UIView.animate(withDuration: 3) {
            self.animationView.frame = CGRect.init(x: 150, y: 150, width: 50, height: 50);
            self.animationView.transform = CGAffineTransform.init(rotationAngle: CGFloat(Double.pi));
        };
    }

}

