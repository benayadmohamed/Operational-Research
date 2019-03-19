package com.repository;

import java.util.List;

public interface repository<T> {

	List<T> findAll();

	T findById(Long id);

	boolean insert(T T);

	boolean delete(Long id);

	T update(T T);
}
