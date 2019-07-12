//
//  RealmWrapper+ChangeData.swift
//  NewsApp
//
//  Created by Pavel Kurilov on 11/07/2019.
//  Copyright © 2019 Pavel Kurilov. All rights reserved.
//

import Foundation
import RealmSwift

extension RealmWrapper {
	
	// MARK: - save object data
	func saveObject<Type: TransientEntity>(object: Type, completion: VoidBlock? = nil)
		where Type.RealmType: Object {
			
			writeAsync(completion: completion) { realm in
				let realmEntity = Type.RealmType.from(transient: object, in: realm) as Object
				realm.add(realmEntity, update: .all)
			}
	}
	
	// MARK: - delete object data
	func deleteObject<Type: TransientEntity>(object: Type, completion: VoidBlock? = nil)
		where Type.RealmType: Object {
			
			writeAsync(completion: completion) { realm in
				let realmEntity = Type.RealmType.from(transient: object, in: realm) as Object
				if realmEntity.realm == realm {
					realm.delete(realmEntity)
				}
			}
	}
}
