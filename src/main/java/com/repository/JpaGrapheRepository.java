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
import com.models.Graphe;

@Repository
class JpaGrapheRepository extends AbstractDao<Graphe> implements GrapheRepository {

	public JpaGrapheRepository() {
		// TODO Auto-generated constructor stub
		super.setObject(Graphe.class);
	}

	@Override
	public List<Graphe> findAll() {
		return manager.createQuery("SELECT n FROM Graphe n", Graphe.class).getResultList();
	}

	@Override
	public Graphe findById(Long id) {
		// TODO Auto-generated method stub
		return super.findById(id);
	}

	@Override
	public boolean insert(Graphe entity) {
		// TODO Auto-generated method stub
		return super.insert(entity);
	}

	@Override
	public boolean delete(Long id) {
		// TODO Auto-generated method stub
		return super.delete(id);
	}

	@Override
	public Graphe update(Graphe entity) {
		// TODO Auto-generated method stub
		return super.update(entity);
	}

}
