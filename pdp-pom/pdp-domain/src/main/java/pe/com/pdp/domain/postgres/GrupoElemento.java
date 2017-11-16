package pe.com.pdp.domain.postgres;

import java.io.Serializable;
import java.util.Date;

import pe.com.pdp.domain.model.GridModel;

public class GrupoElemento extends GridModel implements Serializable{
	   
		private static final long serialVersionUID = 1L;
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pataPerro.tm_grupo_elemento.id
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    private Integer id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pataPerro.tm_grupo_elemento.des_abreviacion
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    private String desAbreviacion;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pataPerro.tm_grupo_elemento.estado
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    private Integer estado;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pataPerro.tm_grupo_elemento.nombre
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    private String nombre;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pataPerro.tm_grupo_elemento.usuario_registro
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    private String usuarioRegistro;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pataPerro.tm_grupo_elemento.fecha_registro
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    private Date fechaRegistro;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pataPerro.tm_grupo_elemento.usuario_modifico
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    private String usuarioModifico;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pataPerro.tm_grupo_elemento.fecha_modifico
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    private Date fechaModifico;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column pataPerro.tm_grupo_elemento.id
     *
     * @return the value of pataPerro.tm_grupo_elemento.id
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column pataPerro.tm_grupo_elemento.id
     *
     * @param id the value for pataPerro.tm_grupo_elemento.id
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column pataPerro.tm_grupo_elemento.des_abreviacion
     *
     * @return the value of pataPerro.tm_grupo_elemento.des_abreviacion
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    public String getDesAbreviacion() {
        return desAbreviacion;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column pataPerro.tm_grupo_elemento.des_abreviacion
     *
     * @param desAbreviacion the value for pataPerro.tm_grupo_elemento.des_abreviacion
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    public void setDesAbreviacion(String desAbreviacion) {
        this.desAbreviacion = desAbreviacion;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column pataPerro.tm_grupo_elemento.estado
     *
     * @return the value of pataPerro.tm_grupo_elemento.estado
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    public Integer getEstado() {
        return estado;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column pataPerro.tm_grupo_elemento.estado
     *
     * @param estado the value for pataPerro.tm_grupo_elemento.estado
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    public void setEstado(Integer estado) {
        this.estado = estado;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column pataPerro.tm_grupo_elemento.nombre
     *
     * @return the value of pataPerro.tm_grupo_elemento.nombre
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column pataPerro.tm_grupo_elemento.nombre
     *
     * @param nombre the value for pataPerro.tm_grupo_elemento.nombre
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column pataPerro.tm_grupo_elemento.usuario_registro
     *
     * @return the value of pataPerro.tm_grupo_elemento.usuario_registro
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    public String getUsuarioRegistro() {
        return usuarioRegistro;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column pataPerro.tm_grupo_elemento.usuario_registro
     *
     * @param usuarioRegistro the value for pataPerro.tm_grupo_elemento.usuario_registro
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    public void setUsuarioRegistro(String usuarioRegistro) {
        this.usuarioRegistro = usuarioRegistro;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column pataPerro.tm_grupo_elemento.fecha_registro
     *
     * @return the value of pataPerro.tm_grupo_elemento.fecha_registro
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    public Date getFechaRegistro() {
        return fechaRegistro;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column pataPerro.tm_grupo_elemento.fecha_registro
     *
     * @param fechaRegistro the value for pataPerro.tm_grupo_elemento.fecha_registro
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    public void setFechaRegistro(Date fechaRegistro) {
        this.fechaRegistro = fechaRegistro;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column pataPerro.tm_grupo_elemento.usuario_modifico
     *
     * @return the value of pataPerro.tm_grupo_elemento.usuario_modifico
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    public String getUsuarioModifico() {
        return usuarioModifico;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column pataPerro.tm_grupo_elemento.usuario_modifico
     *
     * @param usuarioModifico the value for pataPerro.tm_grupo_elemento.usuario_modifico
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    public void setUsuarioModifico(String usuarioModifico) {
        this.usuarioModifico = usuarioModifico;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column pataPerro.tm_grupo_elemento.fecha_modifico
     *
     * @return the value of pataPerro.tm_grupo_elemento.fecha_modifico
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    public Date getFechaModifico() {
        return fechaModifico;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column pataPerro.tm_grupo_elemento.fecha_modifico
     *
     * @param fechaModifico the value for pataPerro.tm_grupo_elemento.fecha_modifico
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    public void setFechaModifico(Date fechaModifico) {
        this.fechaModifico = fechaModifico;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pataPerro.tm_grupo_elemento
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (that == null) {
            return false;
        }
        if (getClass() != that.getClass()) {
            return false;
        }
        GrupoElemento other = (GrupoElemento) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getDesAbreviacion() == null ? other.getDesAbreviacion() == null : this.getDesAbreviacion().equals(other.getDesAbreviacion()))
            && (this.getEstado() == null ? other.getEstado() == null : this.getEstado().equals(other.getEstado()))
            && (this.getNombre() == null ? other.getNombre() == null : this.getNombre().equals(other.getNombre()))
            && (this.getUsuarioRegistro() == null ? other.getUsuarioRegistro() == null : this.getUsuarioRegistro().equals(other.getUsuarioRegistro()))
            && (this.getFechaRegistro() == null ? other.getFechaRegistro() == null : this.getFechaRegistro().equals(other.getFechaRegistro()))
            && (this.getUsuarioModifico() == null ? other.getUsuarioModifico() == null : this.getUsuarioModifico().equals(other.getUsuarioModifico()))
            && (this.getFechaModifico() == null ? other.getFechaModifico() == null : this.getFechaModifico().equals(other.getFechaModifico()));
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pataPerro.tm_grupo_elemento
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getDesAbreviacion() == null) ? 0 : getDesAbreviacion().hashCode());
        result = prime * result + ((getEstado() == null) ? 0 : getEstado().hashCode());
        result = prime * result + ((getNombre() == null) ? 0 : getNombre().hashCode());
        result = prime * result + ((getUsuarioRegistro() == null) ? 0 : getUsuarioRegistro().hashCode());
        result = prime * result + ((getFechaRegistro() == null) ? 0 : getFechaRegistro().hashCode());
        result = prime * result + ((getUsuarioModifico() == null) ? 0 : getUsuarioModifico().hashCode());
        result = prime * result + ((getFechaModifico() == null) ? 0 : getFechaModifico().hashCode());
        return result;
    }
}