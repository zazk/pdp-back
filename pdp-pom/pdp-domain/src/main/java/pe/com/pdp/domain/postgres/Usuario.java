package pe.com.pdp.domain.postgres;

import java.io.Serializable;
import java.util.Date;

import pe.com.pdp.domain.model.GridModel;

public class Usuario extends GridModel implements Serializable{

	private static final long serialVersionUID = 1L;

	/**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pataPerro.tm_usuario.id
     *
     * @mbggenerated Sun May 14 00:04:04 COT 2017
     */
    private Integer id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pataPerro.tm_usuario.persona_id
     *
     * @mbggenerated Sun May 14 00:04:04 COT 2017
     */
    private Integer personaId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pataPerro.tm_usuario.usuario
     *
     * @mbggenerated Sun May 14 00:04:04 COT 2017
     */
    private String usuario;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pataPerro.tm_usuario.pass
     *
     * @mbggenerated Sun May 14 00:04:04 COT 2017
     */
    private String pass;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pataPerro.tm_usuario.estado
     *
     * @mbggenerated Sun May 14 00:04:04 COT 2017
     */
    private Integer estado;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pataPerro.tm_usuario.ind_alerta
     *
     * @mbggenerated Sun May 14 00:04:04 COT 2017
     */
    private Integer indAlerta;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pataPerro.tm_usuario.usuario_registro
     *
     * @mbggenerated Sun May 14 00:04:04 COT 2017
     */
    private String usuarioRegistro;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pataPerro.tm_usuario.fecha_registro
     *
     * @mbggenerated Sun May 14 00:04:04 COT 2017
     */
    private Date fechaRegistro;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pataPerro.tm_usuario.usuario_modifico
     *
     * @mbggenerated Sun May 14 00:04:04 COT 2017
     */
    private String usuarioModifico;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pataPerro.tm_usuario.fecha_modifico
     *
     * @mbggenerated Sun May 14 00:04:04 COT 2017
     */
    private Date fechaModifico;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pataPerro.tm_usuario.ID_USUARIO_FB
     *
     * @mbggenerated Sun May 14 00:04:04 COT 2017
     */
    private String idUsuarioFb;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pataPerro.tm_usuario.ID_USUARIO_GO
     *
     * @mbggenerated Sun May 14 00:04:04 COT 2017
     */
    private String idUsuarioGo;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pataPerro.tm_usuario.ID_USUARIO_TW
     *
     * @mbggenerated Sun May 14 00:04:04 COT 2017
     */
    private String idUsuarioTw;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pataPerro.tm_usuario.ID_USUARIO_IG
     *
     * @mbggenerated Sun May 14 00:04:04 COT 2017
     */
    private String idUsuarioIg;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column pataPerro.tm_usuario.id
     *
     * @return the value of pataPerro.tm_usuario.id
     *
     * @mbggenerated Sun May 14 00:04:04 COT 2017
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column pataPerro.tm_usuario.id
     *
     * @param id the value for pataPerro.tm_usuario.id
     *
     * @mbggenerated Sun May 14 00:04:04 COT 2017
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column pataPerro.tm_usuario.persona_id
     *
     * @return the value of pataPerro.tm_usuario.persona_id
     *
     * @mbggenerated Sun May 14 00:04:04 COT 2017
     */
    public Integer getPersonaId() {
        return personaId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column pataPerro.tm_usuario.persona_id
     *
     * @param personaId the value for pataPerro.tm_usuario.persona_id
     *
     * @mbggenerated Sun May 14 00:04:04 COT 2017
     */
    public void setPersonaId(Integer personaId) {
        this.personaId = personaId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column pataPerro.tm_usuario.usuario
     *
     * @return the value of pataPerro.tm_usuario.usuario
     *
     * @mbggenerated Sun May 14 00:04:04 COT 2017
     */
    public String getUsuario() {
        return usuario;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column pataPerro.tm_usuario.usuario
     *
     * @param usuario the value for pataPerro.tm_usuario.usuario
     *
     * @mbggenerated Sun May 14 00:04:04 COT 2017
     */
    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column pataPerro.tm_usuario.pass
     *
     * @return the value of pataPerro.tm_usuario.pass
     *
     * @mbggenerated Sun May 14 00:04:04 COT 2017
     */
    public String getPass() {
        return pass;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column pataPerro.tm_usuario.pass
     *
     * @param pass the value for pataPerro.tm_usuario.pass
     *
     * @mbggenerated Sun May 14 00:04:04 COT 2017
     */
    public void setPass(String pass) {
        this.pass = pass;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column pataPerro.tm_usuario.estado
     *
     * @return the value of pataPerro.tm_usuario.estado
     *
     * @mbggenerated Sun May 14 00:04:04 COT 2017
     */
    public Integer getEstado() {
        return estado;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column pataPerro.tm_usuario.estado
     *
     * @param estado the value for pataPerro.tm_usuario.estado
     *
     * @mbggenerated Sun May 14 00:04:04 COT 2017
     */
    public void setEstado(Integer estado) {
        this.estado = estado;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column pataPerro.tm_usuario.ind_alerta
     *
     * @return the value of pataPerro.tm_usuario.ind_alerta
     *
     * @mbggenerated Sun May 14 00:04:04 COT 2017
     */
    public Integer getIndAlerta() {
        return indAlerta;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column pataPerro.tm_usuario.ind_alerta
     *
     * @param indAlerta the value for pataPerro.tm_usuario.ind_alerta
     *
     * @mbggenerated Sun May 14 00:04:04 COT 2017
     */
    public void setIndAlerta(Integer indAlerta) {
        this.indAlerta = indAlerta;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column pataPerro.tm_usuario.usuario_registro
     *
     * @return the value of pataPerro.tm_usuario.usuario_registro
     *
     * @mbggenerated Sun May 14 00:04:04 COT 2017
     */
    public String getUsuarioRegistro() {
        return usuarioRegistro;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column pataPerro.tm_usuario.usuario_registro
     *
     * @param usuarioRegistro the value for pataPerro.tm_usuario.usuario_registro
     *
     * @mbggenerated Sun May 14 00:04:04 COT 2017
     */
    public void setUsuarioRegistro(String usuarioRegistro) {
        this.usuarioRegistro = usuarioRegistro;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column pataPerro.tm_usuario.fecha_registro
     *
     * @return the value of pataPerro.tm_usuario.fecha_registro
     *
     * @mbggenerated Sun May 14 00:04:04 COT 2017
     */
    public Date getFechaRegistro() {
        return fechaRegistro;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column pataPerro.tm_usuario.fecha_registro
     *
     * @param fechaRegistro the value for pataPerro.tm_usuario.fecha_registro
     *
     * @mbggenerated Sun May 14 00:04:04 COT 2017
     */
    public void setFechaRegistro(Date fechaRegistro) {
        this.fechaRegistro = fechaRegistro;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column pataPerro.tm_usuario.usuario_modifico
     *
     * @return the value of pataPerro.tm_usuario.usuario_modifico
     *
     * @mbggenerated Sun May 14 00:04:04 COT 2017
     */
    public String getUsuarioModifico() {
        return usuarioModifico;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column pataPerro.tm_usuario.usuario_modifico
     *
     * @param usuarioModifico the value for pataPerro.tm_usuario.usuario_modifico
     *
     * @mbggenerated Sun May 14 00:04:04 COT 2017
     */
    public void setUsuarioModifico(String usuarioModifico) {
        this.usuarioModifico = usuarioModifico;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column pataPerro.tm_usuario.fecha_modifico
     *
     * @return the value of pataPerro.tm_usuario.fecha_modifico
     *
     * @mbggenerated Sun May 14 00:04:04 COT 2017
     */
    public Date getFechaModifico() {
        return fechaModifico;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column pataPerro.tm_usuario.fecha_modifico
     *
     * @param fechaModifico the value for pataPerro.tm_usuario.fecha_modifico
     *
     * @mbggenerated Sun May 14 00:04:04 COT 2017
     */
    public void setFechaModifico(Date fechaModifico) {
        this.fechaModifico = fechaModifico;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column pataPerro.tm_usuario.ID_USUARIO_FB
     *
     * @return the value of pataPerro.tm_usuario.ID_USUARIO_FB
     *
     * @mbggenerated Sun May 14 00:04:04 COT 2017
     */
    public String getIdUsuarioFb() {
        return idUsuarioFb;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column pataPerro.tm_usuario.ID_USUARIO_FB
     *
     * @param idUsuarioFb the value for pataPerro.tm_usuario.ID_USUARIO_FB
     *
     * @mbggenerated Sun May 14 00:04:04 COT 2017
     */
    public void setIdUsuarioFb(String idUsuarioFb) {
        this.idUsuarioFb = idUsuarioFb;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column pataPerro.tm_usuario.ID_USUARIO_GO
     *
     * @return the value of pataPerro.tm_usuario.ID_USUARIO_GO
     *
     * @mbggenerated Sun May 14 00:04:04 COT 2017
     */
    public String getIdUsuarioGo() {
        return idUsuarioGo;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column pataPerro.tm_usuario.ID_USUARIO_GO
     *
     * @param idUsuarioGo the value for pataPerro.tm_usuario.ID_USUARIO_GO
     *
     * @mbggenerated Sun May 14 00:04:04 COT 2017
     */
    public void setIdUsuarioGo(String idUsuarioGo) {
        this.idUsuarioGo = idUsuarioGo;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column pataPerro.tm_usuario.ID_USUARIO_TW
     *
     * @return the value of pataPerro.tm_usuario.ID_USUARIO_TW
     *
     * @mbggenerated Sun May 14 00:04:04 COT 2017
     */
    public String getIdUsuarioTw() {
        return idUsuarioTw;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column pataPerro.tm_usuario.ID_USUARIO_TW
     *
     * @param idUsuarioTw the value for pataPerro.tm_usuario.ID_USUARIO_TW
     *
     * @mbggenerated Sun May 14 00:04:04 COT 2017
     */
    public void setIdUsuarioTw(String idUsuarioTw) {
        this.idUsuarioTw = idUsuarioTw;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column pataPerro.tm_usuario.ID_USUARIO_IG
     *
     * @return the value of pataPerro.tm_usuario.ID_USUARIO_IG
     *
     * @mbggenerated Sun May 14 00:04:04 COT 2017
     */
    public String getIdUsuarioIg() {
        return idUsuarioIg;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column pataPerro.tm_usuario.ID_USUARIO_IG
     *
     * @param idUsuarioIg the value for pataPerro.tm_usuario.ID_USUARIO_IG
     *
     * @mbggenerated Sun May 14 00:04:04 COT 2017
     */
    public void setIdUsuarioIg(String idUsuarioIg) {
        this.idUsuarioIg = idUsuarioIg;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pataPerro.tm_usuario
     *
     * @mbggenerated Sun May 14 00:04:04 COT 2017
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
        Usuario other = (Usuario) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getPersonaId() == null ? other.getPersonaId() == null : this.getPersonaId().equals(other.getPersonaId()))
            && (this.getUsuario() == null ? other.getUsuario() == null : this.getUsuario().equals(other.getUsuario()))
            && (this.getPass() == null ? other.getPass() == null : this.getPass().equals(other.getPass()))
            && (this.getEstado() == null ? other.getEstado() == null : this.getEstado().equals(other.getEstado()))
            && (this.getIndAlerta() == null ? other.getIndAlerta() == null : this.getIndAlerta().equals(other.getIndAlerta()))
            && (this.getUsuarioRegistro() == null ? other.getUsuarioRegistro() == null : this.getUsuarioRegistro().equals(other.getUsuarioRegistro()))
            && (this.getFechaRegistro() == null ? other.getFechaRegistro() == null : this.getFechaRegistro().equals(other.getFechaRegistro()))
            && (this.getUsuarioModifico() == null ? other.getUsuarioModifico() == null : this.getUsuarioModifico().equals(other.getUsuarioModifico()))
            && (this.getFechaModifico() == null ? other.getFechaModifico() == null : this.getFechaModifico().equals(other.getFechaModifico()))
            && (this.getIdUsuarioFb() == null ? other.getIdUsuarioFb() == null : this.getIdUsuarioFb().equals(other.getIdUsuarioFb()))
            && (this.getIdUsuarioGo() == null ? other.getIdUsuarioGo() == null : this.getIdUsuarioGo().equals(other.getIdUsuarioGo()))
            && (this.getIdUsuarioTw() == null ? other.getIdUsuarioTw() == null : this.getIdUsuarioTw().equals(other.getIdUsuarioTw()))
            && (this.getIdUsuarioIg() == null ? other.getIdUsuarioIg() == null : this.getIdUsuarioIg().equals(other.getIdUsuarioIg()));
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pataPerro.tm_usuario
     *
     * @mbggenerated Sun May 14 00:04:04 COT 2017
     */
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getPersonaId() == null) ? 0 : getPersonaId().hashCode());
        result = prime * result + ((getUsuario() == null) ? 0 : getUsuario().hashCode());
        result = prime * result + ((getPass() == null) ? 0 : getPass().hashCode());
        result = prime * result + ((getEstado() == null) ? 0 : getEstado().hashCode());
        result = prime * result + ((getIndAlerta() == null) ? 0 : getIndAlerta().hashCode());
        result = prime * result + ((getUsuarioRegistro() == null) ? 0 : getUsuarioRegistro().hashCode());
        result = prime * result + ((getFechaRegistro() == null) ? 0 : getFechaRegistro().hashCode());
        result = prime * result + ((getUsuarioModifico() == null) ? 0 : getUsuarioModifico().hashCode());
        result = prime * result + ((getFechaModifico() == null) ? 0 : getFechaModifico().hashCode());
        result = prime * result + ((getIdUsuarioFb() == null) ? 0 : getIdUsuarioFb().hashCode());
        result = prime * result + ((getIdUsuarioGo() == null) ? 0 : getIdUsuarioGo().hashCode());
        result = prime * result + ((getIdUsuarioTw() == null) ? 0 : getIdUsuarioTw().hashCode());
        result = prime * result + ((getIdUsuarioIg() == null) ? 0 : getIdUsuarioIg().hashCode());
        return result;
    }
    
 /**-Atributos adicionales-**/
    
    private Persona persona;
    private Rol rol;
    private String paswordSinMd5;
    private String accessToken;
    private String rolid;
    private String nombreCompleto;
    private Integer indRegistroMobil;
	private String strMenu;
	private String tipoRs;
	private String emailRs;
	private String isSendMovil;
	
	
	public String getPaswordSinMd5() {
		return paswordSinMd5;
	}

	public void setPaswordSinMd5(String paswordSinMd5) {
		this.paswordSinMd5 = paswordSinMd5;
	}

	public Persona getPersona() {
		return persona;
	}

	public void setPersona(Persona persona) {
		this.persona = persona;
	}

	public Rol getRol() {
		return rol;
	}

	public void setRol(Rol rol) {
		this.rol = rol;
	}

	public String getAccessToken() {
		return accessToken;
	}

	public void setAccessToken(String accessToken) {
		this.accessToken = accessToken;
	}

	public String getRolid() {
		return rolid;
	}

	public void setRolid(String rolid) {
		this.rolid = rolid;
	}

	public String getNombreCompleto() {
		return nombreCompleto;
	}

	public void setNombreCompleto(String nombreCompleto) {
		this.nombreCompleto = nombreCompleto;
	}

	public Integer getIndRegistroMobil() {
		return indRegistroMobil;
	}

	public void setIndRegistroMobil(Integer indRegistroMobil) {
		this.indRegistroMobil = indRegistroMobil;
	}

	public String getStrMenu() {
		return strMenu;
	}

	public void setStrMenu(String strMenu) {
		this.strMenu = strMenu;
	}

	public String getTipoRs() {
		return tipoRs;
	}

	public void setTipoRs(String tipoRs) {
		this.tipoRs = tipoRs;
	}

	public String getEmailRs() {
		return emailRs;
	}

	public void setEmailRs(String emailRs) {
		this.emailRs = emailRs;
	}

	public String getIsSendMovil() {
		return isSendMovil;
	}

	public void setIsSendMovil(String isSendMovil) {
		this.isSendMovil = isSendMovil;
	}
	
}