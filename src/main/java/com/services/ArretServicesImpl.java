package com.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.models.Arret;
import com.repository.ArretRepository;

@Service
@Transactional
public class ArretServicesImpl implements ArretServices {

	@Autowired
	ArretRepository repository;

	@Override
	public List<Arret> findAll() {
		// TODO Auto-generated method stub
		return repository.findAll();
	}

	@Override
	public Arret findById(Long id) {
		// TODO Auto-generated method stub
		return repository.findById(id);
	}

	@Override
	public boolean insert(Arret Arret) {
		// TODO Auto-generated method stub

		return repository.insert(Arret);
	}
	
	@Override
	public boolean delete(Long id) {
		// TODO Auto-generated method stub
		return repository.delete(id);
	}

	@Override
	public Arret update(Arret Arret) {
		// TODO Auto-generated method stub
		return repository.update(Arret);
	}

}
