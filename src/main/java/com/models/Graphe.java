/**
 * This file was generated by the Jeddict
 */

package com.models;

import java.io.IOException;
import java.io.Serializable;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * @author simo-
 */

@Entity
public class Graphe implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@Basic
	private String nom;
	@JsonIgnore 
	@OneToMany(fetch = FetchType.EAGER, targetEntity = Sommet.class, mappedBy = "graphe", cascade = CascadeType.ALL)
	private List<Sommet> sommets;

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNom() {
		return this.nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public List<Sommet> getSommets() {
		HashSet<Sommet> so = new HashSet<>(sommets);
		return new ArrayList<>(so);
	}

	public void setSommets(List<Sommet> sommets) {
		this.sommets = sommets;
	}
	@JsonIgnore 
	public String getSommetJson() {
		StringBuffer buffer = new StringBuffer();
		if(getSommets().isEmpty())
			return "[]";
		buffer.append("[");

		for (Sommet sommet : getSommets()) {
			buffer.append("{id: '" + sommet.getId() + "', label: '" + sommet.getNom() + "' ,image: '"
					+ sommet.getImage() + "', shape: 'image'},");
		}

		buffer = buffer.deleteCharAt(buffer.length() - 1);
		buffer.append("]");
		if (buffer.length() != 0)
			return buffer.toString();
		else
			return null;
	}
	@JsonIgnore 
	public String getSommetWithAllAttributJson() {
		StringBuffer buffer = new StringBuffer();
		if(getSommets().isEmpty())
			return "[]";
		buffer.append("[");

		for (Sommet sommet : getSommets()) {
			buffer.append(sommet.toString() + ",");
		}

		buffer = buffer.deleteCharAt(buffer.length() - 1);
		buffer.append("]");
		if (buffer.length() != 0)
			return buffer.toString();
		else
			return null;
	}
	@JsonIgnore 
	public String getArretJson() {
		StringBuffer buffer = new StringBuffer();
		boolean b=false;
		if(getSommets().isEmpty())
			return "[]";
		buffer.append("[");

		for (Sommet sommet : getSommets()) {
			List<Arret> arrets = new ArrayList<>(sommet.getSuccesseurs());
			for (Arret arret : arrets) {
				b=true;
				buffer.append("{id: '" + arret.getId() + "', from: '" + arret.getDepart().getId() + "', to: '"
						+ arret.getArrive().getId() + "',label:'" + arret.getLongueur() + "',arrows:{to:"
						+ arret.isOriente() + "}, length: 200},");
			}
		}

		buffer = buffer.deleteCharAt(buffer.length() - 1);
		buffer.append("]");
		if (buffer.length() != 0 && b)
			return buffer.toString();
		else
			return "[]";
	}
	@JsonIgnore 
	public String getArretWithAllAttributJson() {
		StringBuffer buffer = new StringBuffer();
		boolean b=false;
		if(getSommets().isEmpty())
			return "[]";
		buffer.append("[");

		for (Sommet sommet : getSommets()) {
			List<Arret> arrets = new ArrayList<>(sommet.getSuccesseurs());
			for (Arret arret : arrets) {
				b=true;
				buffer.append(arret.toString() + ",");
			}
		}

		buffer = buffer.deleteCharAt(buffer.length() - 1);
		buffer.append("]");
		if (buffer.length() != 0 && b)
			return buffer.toString();
		else
			return "[]";
	}
	@JsonIgnore 
	public String getGrapheJson(){
		return "{id:"+this.nom+",nom:'"+this.nom+"'}";
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub

		ObjectMapper mapper = new ObjectMapper();
		StringWriter stringWriter = new StringWriter();
		try {
			mapper.writeValue(stringWriter, this);
		} catch (IOException e) {
			// TODO Auto-generated catch block

		}
		return stringWriter.toString();
	}
}
