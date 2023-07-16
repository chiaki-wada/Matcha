//
//  ViewController.swift
//  Matcha
//
//  Created by Chiaki Wada on 2023/05/21.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var jlptCollectionViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet var goidon1CollectionViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet var goidon2CollectionViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet var jlptCollectionView: UICollectionView!
    @IBOutlet var goidon1CollectionView: UICollectionView!
    @IBOutlet var goidon2CollectionView: UICollectionView!
    
    @IBOutlet var greenView: UIView!
    
    var jlptItemSize: CGSize!
    var goidon1ItemSize: CGSize!
    var goidon2ItemSize: CGSize!
    
    var logoImageView: UIImageView!
    var jlptLevelArray = ["N1","N2","N3"]
    var goidon1LessonArray = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20"]
    var goidon2LessonArray = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","★"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 下側の二つの角を角丸にする
        greenView.layer.cornerRadius = 25
        greenView.clipsToBounds = true
        greenView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        jlptCollectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        jlptCollectionView.delegate = self
        jlptCollectionView.dataSource = self
        
        goidon1CollectionView.register(UINib(nibName: "Goidon1CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Goidon1CollectionViewCell")
        goidon1CollectionView.delegate = self
        goidon1CollectionView.dataSource = self
        
        goidon2CollectionView.register(UINib(nibName: "Goidon2CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Goidon2CollectionViewCell")
        goidon2CollectionView.delegate = self
        goidon2CollectionView.dataSource = self
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        let jlptLayout = UICollectionViewFlowLayout()
        jlptLayout.scrollDirection = .horizontal
        jlptLayout.itemSize = CGSize(width: jlptCollectionView.bounds.height, height: jlptCollectionView.bounds.height)
        jlptLayout.minimumLineSpacing = 10
        jlptLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        jlptCollectionView.collectionViewLayout = jlptLayout
        
        let goidon1Layout = UICollectionViewFlowLayout()
        goidon1Layout.scrollDirection = .horizontal
        goidon1Layout.itemSize = CGSize(width: goidon1CollectionView.bounds.height, height: goidon1CollectionView.bounds.height)
        goidon1Layout.minimumLineSpacing = 10
        goidon1Layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        goidon1CollectionView.collectionViewLayout = goidon1Layout
        
        let goidon2Layout = UICollectionViewFlowLayout()
        goidon2Layout.scrollDirection = .horizontal
        goidon2Layout.itemSize = CGSize(width: goidon2CollectionView.bounds.height, height: goidon2CollectionView.bounds.height)
        goidon2Layout.minimumLineSpacing = 10
        goidon2Layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        goidon2CollectionView.collectionViewLayout = goidon2Layout
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == jlptCollectionView {
            return jlptLevelArray.count
        } else if collectionView == goidon1CollectionView {
            return goidon1LessonArray.count
        } else if collectionView == goidon2CollectionView {
            return goidon2LessonArray.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == jlptCollectionView {
            let cell: CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
            cell.levelLabel.text = jlptLevelArray[indexPath.item]
            return cell
        } else if collectionView == goidon1CollectionView {
            let cell: Goidon1CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Goidon1CollectionViewCell", for: indexPath) as! Goidon1CollectionViewCell
            cell.lessonLabel.text = goidon1LessonArray[indexPath.item]
            return cell
        } else if collectionView == goidon2CollectionView {
            let cell: Goidon2CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Goidon2CollectionViewCell", for: indexPath) as! Goidon2CollectionViewCell
            cell.lessonLabel.text = goidon2LessonArray[indexPath.item]
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == jlptCollectionView {
            let width = jlptCollectionView.bounds.width / 3
            return CGSize(width: width, height: width)
        } else if collectionView == goidon1CollectionView {
            let width = goidon1CollectionView.bounds.width / 20
            return CGSize(width: width, height: width)
        } else if collectionView == goidon2CollectionView {
            let width = goidon1CollectionView.bounds.width / 20
            return CGSize(width: width, height: width)
        }
        return CGSize.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let saveData = UserDefaults.standard

            if collectionView == jlptCollectionView {
                saveData.set(indexPath.item, forKey: "LEVEL")
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let chapterVC = storyboard.instantiateViewController(withIdentifier: "ChapterViewController") as! ChapterViewController
                navigationController?.pushViewController(chapterVC, animated: true)
            } else if collectionView == goidon1CollectionView {
                saveData.set(indexPath.item, forKey: "GOIDON1")
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let goidonLessonVC = storyboard.instantiateViewController(withIdentifier: "GoidonLessonViewController") as! GoidonLessonViewController
                navigationController?.pushViewController(goidonLessonVC, animated: true)
            } else if collectionView == goidon2CollectionView {
                saveData.set(indexPath.item, forKey: "GOIDON2")
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let goidon2LessonVC = storyboard.instantiateViewController(withIdentifier: "Goidon2LessonViewController") as! Goidon2LessonViewController
                navigationController?.pushViewController(goidon2LessonVC, animated: true)
            }
        }
}
