//
//  RGHRepositoriesViewController+CollectionViewController.swift
//  ReposGitHub
//
//  Created by luis gomez alonso on 14/12/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import UIKit

extension RGHRepositoriesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let repositories = self.totalRepos?.count() {
            return repositories
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = repositoryCollectionViewCellId
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! RGHRepositoryCollectionViewCell
        let repository: RGHRepository = ((self.totalRepos?.get(index: indexPath.row))!)
        cell.refresh(repository: repository, index: indexPath.row)
        
        return cell
    }
    
    /*func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let eventDetailViewController = EventDetailViewController()
        let event: Event = ((self.events?.get(index: indexPath.row))!)
        eventDetailViewController.event = event
        eventDetailViewController.assists = true
        
        navigationController?.pushViewController(eventDetailViewController, animated: true)
    }*/
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
            return CGSize(width: (UIScreen.main.bounds.width), height: (250 * (UIScreen.main.bounds.width)) / 384 )
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        if let totRep = self.totalRepos?.count() {
            if (indexPath.row == (totRep) - 1 ) {
                //it's last cell
                if nextPage != "" {
                    //Download repositories
                    RGHExecuteInteractorImpl().execute {
                        repositoriesDownload(nextPageParam: nextPage)
                    }
                }
            }
        }
    }
}
