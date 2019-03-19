package com.controllers;

import static org.mockito.Matchers.booleanThat;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.models.Arret;
import com.models.Edge;
import com.models.Graphe;
import com.models.Node;
import com.models.PCCBellman;
import com.models.PCCDijkstra;
import com.models.PLCBellman;
import com.models.PLCDijkstra;
import com.models.Sommet;
import com.models.arrows;
import com.services.ArretServices;
import com.services.GrapheServices;
import com.services.SommetServices;

@org.springframework.stereotype.Controller
public class IndexController implements Controller {

	@Autowired
	ArretServices serviceArret;
	@Autowired
	GrapheServices serviceGraphe;
	@Autowired
	SommetServices servicesSommet;
	private PCCDijkstra PCCDijkstra = new PCCDijkstra();
	private PLCDijkstra PLCDijkstra = new PLCDijkstra();
	private PCCBellman PCCBlellman = new PCCBellman();
	private PLCBellman PLCBellman = new PLCBellman();

	@ResponseBody
	@RequestMapping(value = "/deleteEdge", method = RequestMethod.POST)
	public boolean deleteEdge(@RequestParam("id") Long id) {
		// TODO Auto-generated method stub

		return serviceArret.delete(id);
	}

	@ResponseBody
	@RequestMapping(value = "/CalculePcc", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public List<Sommet> CalculePcc(@RequestParam("idG") Long idG, @RequestParam("idS") Long idS) {
		// TODO Auto-generated method stub
		Graphe graphe = serviceGraphe.findById(idG);
		// System.out.println(graphe);
		List<Sommet> l = new ArrayList<>(graphe.getSommets());
		Sommet sommet = servicesSommet.findById(idS);

		// System.out.println(l.get(0));
		System.out.println("liste de depart " + l);
		System.out.println("Sommet de peart" + sommet);
		PCCDijkstra.setSommetDepart(sommet);
		PCCDijkstra.setSousEnsembleSBarre(new ArrayList<>(l));
		PCCDijkstra.init();
		System.err.println("S apres init :" + PCCDijkstra.getSousEnsembleS());
		System.err.println("Sbarre apres init :" + PCCDijkstra.getSousEnsembleSBarre());

		PCCDijkstra.CalculePccNonOrienteOuOriente();
		// graphe.setSommets(PCCDijkstra.getSousEnsembleS());
		// System.out.println(graphe);
		return PCCDijkstra.getSousEnsembleS();
	}

	@ResponseBody
	@RequestMapping(value = "/CalculePccBelmman", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public List<Sommet> CalculePccBelmman(@RequestParam("idG") Long idG, @RequestParam("idS") Long idS) {
		// TODO Auto-generated method stub
		Graphe graphe = serviceGraphe.findById(idG);
		// System.out.println(graphe);
		List<Sommet> l = new ArrayList<>(graphe.getSommets());
		Sommet sommet = servicesSommet.findById(idS);

		// System.out.println(l.get(0));
		PCCBlellman.setSousEnsembleP0(l);
		PCCBlellman.setSousEnsembleP1(l);
		PCCBlellman.setSousEnsembleS(l);
		Sommet s = servicesSommet.findById(idS);

		PCCBlellman.setSommetDepart(s);

		PCCBlellman.init();
		PCCBlellman.CalculePccNonOrienteOuOriente(1);

		// System.out.println(PCCBlellman.getSousEnsembleP1());
		// graphe.setSommets(PCCBlellman.getSousEnsembleP1());
		// System.out.println(graphe);

		return PCCBlellman.getSousEnsembleP1();
	}

	@ResponseBody
	@RequestMapping(value = "/CalculePlcBelmman", method = RequestMethod.POST)
	public List<Sommet> CalculePlcBelmman(@RequestParam("idG") Long idG, @RequestParam("idS") Long idS) {
		// TODO Auto-generated method stub
		Graphe graphe = serviceGraphe.findById(idG);
		// System.out.println(graphe);
		List<Sommet> l = new ArrayList<>(graphe.getSommets());
		Sommet sommet = servicesSommet.findById(idS);

		// System.out.println(l.get(0));
		PLCBellman.setSousEnsembleP0(l);
		PLCBellman.setSousEnsembleP1(l);
		PLCBellman.setSousEnsembleS(l);
		Sommet s = servicesSommet.findById(idS);

		PLCBellman.setSommetDepart(s);

		PLCBellman.init();
		PLCBellman.CalculePlcNonOrienteOuOriente(1);

		// System.out.println(PLCBellman.getSousEnsembleP1());
		// graphe.setSommets(PLCBellman.getSousEnsembleP1());
		// System.out.println(graphe);
		return PLCBellman.getSousEnsembleP1();
	}

	@ResponseBody
	@RequestMapping(value = "/CalculePlc", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public List<Sommet> CalculePlc(@RequestParam("idG") Long idG, @RequestParam("idS") Long idS) {
		// TODO Auto-generated method stub
		Graphe graphe = serviceGraphe.findById(idG);
		// System.out.println(graphe);
		List<Sommet> l = new ArrayList<>(graphe.getSommets());
		Sommet sommet = servicesSommet.findById(idS);

		// System.out.println(l.get(0));
		System.out.println("liste de depart " + l);
		System.out.println("Sommet de peart" + sommet);
		PLCDijkstra.setSommetDepart(sommet);
		PLCDijkstra.setSousEnsembleSBarre(new ArrayList<>(l));
		PLCDijkstra.init();
		System.err.println("S apres init :" + PLCDijkstra.getSousEnsembleS());
		System.err.println("Sbarre apres init :" + PLCDijkstra.getSousEnsembleSBarre());

		PLCDijkstra.CalculePlcNonOrienteOuOriente();
		// graphe.setSommets(PLCDijkstra.getSousEnsembleS());
		// System.out.println(graphe);
		return PLCDijkstra.getSousEnsembleS();
	}

	@Override
	@ResponseBody
	@RequestMapping(value = "/getListArretJson", method = RequestMethod.POST)
	public String getListArretJson(@RequestParam("idG") Long idG) {
		// TODO Auto-generated method stub

		Graphe graphe = serviceGraphe.findById(idG);
		return graphe.getArretWithAllAttributJson();
	}

	@Override
	@ResponseBody
	@RequestMapping(value = "/getListSommetJson", method = RequestMethod.POST)
	public String getListSommetJson(@RequestParam("idG") Long idG) {
		// TODO Auto-generated method stub

		Graphe graphe = serviceGraphe.findById(idG);
		return graphe.getSommetWithAllAttributJson();
	}

	@RequestMapping("/setGraphe")
	public String toSetGraphe(ModelMap model, @RequestParam("idG") Long idG) {
		// TODO Auto-generated method stub
		Graphe graphe = serviceGraphe.findById(idG);
		model.put("sommets", graphe.getSommetJson());
		model.put("arrets", graphe.getArretJson());
		model.put("arrets2", graphe.getArretWithAllAttributJson());
		model.put("sommets2", graphe.getSommetWithAllAttributJson());
		model.put("lisetSommet", graphe.getSommets());
		model.put("idG", idG);
		return "setGraphe";
	}

	@RequestMapping("/listGraphe")
	public String toListGraphe(ModelMap model) {
		// TODO Auto-generated method stub
		List<Graphe> graphes = serviceGraphe.findAll();
		model.put("graphes", graphes);
		return "listGraphe";
	}

	@RequestMapping("/index")
	public String t1(ModelMap model, @RequestParam(defaultValue = "12") Long idG) {
		model.put("message", "HowToDoInJava Reader !!");
		System.out.println(idG);
		Graphe graphe = serviceGraphe.findById(idG);
		model.put("sommets", graphe.getSommetJson());
		model.put("arrets", graphe.getArretJson());
		model.put("arrets2", graphe.getArretWithAllAttributJson());
		model.put("sommets2", graphe.getSommetWithAllAttributJson());
		model.put("lisetSommet", graphe.getSommets());
		model.put("idG", idG);
		return "index";
	}

	@RequestMapping("/index2")
	public String index2(ModelMap model, @RequestParam(defaultValue = "18") Long idG) {
		model.put("message", "HowToDoInJava Reader !!");
		System.out.println(idG);
		Graphe graphe = serviceGraphe.findById(idG);
		model.put("sommets", graphe.getSommetJson());
		model.put("arrets", graphe.getArretJson());
		model.put("arrets2", graphe.getArretWithAllAttributJson());
		model.put("sommets2", graphe.getSommetWithAllAttributJson());
		model.put("lisetSommet", graphe.getSommets());
		model.put("idG", idG);
		return "index2";
	}

	@ResponseBody
	@RequestMapping(value = "/addGraphe", produces = MediaType.APPLICATION_JSON_VALUE)
	public Graphe addGraphe(@RequestParam("nom") String nom) {
		// TODO Auto-generated method stub
		Graphe graphe = new Graphe();
		graphe.setNom(nom);
		boolean b = serviceGraphe.insert(graphe);

		if (b) {
			List<Graphe> graphes = serviceGraphe.findAll();
			graphe = Collections.max(graphes, new Comparator<Graphe>() {

				@Override
				public int compare(Graphe o1, Graphe o2) {
					// TODO Auto-generated method stub
					return o1.getId().compareTo(o2.getId());
				}
			});
			// System.out.println(graphe);
			if (graphe != null)
				return graphe;
			else
				return null;

		}
		return null;
	}

	@RequestMapping("/t2")
	public String t2(Map<String, Object> model) {
		model.put("message", "HowToDoInJava Reader !!");

		Graphe graphe = serviceGraphe.findById(12L);
		model.put("sommets", graphe.getSommetJson());
		model.put("arrets", graphe.getArretJson());
		model.put("arrets2", graphe.getArretWithAllAttributJson());
		return "dynamicData3";
	}

	@RequestMapping("/")
	public String home(Map<String, Object> model) {
		model.put("message", "HowToDoInJava Reader !!");

		;
		List<Sommet> l = servicesSommet.findAll();

		for (Sommet sommet : l) {

			System.out.println(sommet.getNom());

			List<Arret> arrets = sommet.getSuccesseurs();

			for (Arret arret : arrets) {
				System.out.println(arret);
			}
		}

		return "index";
	}

	@RequestMapping("/pcc")
	public String homepcc(Map<String, Object> model) {
		model.put("message", "HowToDoInJava Reader !!");

		;
		List<Sommet> l = servicesSommet.findAll();

		PCCDijkstra pcc = new PCCDijkstra();

		pcc.setSommetDepart(l.get(0));
		pcc.setSousEnsembleSBarre(new ArrayList<>(l));
		pcc.init();
		pcc.CalculePcc();

		pcc.setSommetDepart(l.get(0));
		pcc.setSousEnsembleSBarre(new ArrayList<>(l));
		pcc.init();
		pcc.CalculePccNonOrienteOuOriente();

		return "index";
	}

	@RequestMapping("/pccB")
	public String homepccBel(Map<String, Object> model) {
		model.put("message", "HowToDoInJava Reader !!");

		Graphe graphe = serviceGraphe.findById(18L);
		System.out.println(graphe);
		List<Sommet> l = graphe.getSommets();

		System.out.println(l);
		PCCBellman bellman = new PCCBellman();

		bellman.setSousEnsembleP0(l);
		bellman.setSousEnsembleP1(l);
		bellman.setSousEnsembleS(l);
		Sommet s = servicesSommet.findById(19L);

		bellman.setSommetDepart(s);
		System.out.println(s);
		bellman.init();
		bellman.CalculePccNonOrienteOuOriente(1);

		// for (Sommet sommet : bellman.getSousEnsembleP0()) {
		// System.out.print(" " + sommet.getNom() + " " +
		// sommet.getLongueurPcc());
		//
		// }
		// System.out.println();
		// for (Sommet sommet : bellman.getSousEnsembleP1()) {
		// System.out.print(" " + sommet.getNom() + " " +
		// sommet.getLongueurPcc());
		//
		// }

		return "index";
	}

	@RequestMapping("/2")
	public String home2(Map<String, Object> model) {
		model.put("message", "HowToDoInJava Reader !!");

		;

		Sommet sommet = new Sommet(), sommet2 = new Sommet();
		sommet.setNom("E");
		sommet2.setNom("F");

		Sommet sommet3 = servicesSommet.findById(4L);
		// Sommet sommet3 = new Sommet();
		// sommet3.setNom("J");

		Arret arret = new Arret();
		arret.setArrive(sommet);
		arret.setDepart(sommet3);

		Arret arret2 = new Arret();
		arret2.setArrive(sommet2);
		arret2.setDepart(sommet3);

		/*
		 * sommet.setPrédécesseurs(arret); servicesSommet.insert(sommet);
		 * sommet2.setPrédécesseurs(arret2); servicesSommet.insert(sommet2);
		 */

		serviceArret.insert(arret);
		serviceArret.insert(arret2);

		return "index";

	}

	@RequestMapping("/3")
	public String home3(Map<String, Object> model) {
		model.put("message", "HowToDoInJava Reader !!");

		;

		Arret arret = serviceArret.findById(13L);
		arret.setLongueur(13D);
		serviceArret.update(arret);
		Arret arret2 = serviceArret.findById(15L);

		arret2.setLongueur(15D);

		serviceArret.update(arret2);

		return "index";

	}

	@RequestMapping("/next")
	public String next(Map<String, Object> model) {
		model.put("message", "You are in new page !!");

		List<Sommet> l = servicesSommet.findAll();

		for (Sommet sommet : l) {

			System.out.println(sommet.getNom());

			List<Arret> arrets = sommet.getPrédécesseurs();

			for (Arret arret : arrets) {
				System.out.println(arret);
			}
		}

		return "next";
	}

	public Sommet NodeToSommet(Node node) {
		Sommet sommet = servicesSommet.findById(node.getId());
		sommet.setNom(node.getLabel());
		sommet.setImage(node.getImage());
		return sommet;
	}

	public Node SommetToNode(Sommet sommet) {
		// TODO Auto-generated method stub
		Node node = new Node();
		node.setId(sommet.getId());
		node.setLabel(sommet.getNom());
		node.setImage(sommet.getImage());
		return node;
	}

	public Arret EdgeToArret(Edge edge) {
		Arret arret = new Arret();
		arret.setId(edge.getId());
		arret.setDepart(servicesSommet.findById(edge.getFrom()));
		arret.setArrive(servicesSommet.findById(edge.getTo()));
		arret.setLongueur(edge.getLabel());
		arret.setOriente(edge.getArrows().getTo());
		return arret;
	}

	public Edge ArretToEdge(Arret arret) {
		Edge edge = new Edge();
		arrows arrows = new arrows();
		edge.setId(arret.getId());
		arrows.setTo(arret.isOriente());
		edge.setArrows(arrows);
		edge.setFrom(arret.getDepart().getId());
		edge.setTo(arret.getArrive().getId());
		edge.setLabel(arret.getLongueur());
		return edge;
	}

	@ResponseBody
	@RequestMapping(value = "/addNode", method = RequestMethod.POST)
	public Node addNode(@RequestParam("nom") String nom, @RequestParam("image") String image,
			@RequestParam("idG") Long idG) {
		// TODO Auto-generated method stub
		Graphe graphe = serviceGraphe.findById(idG);
		Sommet sommet = new Sommet();
		sommet.setNom(nom);
		sommet.setGraphe(graphe);
		sommet.setImage(image);
		boolean b = servicesSommet.insert(sommet);

		if (b) {
			sommet = Collections.max(servicesSommet.findAll(), new Comparator<Sommet>() {

				@Override
				public int compare(Sommet o1, Sommet o2) {
					// TODO Auto-generated method stub
					return o1.getId().compareTo(o2.getId());
				}
			});
			return SommetToNode(sommet);
		} else
			return null;
	}

	@ResponseBody
	@RequestMapping(value = "/updateNode", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	public Node updateNode(@RequestBody Node node) {
		// TODO Auto-generated method stub
		Sommet s = NodeToSommet(node);

		return SommetToNode(servicesSommet.update(s));
	}

	@ResponseBody
	@RequestMapping(value = "/deleteNode", method = RequestMethod.POST)
	public boolean deleteNode(@RequestParam("id") Long id) {
		// TODO Auto-generated method stub
		return servicesSommet.delete(id);
	}

	@ResponseBody
	@RequestMapping(value = "/addEdge", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	public Edge addEdge(@RequestBody Edge edge) {
		// TODO Auto-generated method stub
		Arret arret = EdgeToArret(edge);
		arret  = serviceArret.update(arret);
		
		return ArretToEdge(arret);
	}

	@Override
	@ResponseBody
	@RequestMapping(value = "/updateEdge", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
	public Edge updateEdge(@RequestBody Edge edge) {
		// TODO Auto-generated method stub
		Arret arret = EdgeToArret(edge);
		;

		return ArretToEdge(serviceArret.update(arret));
	}

}
