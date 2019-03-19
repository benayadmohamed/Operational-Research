package com.controllers;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestParam;

import com.models.Arret;
import com.models.Edge;
import com.models.Graphe;
import com.models.Node;
import com.models.Sommet;

public interface Controller {
	Node addNode(String nom, String image, Long idG);

	Node updateNode(Node node);

	boolean deleteNode(Long id);

	Edge addEdge(Edge edge);

	Edge updateEdge(Edge edge);

	boolean deleteEdge(Long id);

	Sommet NodeToSommet(Node node);

	Node SommetToNode(Sommet sommet);

	Arret EdgeToArret(Edge edge);

	Edge ArretToEdge(Arret arret);

	List<Sommet> CalculePcc(Long idG, Long idS);

	List<Sommet> CalculePccBelmman(Long idG, Long idS);

	List<Sommet> CalculePlcBelmman(Long idG, Long idS);

	String getListSommetJson(Long idG);

	String getListArretJson(Long idG);

	String toListGraphe(ModelMap model);

	String toSetGraphe(ModelMap model, Long idG);

	Graphe addGraphe(String nom);
}
