package com.models;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;


public class Edge {
	private Long id;
	private Long to;
	private Long from;
	private Double label;
	private arrows arrows;
	
	public arrows getArrows() {
		return arrows;
	}
	public void setArrows(arrows arrows) {
		this.arrows = arrows;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getTo() {
		return to;
	}
	public void setTo(Long to) {
		this.to = to;
	}
	public Long getFrom() {
		return from;
	}
	public void setFrom(Long from) {
		this.from = from;
	}
	public Double getLabel() {
		return label;
	}
	public void setLabel(Double label) {
		this.label = label;
	}
   
	
}
