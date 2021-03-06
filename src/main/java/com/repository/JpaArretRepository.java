/*
 * Copyright 2012-2014 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.models.Arret;
import com.models.Sommet;

@Repository
class JpaArretRepository extends AbstractDao<Arret> implements ArretRepository {

	public JpaArretRepository() {
		// TODO Auto-generated constructor stub
		super.setObject(Arret.class);
	}

	@Override
	public List<Arret> findAll() {
		return manager.createQuery("SELECT t FROM Arret t", Arret.class).getResultList();
	}

	@Override
	public Arret findById(Long id) {
		// TODO Auto-generated method stub
		return super.findById(id);
	}

	@Override
	public boolean insert(Arret arret) {
		// TODO Auto-generated method stub

		return super.insert(arret);
	}

	@Override
	public boolean delete(Long id) {
		// TODO Auto-generated method stub
		return super.delete(id);
	}
	

	@Override
	public Arret update(Arret entity) {
		// TODO Auto-generated method stub
		return super.update(entity);
	}
}
