package pe.com.pdp.domain.postgres;

public class EncontradoFoto {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pataPerro.td_encontrado_foto.id
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    private Integer id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pataPerro.td_encontrado_foto.encontrado_id
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    private Integer encontradoId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column pataPerro.td_encontrado_foto.foto
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    private String foto;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column pataPerro.td_encontrado_foto.id
     *
     * @return the value of pataPerro.td_encontrado_foto.id
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column pataPerro.td_encontrado_foto.id
     *
     * @param id the value for pataPerro.td_encontrado_foto.id
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column pataPerro.td_encontrado_foto.encontrado_id
     *
     * @return the value of pataPerro.td_encontrado_foto.encontrado_id
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    public Integer getEncontradoId() {
        return encontradoId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column pataPerro.td_encontrado_foto.encontrado_id
     *
     * @param encontradoId the value for pataPerro.td_encontrado_foto.encontrado_id
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    public void setEncontradoId(Integer encontradoId) {
        this.encontradoId = encontradoId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column pataPerro.td_encontrado_foto.foto
     *
     * @return the value of pataPerro.td_encontrado_foto.foto
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    public String getFoto() {
        return foto;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column pataPerro.td_encontrado_foto.foto
     *
     * @param foto the value for pataPerro.td_encontrado_foto.foto
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    public void setFoto(String foto) {
        this.foto = foto;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pataPerro.td_encontrado_foto
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
        EncontradoFoto other = (EncontradoFoto) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getEncontradoId() == null ? other.getEncontradoId() == null : this.getEncontradoId().equals(other.getEncontradoId()))
            && (this.getFoto() == null ? other.getFoto() == null : this.getFoto().equals(other.getFoto()));
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pataPerro.td_encontrado_foto
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getEncontradoId() == null) ? 0 : getEncontradoId().hashCode());
        result = prime * result + ((getFoto() == null) ? 0 : getFoto().hashCode());
        return result;
    }
}