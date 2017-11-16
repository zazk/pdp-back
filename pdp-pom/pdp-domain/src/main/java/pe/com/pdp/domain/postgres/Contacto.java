package pe.com.pdp.domain.postgres;

import java.util.Date;

public class Contacto {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pataPerro.tm_contacto.id
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    private Integer id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pataPerro.tm_contacto.persona_id
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    private Integer personaId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pataPerro.tm_contacto.tipo_telefono
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    private Integer tipoTelefono;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pataPerro.tm_contacto.numero
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    private String numero;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pataPerro.tm_contacto.estado
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    private Integer estado;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pataPerro.tm_contacto.usuario_registro
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    private String usuarioRegistro;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pataPerro.tm_contacto.fecha_registro
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    private Date fechaRegistro;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pataPerro.tm_contacto.usuario_modifico
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    private String usuarioModifico;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pataPerro.tm_contacto.fecha_modifico
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    private Date fechaModifico;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column pataPerro.tm_contacto.id
     *
     * @return the value of pataPerro.tm_contacto.id
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column pataPerro.tm_contacto.id
     *
     * @param id the value for pataPerro.tm_contacto.id
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column pataPerro.tm_contacto.persona_id
     *
     * @return the value of pataPerro.tm_contacto.persona_id
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    public Integer getPersonaId() {
        return personaId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column pataPerro.tm_contacto.persona_id
     *
     * @param personaId the value for pataPerro.tm_contacto.persona_id
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    public void setPersonaId(Integer personaId) {
        this.personaId = personaId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column pataPerro.tm_contacto.tipo_telefono
     *
     * @return the value of pataPerro.tm_contacto.tipo_telefono
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    public Integer getTipoTelefono() {
        return tipoTelefono;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column pataPerro.tm_contacto.tipo_telefono
     *
     * @param tipoTelefono the value for pataPerro.tm_contacto.tipo_telefono
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    public void setTipoTelefono(Integer tipoTelefono) {
        this.tipoTelefono = tipoTelefono;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column pataPerro.tm_contacto.numero
     *
     * @return the value of pataPerro.tm_contacto.numero
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    public String getNumero() {
        return numero;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column pataPerro.tm_contacto.numero
     *
     * @param numero the value for pataPerro.tm_contacto.numero
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    public void setNumero(String numero) {
        this.numero = numero;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column pataPerro.tm_contacto.estado
     *
     * @return the value of pataPerro.tm_contacto.estado
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    public Integer getEstado() {
        return estado;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column pataPerro.tm_contacto.estado
     *
     * @param estado the value for pataPerro.tm_contacto.estado
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    public void setEstado(Integer estado) {
        this.estado = estado;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column pataPerro.tm_contacto.usuario_registro
     *
     * @return the value of pataPerro.tm_contacto.usuario_registro
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    public String getUsuarioRegistro() {
        return usuarioRegistro;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column pataPerro.tm_contacto.usuario_registro
     *
     * @param usuarioRegistro the value for pataPerro.tm_contacto.usuario_registro
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    public void setUsuarioRegistro(String usuarioRegistro) {
        this.usuarioRegistro = usuarioRegistro;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column pataPerro.tm_contacto.fecha_registro
     *
     * @return the value of pataPerro.tm_contacto.fecha_registro
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    public Date getFechaRegistro() {
        return fechaRegistro;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column pataPerro.tm_contacto.fecha_registro
     *
     * @param fechaRegistro the value for pataPerro.tm_contacto.fecha_registro
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    public void setFechaRegistro(Date fechaRegistro) {
        this.fechaRegistro = fechaRegistro;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column pataPerro.tm_contacto.usuario_modifico
     *
     * @return the value of pataPerro.tm_contacto.usuario_modifico
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    public String getUsuarioModifico() {
        return usuarioModifico;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column pataPerro.tm_contacto.usuario_modifico
     *
     * @param usuarioModifico the value for pataPerro.tm_contacto.usuario_modifico
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    public void setUsuarioModifico(String usuarioModifico) {
        this.usuarioModifico = usuarioModifico;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column pataPerro.tm_contacto.fecha_modifico
     *
     * @return the value of pataPerro.tm_contacto.fecha_modifico
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    public Date getFechaModifico() {
        return fechaModifico;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column pataPerro.tm_contacto.fecha_modifico
     *
     * @param fechaModifico the value for pataPerro.tm_contacto.fecha_modifico
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    public void setFechaModifico(Date fechaModifico) {
        this.fechaModifico = fechaModifico;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pataPerro.tm_contacto
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
        Contacto other = (Contacto) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getPersonaId() == null ? other.getPersonaId() == null : this.getPersonaId().equals(other.getPersonaId()))
            && (this.getTipoTelefono() == null ? other.getTipoTelefono() == null : this.getTipoTelefono().equals(other.getTipoTelefono()))
            && (this.getNumero() == null ? other.getNumero() == null : this.getNumero().equals(other.getNumero()))
            && (this.getEstado() == null ? other.getEstado() == null : this.getEstado().equals(other.getEstado()))
            && (this.getUsuarioRegistro() == null ? other.getUsuarioRegistro() == null : this.getUsuarioRegistro().equals(other.getUsuarioRegistro()))
            && (this.getFechaRegistro() == null ? other.getFechaRegistro() == null : this.getFechaRegistro().equals(other.getFechaRegistro()))
            && (this.getUsuarioModifico() == null ? other.getUsuarioModifico() == null : this.getUsuarioModifico().equals(other.getUsuarioModifico()))
            && (this.getFechaModifico() == null ? other.getFechaModifico() == null : this.getFechaModifico().equals(other.getFechaModifico()));
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pataPerro.tm_contacto
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getPersonaId() == null) ? 0 : getPersonaId().hashCode());
        result = prime * result + ((getTipoTelefono() == null) ? 0 : getTipoTelefono().hashCode());
        result = prime * result + ((getNumero() == null) ? 0 : getNumero().hashCode());
        result = prime * result + ((getEstado() == null) ? 0 : getEstado().hashCode());
        result = prime * result + ((getUsuarioRegistro() == null) ? 0 : getUsuarioRegistro().hashCode());
        result = prime * result + ((getFechaRegistro() == null) ? 0 : getFechaRegistro().hashCode());
        result = prime * result + ((getUsuarioModifico() == null) ? 0 : getUsuarioModifico().hashCode());
        result = prime * result + ((getFechaModifico() == null) ? 0 : getFechaModifico().hashCode());
        return result;
    }
}