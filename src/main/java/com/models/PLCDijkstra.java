package com.models;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Vector;
import java.util.function.Predicate;

public class PLCDijkstra {

	List<Sommet> SousEnsembleS;
	List<Sommet> SousEnsembleSBarre;
	private Sommet sommetPlc;
	private Sommet sommetDepart;

	public void init() {
		int i;
		SousEnsembleS = new Vector<>();
		sommetPlc = SousEnsembleSBarre.get(FindSommetDansSbarre(sommetDepart));
		sommetPlc.setLongueurPcc(0D);
		SousEnsembleS.add(sommetPlc);
		deleteSommetFromSbarre(sommetPlc);

		for (Sommet sommet : SousEnsembleSBarre) {
			sommet.setLongueurPcc(null);
			sommet.setPrédécesseurPcc(null);

		}
		List<Arret> arrets = sommetPlc.getSuccesseurs();
		List<Arret> arrets2 = sommetPlc.getPrédécesseurs();
		for (Arret arret : arrets) {

			i = FindSommetDansSbarre(arret.getArrive());
			if (i >= 0) {
				SousEnsembleSBarre.get(i).setLongueurPcc(arret.getLongueur());
				SousEnsembleSBarre.get(i).setPrédécesseurPcc(sommetPlc.getId());
			}
		}
		for (Arret arret : arrets2) {
			if (!arret.isOriente()) {
				i = FindSommetDansSbarre(arret.getDepart());
				if (i >= 0) {
					SousEnsembleSBarre.get(i).setLongueurPcc(arret.getLongueur());
					SousEnsembleSBarre.get(i).setPrédécesseurPcc(sommetPlc.getId());
				}
			}
		}

	}

	public void CalculePlc() {
		int i;
		for (Sommet sommet : SousEnsembleS) {
			System.out.print(" (" + sommet.getLongueurPcc() + "," + sommet.getPrédécesseurPcc() + ")");
		}
		for (Sommet sommet : SousEnsembleSBarre) {
			System.out.print(" (" + sommet.getLongueurPcc() + "," + sommet.getPrédécesseurPcc() + ")");
		}
		System.out.println();
		sommetPlc = FindMaxSommetDansSbarre();
		deleteSommetFromSbarre(sommetPlc);
		SousEnsembleS.add(sommetPlc);

		if (SousEnsembleSBarre.size() != 0) {
			List<Arret> arrets = sommetPlc.getSuccesseurs();
			for (Arret arret : arrets) {
				i = FindSommetDansSbarre(arret.getArrive());
				if (i >= 0) {
					if (SousEnsembleSBarre.get(i).getLongueurPcc() == null) {
						SousEnsembleSBarre.get(i).setLongueurPcc(sommetPlc.getLongueurPcc() + arret.getLongueur());
						SousEnsembleSBarre.get(i).setPrédécesseurPcc(sommetPlc.getId());
					} else {
						if (SousEnsembleSBarre.get(i).getLongueurPcc() > sommetPlc.getLongueurPcc()
								+ arret.getLongueur()) {
							SousEnsembleSBarre.get(i).setLongueurPcc(sommetPlc.getLongueurPcc() + arret.getLongueur());
							SousEnsembleSBarre.get(i).setPrédécesseurPcc(sommetPlc.getId());
						}

					}
				}
			}

			CalculePlc();
		}

	}

