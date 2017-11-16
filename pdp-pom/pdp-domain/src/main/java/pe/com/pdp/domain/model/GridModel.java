package pe.com.pdp.domain.model;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;

public class GridModel implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private int draw;
	private List<HashMap<String, String>> order;
	private Integer start;
	private Integer length;
	private String column;
	private String dir;
	private String indicadorPaginado;

	public int getDraw() {
		return draw;
	}

	public void setDraw(int draw) {
		this.draw = draw;
	}

	public List<HashMap<String, String>> getOrder() {
		return order;
	}

	public void setOrder(List<HashMap<String, String>> order) {
		this.order = order;
	}

	public Integer getStart() {
		return start;
	}

	public void setStart(Integer start) {
		this.start = start;
	}

	public Integer getLength() {
		return length;
	}

	public void setLength(Integer length) {
		this.length = length;
	}

	public String getColumn() {
		return column;
	}

	public void setColumn(String column) {
		this.column = getOrder().get(0).get("column");
	}

	public String getDir() {
		return  dir;
	}

	public void setDir(String dir) {
		this.dir = getOrder().get(0).get("column");
	}

	public String getIndicadorPaginado() {
		return indicadorPaginado;
	}

	public void setIndicadorPaginado(String indicadorPaginado) {
		this.indicadorPaginado = indicadorPaginado;
	}
	
}
