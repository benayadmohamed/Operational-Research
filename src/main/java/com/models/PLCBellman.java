package com.models;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Vector;
import java.util.function.Predicate;

public class PLCBellman {

	List<Sommet> SousEnsembleP0;
	List<Sommet> SousEnsembleP1;
	List<Sommet> SousEnsembleS;
	private Sommet sommetPcc;
	private Sommet sommetDepart;
	Arret arret;
	Sommet x;

	public void init() {
		int i = FindSommet(SousEnsembleS, sommetDepart);
		System.out.println(SousEnsembleS);
		System.out.println(sommetDepart);

		sommetPcc = SousEnsembleS.get(i);

		SousEnsembleP0.get(i).setLongueurPcc(0D);
		SousEnsembleP1.get(i).setLongueurPcc(0D);
		SousEnsembleS.remove(i);

		for (Sommet sommet : SousEnsembleS) {
			i = FindSommet(SousEnsembleP0, sommet);
			SousEnsembleP0.get(i).setLongueurPcc(null);
			SousEnsembleP1.get(i).setLongueurPcc(null);
		}
		Arret arret;
		for (Sommet x : SousEnsembleS) {
			arret = SearchArretBySommetDepartInit(x.getPrédécesseurs());
			if (arret != null) {
				i = FindSommet(SousEnsembleP0, x);
				SousEnsembleP1.get(i).setLongueurPcc(arret.getLongueur());
				SousEnsembleP1.get(i).setPrédécesseurPcc(sommetPcc.getId());

			}
		}

	}

	public Arret SearchArretBySommetDepartInit(List<Arret> arrets) {

		for (Arret arret : arrets) {
			if (sommetPcc.getId().equals(arret.getDepart().getId()))
				return arret;
		}
		return null;
	}

	public void CalculePlcNonOrienteOuOriente(int k) {
		int i;
		for (Sommet sommet : SousEnsembleP0) {
			System.out.print(" " + sommet.getId()+ ","+sommet.getNom() + "," + sommet.getLongueurPcc() + ","+sommet.getPrédécesseurPcc());
		}
		System.out.println();

		if (k <= SousEnsembleP1.size() && compareSousEnsembleP1EtSousEnsembleP0()) {

			Copy();

			for (Sommet x : SousEnsembleS) {
				// if (x.getLongueurPcc() == null) {
				i = FindSommet(SousEnsembleP1, x);
				FindMaxSommetDansS(i);
				// }
			}

			CalculePlcNonOrienteOuOriente(k + 1);
		}

	}

	public void Copy() {
		SousEnsembleP0.clear();
		Sommet sommet, sommet2;
		for (int i = 0; i < SousEnsembleP1.size(); i++) {
			sommet2 = SousEnsembleP1.get(i);
			sommet = new Sommet(sommet2.getId(), sommet2.getNom(), sommet2.getLongueurPcc(),
					sommet2.getPrédécesseurPcc(), sommet2.getGraphe(), sommet2.getSuccesseurs(),
					sommet2.getPrédécesseurs());
			SousEnsembleP0.add(i, sommet);
		}

	}

	private boolean compareSousEnsembleP1EtSousEnsembleP0() {

		for (int i = 0; i < SousEnsembleP1.size(); i++) {
			if (SousEnsembleP1.get(i).getLongueurPcc() == null || SousEnsembleP0.get(i).getLongueurPcc() == null)
				return true;
			if (!SousEnsembleP1.get(i).getLongueurPcc().equals(SousEnsembleP0.get(i).getLongueurPcc()))
				return true;
		}
		return false;
	}

	private boolean deleteSommetFromS(Sommet s) {

		return (SousEnsembleS.remove(FindSommet(SousEnsembleS, s)) != null) ? true : false;
	}

	private boolean deleteSommetFromS(int i) {

		return (SousEnsembleS.remove(i) != null) ? true : false;
	}

