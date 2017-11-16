package pe.com.pdp.domain.postgres;

public class UsuarioRol {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pataPerro.td_usuario_rol.id
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    private Integer id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pataPerro.td_usuario_rol.rol_id
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    private Integer rolId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pataPerro.td_usuario_rol.usuario_id
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    private Integer usuarioId;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column pataPerro.td_usuario_rol.id
     *
     * @return the value of pataPerro.td_usuario_rol.id
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column pataPerro.td_usuario_rol.id
     *
     * @param id the value for pataPerro.td_usuario_rol.id
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column pataPerro.td_usuario_rol.rol_id
     *
     * @return the value of pataPerro.td_usuario_rol.rol_id
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    public Integer getRolId() {
        return rolId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column pataPerro.td_usuario_rol.rol_id
     *
     * @param rolId the value for pataPerro.td_usuario_rol.rol_id
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    public void setRolId(Integer rolId) {
        this.rolId = rolId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column pataPerro.td_usuario_rol.usuario_id
     *
     * @return the value of pataPerro.td_usuario_rol.usuario_id
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    public Integer getUsuarioId() {
        return usuarioId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column pataPerro.td_usuario_rol.usuario_id
     *
     * @param usuarioId the value for pataPerro.td_usuario_rol.usuario_id
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    public void setUsuarioId(Integer usuarioId) {
        this.usuarioId = usuarioId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pataPerro.td_usuario_rol
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
        UsuarioRol other = (UsuarioRol) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getRolId() == null ? other.getRolId() == null : this.getRolId().equals(other.getRolId()))
            && (this.getUsuarioId() == null ? other.getUsuarioId() == null : this.getUsuarioId().equals(other.getUsuarioId()));
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pataPerro.td_usuario_rol
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getRolId() == null) ? 0 : getRolId().hashCode());
        result = prime * result + ((getUsuarioId() == null) ? 0 : getUsuarioId().hashCode());
        return result;
    }
    
  /**-Atributos adicionales-**/
    
    private Rol rol;

	public Rol getRol() {
		return rol;
	}

	public void setRol(Rol rol) {
		this.rol = rol;
	}
    
}