	public void CalculePlcNonOrienteOuOriente() {
		int i;
		for (Sommet sommet : SousEnsembleS) {
			System.out.print(" (" + sommet.getLongueurPcc() + "," + sommet.getPrédécesseurPcc() + ")");
		}
		for (Sommet sommet : SousEnsembleSBarre) {
			System.out.print(" (" + sommet.getLongueurPcc() + "," + sommet.getPrédécesseurPcc() + ")");
		}
		System.out.println();
		sommetPlc = FindMaxSommetDansSbarre();
		deleteSommetFromSbarre(sommetPlc);
		SousEnsembleS.add(sommetPlc);

		if (SousEnsembleSBarre.size() != 0) {
			List<Arret> arrets = sommetPlc.getSuccesseurs();
			for (Arret arret : arrets) {
				i = FindSommetDansSbarre(arret.getArrive());
				if (i >= 0) {
					if (SousEnsembleSBarre.get(i).getLongueurPcc() == null) {
						SousEnsembleSBarre.get(i).setLongueurPcc(sommetPlc.getLongueurPcc() + arret.getLongueur());
						SousEnsembleSBarre.get(i).setPrédécesseurPcc(sommetPlc.getId());
					} else {
						if (SousEnsembleSBarre.get(i).getLongueurPcc() > sommetPlc.getLongueurPcc()
								+ arret.getLongueur()) {
							SousEnsembleSBarre.get(i).setLongueurPcc(sommetPlc.getLongueurPcc() + arret.getLongueur());
							SousEnsembleSBarre.get(i).setPrédécesseurPcc(sommetPlc.getId());
						}

					}
				}
			}

			arrets = sommetPlc.getPrédécesseurs();
			for (Arret arret : arrets) {

				if (!arret.isOriente()) {
					System.out.println(arret.isOriente());
					i = FindSommetDansSbarre(arret.getDepart());
					if (i >= 0) {
						if (SousEnsembleSBarre.get(i).getLongueurPcc() == null) {
							SousEnsembleSBarre.get(i).setLongueurPcc(sommetPlc.getLongueurPcc() + arret.getLongueur());
							SousEnsembleSBarre.get(i).setPrédécesseurPcc(sommetPlc.getId());
						} else {
							if (SousEnsembleSBarre.get(i).getLongueurPcc() > sommetPlc.getLongueurPcc()
									+ arret.getLongueur()) {
								SousEnsembleSBarre.get(i)
										.setLongueurPcc(sommetPlc.getLongueurPcc() + arret.getLongueur());
								SousEnsembleSBarre.get(i).setPrédécesseurPcc(sommetPlc.getId());
							}

						}
					}
				}
			}

			CalculePlcNonOrienteOuOriente();
		}

	}

	private boolean deleteSommetFromSbarre(Sommet s) {

		return (SousEnsembleSBarre.remove(FindSommetDansSbarre(s)) != null) ? true : false;
	}

	private boolean deleteSommetFromSbarre(int i) {

		return (SousEnsembleSBarre.remove(i) != null) ? true : false;
	}

	public Sommet FindMaxSommetDansSbarre() {
		List<Sommet> list = new ArrayList<>(SousEnsembleSBarre);
		System.out.println("d");
		System.out.println(list);
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
		System.out.println("d");
		System.out.println(list);
		return Collections.max(list, new Comparator<Sommet>() {

			@Override
			public int compare(Sommet o1, Sommet o2) {
				// TODO Auto-generated method stub
				return o1.getLongueurPcc().compareTo(o2.getLongueurPcc());
			}
		});
	}

	private int FindSommetDansSbarre(Sommet s) {

		int n=-1 ;
		for (int i = 0; i < SousEnsembleSBarre.size(); i++) {
			if(SousEnsembleSBarre.get(i).getId().equals(s.getId()))
				return i;
		}
		/*= Collections.binarySearch(SousEnsembleSBarre, s, new Comparator<Sommet>() {

			@Override
			public int compare(Sommet arg0, Sommet arg1) {
				// TODO Auto-generated method stub
				return arg0.getId().compareTo(arg1.getId());
			}
		});*/

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

	public Sommet getSommetPlc() {
		return sommetPlc;
	}

	public void setSommetPlc(Sommet sommetPlc) {
		this.sommetPlc = sommetPlc;
	}

	public Sommet getSommetDepart() {
		return sommetDepart;
	}

	public void setSommetDepart(Sommet sommetDepart) {
		this.sommetDepart = sommetDepart;
	}

}
