package com.repository;

import java.io.Serializable;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

public abstract class AbstractDao<T extends Serializable> {

	private Class<T> object;

	@PersistenceContext
	EntityManager manager;

	public final void setObject(Class<T> object) {

		this.object = object;
	}

	public boolean insert(T entity) {
		try {

			manager.persist(entity);

			return true;
		} catch (Exception e) {
			// TODO: handle exception

			return false;
		}
	}

	public T update(T entity) {
		return manager.merge(entity);

	}

	public boolean delete(Long id) {
		T entity = findById(id);

		try {

			manager.remove(entity);
			 flushAndClear();
			return true;
		} catch (Exception e) {
			// TODO: handle exception

			return false;
		}

	}

	public T findById(Long id) {
		return manager.find(object, id);
	}
	void flushAndClear() {
	    manager.flush();
	    manager.clear();
	}
}
