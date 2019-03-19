package com.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import com.models.Sommet;
import com.repository.SommetRepository;

@Service
@Transactional
public class SommetServicesImpl implements SommetServices {

	@Autowired
	SommetRepository repository;

	@Override
	public List<Sommet> findAll() {
		// TODO Auto-generated method stub
		return repository.findAll();
	}

	@Override
	public Sommet findById(Long id) {
		// TODO Auto-generated method stub
		return repository.findById(id);
	}

	@Override
	public boolean insert(Sommet sommet) {
		// TODO Auto-generated method stub

		return repository.insert(sommet);
	}

	@Override
	@Transactional
	@Rollback(false)
	public boolean delete(Long id) {
		// TODO Auto-generated method stub
		return repository.delete(id);
	}

	@Override
	public Sommet update(Sommet sommet) {
		// TODO Auto-generated method stub
		return repository.update(sommet);
	}

}
