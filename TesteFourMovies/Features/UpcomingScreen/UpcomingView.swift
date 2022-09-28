//
//  UpcomingView.swift
//  TesteFourMovies
//
//  Created by user220210 on 9/27/22.
//

import UIKit

final class UpcomingView: UIViewController {
    
    private var collectionView: UICollectionView?
    
    
    private lazy var scrollView: UIScrollView = {
       let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.delegate = self
        scroll.isScrollEnabled = true
        return scroll
    }()
    

    private let removeCenterBorder: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.isHidden = false
        return view
    }()
    
    private lazy var UpcomingButton: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Upcoming", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor(cgColor: CGColor(red: 250/255, green: 238/255, blue: 239/255, alpha: 1)).cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(actionUpComingButton), for: .touchUpInside)
       return button
    }()
    
    
    private lazy var popularButton: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Popular", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.borderColor = UIColor(cgColor: CGColor(red: 250/255, green: 238/255, blue: 239/255, alpha: 1)).cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(actionPopularButton), for: .touchUpInside)
       return button
    }()
    
    
    private lazy var upcomingMoviesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Upcoming Movies"
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 40)
        return label
    }()
    
    
    private lazy var backgroundViewCollection: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .darkGray
        return view
    }()
    
    private func moviesCollection() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 50
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: (view.frame.size.width/3)-4,
                                        height: (view.frame.size.width/2)-4)
      
         
        collectionView = UICollectionView(frame: .zero,
                                           collectionViewLayout: layout)
        
        guard let collectionView = collectionView else {
            return
            
        }
    
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.frame = view.bounds
        collectionView.backgroundColor = .black
        backgroundViewCollection.addSubview(collectionView)
    }
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.black
        
        setupView()
        setupConstrains()
        moviesCollection()
        
    }
    
    
    
    func setupView() {
        
        view.addSubview(UpcomingButton)
        view.addSubview(popularButton)
        view.addSubview(removeCenterBorder)
        view.addSubview(upcomingMoviesLabel)
        view.addSubview(backgroundViewCollection)
        
    }
    
    @objc func actionUpComingButton() {
     
        
    }
    
    @objc func actionPopularButton() {
      
        
    }
    
    

    
    
    func setupConstrains() {
        
        
        
        NSLayoutConstraint.activate([
        
            UpcomingButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            UpcomingButton.trailingAnchor.constraint(equalTo: view.centerXAnchor),
            UpcomingButton.widthAnchor.constraint(equalToConstant: 110),
                
            
            popularButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            popularButton.leadingAnchor.constraint(equalTo: UpcomingButton.trailingAnchor, constant: -10),
            popularButton.widthAnchor.constraint(equalToConstant: 110),
        
        
            removeCenterBorder.topAnchor.constraint(equalTo: popularButton.topAnchor, constant: 1),
            removeCenterBorder.bottomAnchor.constraint(equalTo: popularButton.bottomAnchor, constant: -1),
            removeCenterBorder.leadingAnchor.constraint(equalTo: popularButton.leadingAnchor),
            removeCenterBorder.widthAnchor.constraint(equalToConstant: 3),
            
            
            upcomingMoviesLabel.topAnchor.constraint(equalTo: popularButton.bottomAnchor, constant: 20),
            upcomingMoviesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            

            
            backgroundViewCollection.topAnchor.constraint(equalTo: upcomingMoviesLabel.bottomAnchor, constant: 20),
            backgroundViewCollection.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundViewCollection.widthAnchor.constraint(equalTo: view.widthAnchor),
            backgroundViewCollection.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
        
           
        ])

    }
            
    }


extension UpcomingView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        100
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        cell.contentView.backgroundColor = .lightGray
        
        return cell
    }
}


