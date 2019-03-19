package com.services;

import java.util.List;

public interface services<T> {

	List<T> findAll();

	T findById(Long id);

	boolean insert(T T);

	boolean delete(Long id);

	T update(T T);
}
