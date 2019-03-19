package com.models;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Vector;
import java.util.function.Predicate;

public class PCCDijkstra {

	List<Sommet> SousEnsembleS;
	List<Sommet> SousEnsembleSBarre;
	private Sommet sommetPcc;
	private Sommet sommetDepart;

	public void init() {
		int i;
		SousEnsembleS = new Vector<>();
		sommetPcc = SousEnsembleSBarre.get(FindSommetDansSbarre(sommetDepart));
		sommetPcc.setLongueurPcc(0D);
		SousEnsembleS.add(sommetPcc);
		deleteSommetFromSbarre(sommetPcc);

		for (Sommet sommet : SousEnsembleSBarre) {
			sommet.setLongueurPcc(null);
			sommet.setPrédécesseurPcc(null);

		}
		List<Arret> arrets = sommetPcc.getSuccesseurs();
		List<Arret> arrets2 = sommetPcc.getPrédécesseurs();
		for (Arret arret : arrets) {

			i = FindSommetDansSbarre(arret.getArrive());
			if (i >= 0) {
				SousEnsembleSBarre.get(i).setLongueurPcc(arret.getLongueur());
				SousEnsembleSBarre.get(i).setPrédécesseurPcc(sommetPcc.getId());
			}
		}
		for (Arret arret : arrets2) {
			if (!arret.isOriente()) {
				i = FindSommetDansSbarre(arret.getDepart());
				if (i >= 0) {
					SousEnsembleSBarre.get(i).setLongueurPcc(arret.getLongueur());
					SousEnsembleSBarre.get(i).setPrédécesseurPcc(sommetPcc.getId());
				}
			}
		}
	}

	public void CalculePcc() {
		int i;
		for (Sommet sommet : SousEnsembleS) {
			System.out.print(" (" + sommet.getLongueurPcc() + "," + sommet.getPrédécesseurPcc() + ")");
		}
		for (Sommet sommet : SousEnsembleSBarre) {
			System.out.print(" (" + sommet.getLongueurPcc() + "," + sommet.getPrédécesseurPcc() + ")");
		}
		System.out.println();
		sommetPcc = FindMinSommetDansSbarre();
		deleteSommetFromSbarre(sommetPcc);
		SousEnsembleS.add(sommetPcc);

		if (SousEnsembleSBarre.size() != 0) {
			List<Arret> arrets = sommetPcc.getSuccesseurs();
			for (Arret arret : arrets) {
				i = FindSommetDansSbarre(arret.getArrive());
				if (i >= 0) {
					if (SousEnsembleSBarre.get(i).getLongueurPcc() == null) {
						SousEnsembleSBarre.get(i).setLongueurPcc(sommetPcc.getLongueurPcc() + arret.getLongueur());
						SousEnsembleSBarre.get(i).setPrédécesseurPcc(sommetPcc.getId());
					} else {
						if (SousEnsembleSBarre.get(i).getLongueurPcc() > sommetPcc.getLongueurPcc()
								+ arret.getLongueur()) {
							SousEnsembleSBarre.get(i).setLongueurPcc(sommetPcc.getLongueurPcc() + arret.getLongueur());
							SousEnsembleSBarre.get(i).setPrédécesseurPcc(sommetPcc.getId());
						}

					}
				}
			}

			CalculePcc();
		}

	}

