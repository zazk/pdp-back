package pe.com.pdp.domain.postgres;

import java.io.Serializable;

public class RolOpcion  implements Serializable{
	
	
	private static final long serialVersionUID = 1L;
	
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pataPerro.td_rol_opcion.id
     *
     * @mbg.generated Wed Apr 26 22:49:11 COT 2017
     */
    private Integer id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pataPerro.td_rol_opcion.rol_id
     *
     * @mbg.generated Wed Apr 26 22:49:11 COT 2017
     */
    private Integer rolId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pataPerro.td_rol_opcion.opcion_id
     *
     * @mbg.generated Wed Apr 26 22:49:11 COT 2017
     */
    private Integer opcionId;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column pataPerro.td_rol_opcion.id
     *
     * @return the value of pataPerro.td_rol_opcion.id
     *
     * @mbg.generated Wed Apr 26 22:49:11 COT 2017
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column pataPerro.td_rol_opcion.id
     *
     * @param id the value for pataPerro.td_rol_opcion.id
     *
     * @mbg.generated Wed Apr 26 22:49:11 COT 2017
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column pataPerro.td_rol_opcion.rol_id
     *
     * @return the value of pataPerro.td_rol_opcion.rol_id
     *
     * @mbg.generated Wed Apr 26 22:49:11 COT 2017
     */
    public Integer getRolId() {
        return rolId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column pataPerro.td_rol_opcion.rol_id
     *
     * @param rolId the value for pataPerro.td_rol_opcion.rol_id
     *
     * @mbg.generated Wed Apr 26 22:49:11 COT 2017
     */
    public void setRolId(Integer rolId) {
        this.rolId = rolId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column pataPerro.td_rol_opcion.opcion_id
     *
     * @return the value of pataPerro.td_rol_opcion.opcion_id
     *
     * @mbg.generated Wed Apr 26 22:49:11 COT 2017
     */
    public Integer getOpcionId() {
        return opcionId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column pataPerro.td_rol_opcion.opcion_id
     *
     * @param opcionId the value for pataPerro.td_rol_opcion.opcion_id
     *
     * @mbg.generated Wed Apr 26 22:49:11 COT 2017
     */
    public void setOpcionId(Integer opcionId) {
        this.opcionId = opcionId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pataPerro.td_rol_opcion
     *
     * @mbg.generated Wed Apr 26 22:49:11 COT 2017
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
        RolOpcion other = (RolOpcion) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getRolId() == null ? other.getRolId() == null : this.getRolId().equals(other.getRolId()))
            && (this.getOpcionId() == null ? other.getOpcionId() == null : this.getOpcionId().equals(other.getOpcionId()));
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pataPerro.td_rol_opcion
     *
     * @mbg.generated Wed Apr 26 22:49:11 COT 2017
     */
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getRolId() == null) ? 0 : getRolId().hashCode());
        result = prime * result + ((getOpcionId() == null) ? 0 : getOpcionId().hashCode());
        return result;
    }
}