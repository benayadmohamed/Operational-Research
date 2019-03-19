package com.models;

import java.io.Serializable;

import javax.persistence.Basic;

public class Node implements Serializable {
	private Long id;
	private String label;

	private String image;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

}