	public void CalculePccNonOrienteOuOriente() {
		int i;
		for (Sommet sommet : SousEnsembleS) {
			System.out.print(" (" + sommet.getLongueurPcc() + "," + sommet.getPrédécesseurPcc() + ")");
		}
		for (Sommet sommet : SousEnsembleSBarre) {
			System.out.print(" (" + sommet.getLongueurPcc() + "," + sommet.getPrédécesseurPcc() + ")");
		}
		System.out.println();
		sommetPcc = FindMinSommetDansSbarre();
		deleteSommetFromSbarre(sommetPcc);
		SousEnsembleS.add(sommetPcc);

		if (SousEnsembleSBarre.size() != 0) {
			List<Arret> arrets = sommetPcc.getSuccesseurs();
			for (Arret arret : arrets) {
				i = FindSommetDansSbarre(arret.getArrive());
				if (i >= 0) {
					if (SousEnsembleSBarre.get(i).getLongueurPcc() == null) {
						SousEnsembleSBarre.get(i).setLongueurPcc(sommetPcc.getLongueurPcc() + arret.getLongueur());
						SousEnsembleSBarre.get(i).setPrédécesseurPcc(sommetPcc.getId());
					} else {
						if (SousEnsembleSBarre.get(i).getLongueurPcc() > sommetPcc.getLongueurPcc()
								+ arret.getLongueur()) {
							SousEnsembleSBarre.get(i).setLongueurPcc(sommetPcc.getLongueurPcc() + arret.getLongueur());
							SousEnsembleSBarre.get(i).setPrédécesseurPcc(sommetPcc.getId());
						}

					}
				}
			}

			arrets = sommetPcc.getPrédécesseurs();
			for (Arret arret : arrets) {

				if (!arret.isOriente()) {
					System.out.println(arret.isOriente());
					i = FindSommetDansSbarre(arret.getDepart());
					if (i >= 0) {
						if (SousEnsembleSBarre.get(i).getLongueurPcc() == null) {
							SousEnsembleSBarre.get(i).setLongueurPcc(sommetPcc.getLongueurPcc() + arret.getLongueur());
							SousEnsembleSBarre.get(i).setPrédécesseurPcc(sommetPcc.getId());
						} else {
							if (SousEnsembleSBarre.get(i).getLongueurPcc() > sommetPcc.getLongueurPcc()
									+ arret.getLongueur()) {
								SousEnsembleSBarre.get(i)
										.setLongueurPcc(sommetPcc.getLongueurPcc() + arret.getLongueur());
								SousEnsembleSBarre.get(i).setPrédécesseurPcc(sommetPcc.getId());
							}

						}
					}
				}
			}

			CalculePccNonOrienteOuOriente();
		}

	}

	private boolean deleteSommetFromSbarre(Sommet s) {

		return (SousEnsembleSBarre.remove(FindSommetDansSbarre(s)) != null) ? true : false;
	}

	private boolean deleteSommetFromSbarre(int i) {

		return (SousEnsembleSBarre.remove(i) != null) ? true : false;
	}

	public Sommet FindMinSommetDansSbarre() {

		List<Sommet> list = new ArrayList<>(SousEnsembleSBarre);
		
		list.removeIf(new Predicate<Sommet>() {

			@Override
			public boolean test(Sommet t) {
				// TODO Auto-generated method stub
				if (t.getLongueurPcc() == null)
					return true;
				else
					return false;
			}
		});
	
		return Collections.min(list, new Comparator<Sommet>() {

			@Override
			public int compare(Sommet o1, Sommet o2) {
				// TODO Auto-generated method stub
				return o1.getLongueurPcc().compareTo(o2.getLongueurPcc());
			}
		});
	}

	private int FindSommetDansSbarre(Sommet s) {

		int n = -1;
		for (int i = 0; i < SousEnsembleSBarre.size(); i++) {
			if (SousEnsembleSBarre.get(i).getId().equals(s.getId()))
				return i;
		}
		/*
		 * = Collections.binarySearch(SousEnsembleSBarre, s, new
		 * Comparator<Sommet>() {
		 * 
		 * @Override public int compare(Sommet arg0, Sommet arg1) { // TODO
		 * Auto-generated method stub return
		 * arg0.getId().compareTo(arg1.getId()); } });
		 */

		return n;
	}

	public List<Sommet> getSousEnsembleS() {
		return SousEnsembleS;
	}

	public void setSousEnsembleS(List<Sommet> sousEnsembleS) {
		SousEnsembleS = sousEnsembleS;
	}

	public List<Sommet> getSousEnsembleSBarre() {
		return SousEnsembleSBarre;
	}

	public void setSousEnsembleSBarre(List<Sommet> sousEnsembleSBarre) {
		SousEnsembleSBarre = sousEnsembleSBarre;
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
