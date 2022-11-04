//
//  UICollectionView+.swift
//  EFFoundation
//
//  Created by EyreFree on 2022/11/4.
//

#if os(iOS) || os(tvOS) || os(macOS)
import Foundation
#if canImport(UIKit)
import UIKit

public extension UICollectionView {
    
    func registerCellNib(nibName: String, reuseIdentifier: String) {
        self.register(UINib(nibName: nibName, bundle: Bundle.main), forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    func reloadDataWithoutAnimation() {
        UIView.performWithoutAnimation { [weak self] in
            guard let self = self else { return }
            self.reloadData()
        }
    }
    
    func performBatchUpdatesWithoutAnimation(_ updates: (() -> Void)?, completion: ((Bool) -> Void)? = nil) {
        UIView.performWithoutAnimation { [weak self] in
            guard let self = self else { return }
            self.performBatchUpdates(updates, completion: completion)
        }
    }
    
    func insertSectionsWithoutAnimation(_ sections: IndexSet) {
        UIView.performWithoutAnimation { [weak self] in
            guard let self = self else { return }
            self.insertSections(sections)
        }
    }
    
    func deleteSectionsWithoutAnimation(_ sections: IndexSet) {
        UIView.performWithoutAnimation { [weak self] in
            guard let self = self else { return }
            self.deleteSections(sections)
        }
    }
    
    func reloadSectionsWithoutAnimation(_ sections: IndexSet) {
        UIView.performWithoutAnimation { [weak self] in
            guard let self = self else { return }
            self.reloadSections(sections)
        }
    }
    
    func moveSectionWithoutAnimation(_ section: Int, toSection newSection: Int) {
        UIView.performWithoutAnimation { [weak self] in
            guard let self = self else { return }
            self.moveSection(section, toSection: newSection)
        }
    }
    
    func insertItemsWithoutAnimation(at indexPaths: [IndexPath]) {
        UIView.performWithoutAnimation { [weak self] in
            guard let self = self else { return }
            self.insertItems(at: indexPaths)
        }
    }
    
    func deleteItemsWithoutAnimation(at indexPaths: [IndexPath]) {
        UIView.performWithoutAnimation { [weak self] in
            guard let self = self else { return }
            self.deleteItems(at: indexPaths)
        }
    }
    
    func reloadItemsWithoutAnimation(at indexPaths: [IndexPath]) {
        UIView.performWithoutAnimation { [weak self] in
            guard let self = self else { return }
            self.reloadItems(at: indexPaths)
        }
    }
    
    func moveItemWithoutAnimation(at indexPath: IndexPath, to newIndexPath: IndexPath) {
        UIView.performWithoutAnimation { [weak self] in
            guard let self = self else { return }
            self.moveItemWithoutAnimation(at: indexPath, to: newIndexPath)
        }
    }
}
#endif
#endif
