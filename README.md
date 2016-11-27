### UIImageView , UIView

func flyUpAndDown(){
        self.bird.transform = self.bird.transform.rotated(by: 30*3.14/180)
        UIView.animate(withDuration: 5, animations: {
            self.bird.center  = CGPoint(x: self.view.bounds.width - 50, y : self.view.bounds.height - 50)
        }, completion: {(finished) in
            
            self.bird.transform = self.bird.transform.scaledBy(x: -1, y: 1).concatenating(self.bird.transform.rotated(by:-20*3.14/180.0))
            
            UIView.animate(withDuration: 5, animations: {
                self.bird.center = CGPoint(x: 50, y: self.view.bounds.height - 50)
                
            }, completion: { (finished) in
                self.bird.transform = self.bird.transform.scaledBy(x: 1, y: 1).concatenating(self.bird.transform.rotated(by: (45*3.14)/180))
                
                UIView.animate(withDuration: 5, animations: {
                    self.bird.center = CGPoint(x: self.view.bounds.width - 50, y: 50)
                    
                }, completion: { (finished) in
                    self.bird.transform = CGAffineTransform.identity
                    self.bird.transform = self.bird.transform.scaledBy(x: -1, y: 1).concatenating(self.bird.transform.rotated(by: 20*3.14/180.0))
                    UIView.animate(withDuration: 5, animations: {
                        self.bird.center = CGPoint(x:50, y: 50)
                        
                    }, completion: { (finished) in
                        self.bird.transform = CGAffineTransform.identity
                        self.flyUpAndDown()
                    })

                })

            })
            
        })
    }

