package com.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.models.Graphe;
import com.repository.GrapheRepository;

@Service
@Transactional
public class GrapheServicesImpl implements GrapheServices {

	@Autowired
	GrapheRepository repository;

	@Override
	public List<Graphe> findAll() {
		// TODO Auto-generated method stub
		return repository.findAll();
	}

	@Override
	public Graphe findById(Long id) {
		// TODO Auto-generated method stub
		return repository.findById(id);
	}

	@Override
	public boolean insert(Graphe Graphe) {
		// TODO Auto-generated method stub
		
		return repository.insert(Graphe);
	}

	@Override
	public boolean delete(Long id) {
		// TODO Auto-generated method stub
		return repository.delete(id);
	}

	@Override
	public Graphe update(Graphe Graphe) {
		// TODO Auto-generated method stub
		return repository.update(Graphe);
	}

}