	public void FindMaxSommetDansS(int x) {
		int i;
		Double max = SousEnsembleP0.get(x).getLongueurPcc();
		// System.out.println("e2" + SousEnsembleP0.get(x));
		List<Arret> list = SousEnsembleP0.get(x).getPrédécesseurs();
		List<Arret> list2 = SousEnsembleP0.get(x).getSuccesseurs();

		// System.out.println("e2" + list);
		for (Arret arret : list) {
			i = FindSommet(SousEnsembleP0, arret.getDepart());
			// System.out.println("e1");

			if (SousEnsembleP0.get(i).getLongueurPcc() != null) {
				// System.out.println("tt :"+SousEnsembleP1.get(x));
				if (max == null) {
					SousEnsembleP1.get(x).setLongueurPcc(SousEnsembleP0.get(i).getLongueurPcc() + arret.getLongueur());
					SousEnsembleP1.get(x).setPrédécesseurPcc(SousEnsembleP0.get(i).getId());
					max = SousEnsembleP0.get(i).getLongueurPcc() + arret.getLongueur();
				} else if (max < SousEnsembleP0.get(i).getLongueurPcc() + arret.getLongueur()) {
					SousEnsembleP1.get(x).setLongueurPcc(SousEnsembleP0.get(i).getLongueurPcc() + arret.getLongueur());
					SousEnsembleP1.get(x).setPrédécesseurPcc(SousEnsembleP0.get(i).getId());
					max = SousEnsembleP0.get(i).getLongueurPcc() + arret.getLongueur();
				}

			}
		}

		for (Arret arret : list2) {
			if (!arret.isOriente()) {
				i = FindSommet(SousEnsembleP0, arret.getArrive());
				// System.out.println("e1");

				if (SousEnsembleP0.get(i).getLongueurPcc() != null) {
					// System.out.println("tt :"+SousEnsembleP1.get(x));
					if (max == null) {
						SousEnsembleP1.get(x)
								.setLongueurPcc(SousEnsembleP0.get(i).getLongueurPcc() + arret.getLongueur());
						SousEnsembleP1.get(x).setPrédécesseurPcc(SousEnsembleP0.get(i).getId());
						max = SousEnsembleP0.get(i).getLongueurPcc() + arret.getLongueur();
					} else if (max < SousEnsembleP0.get(i).getLongueurPcc() + arret.getLongueur()) {
						SousEnsembleP1.get(x)
								.setLongueurPcc(SousEnsembleP0.get(i).getLongueurPcc() + arret.getLongueur());
						SousEnsembleP1.get(x).setPrédécesseurPcc(SousEnsembleP0.get(i).getId());
						max = SousEnsembleP0.get(i).getLongueurPcc() + arret.getLongueur();
					}

				}
			}
		}
	}

	private int FindSommet(List<Sommet> sommets, Sommet s) {

		/*
		 * int n = Collections.binarySearch(sommets, s, new Comparator<Sommet>()
		 * {
		 * 
		 * @Override public int compare(Sommet arg0, Sommet arg1) { // TODO
		 * Auto-generated method stub
		 * System.out.println(arg0.getId().compareTo(arg1.getId())); return
		 * arg0.getId().compareTo(arg1.getId()); } });
		 * 
		 * return n;
		 */
		for (int i = 0; i < sommets.size(); i++) {
			if (s.getId().equals(sommets.get(i).getId()))
				return i;
		}
		return -1;
	}

	public List<Sommet> getSousEnsembleP0() {
		return SousEnsembleP0;
	}

	public void setSousEnsembleP0(List<Sommet> sousEnsembleP0) {
		SousEnsembleP0 = new ArrayList<>(sousEnsembleP0);
	}

	public List<Sommet> getSousEnsembleP1() {
		return SousEnsembleP1;
	}

	public void setSousEnsembleP1(List<Sommet> sousEnsembleP1) {
		SousEnsembleP1 = new ArrayList<>(sousEnsembleP1);
	}

	public List<Sommet> getSousEnsembleS() {
		return SousEnsembleS;
	}

	public void setSousEnsembleS(List<Sommet> sousEnsembleS) {
		SousEnsembleS = new ArrayList<>(sousEnsembleS);
	}

	public Sommet getSommetPcc() {
		return sommetPcc;
	}

	public void setSommetPcc(Sommet sommetPcc) {
		this.sommetPcc = sommetPcc;
	}

	public Sommet getSommetDepart() {
		return sommetDepart;
	}

	public void setSommetDepart(Sommet sommetDepart) {
		this.sommetDepart = sommetDepart;
	}

}
