package pe.com.pdp.domain.postgres;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class AnuncioCriteria {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table pataPerro.tm_anuncio
     *
     * @mbg.generated Sun May 07 17:02:54 COT 2017
     */
    protected String orderByClause;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table pataPerro.tm_anuncio
     *
     * @mbg.generated Sun May 07 17:02:54 COT 2017
     */
    protected boolean distinct;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table pataPerro.tm_anuncio
     *
     * @mbg.generated Sun May 07 17:02:54 COT 2017
     */
    protected List<Criteria> oredCriteria;

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pataPerro.tm_anuncio
     *
     * @mbg.generated Sun May 07 17:02:54 COT 2017
     */
    public AnuncioCriteria() {
        oredCriteria = new ArrayList<Criteria>();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pataPerro.tm_anuncio
     *
     * @mbg.generated Sun May 07 17:02:54 COT 2017
     */
    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pataPerro.tm_anuncio
     *
     * @mbg.generated Sun May 07 17:02:54 COT 2017
     */
    public String getOrderByClause() {
        return orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pataPerro.tm_anuncio
     *
     * @mbg.generated Sun May 07 17:02:54 COT 2017
     */
    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pataPerro.tm_anuncio
     *
     * @mbg.generated Sun May 07 17:02:54 COT 2017
     */
    public boolean isDistinct() {
        return distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pataPerro.tm_anuncio
     *
     * @mbg.generated Sun May 07 17:02:54 COT 2017
     */
    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pataPerro.tm_anuncio
     *
     * @mbg.generated Sun May 07 17:02:54 COT 2017
     */
    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pataPerro.tm_anuncio
     *
     * @mbg.generated Sun May 07 17:02:54 COT 2017
     */
    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pataPerro.tm_anuncio
     *
     * @mbg.generated Sun May 07 17:02:54 COT 2017
     */
    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pataPerro.tm_anuncio
     *
     * @mbg.generated Sun May 07 17:02:54 COT 2017
     */
    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pataPerro.tm_anuncio
     *
     * @mbg.generated Sun May 07 17:02:54 COT 2017
     */
    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table pataPerro.tm_anuncio
     *
     * @mbg.generated Sun May 07 17:02:54 COT 2017
     */
    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("\"id\" is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("\"id\" is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("\"id\" =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("\"id\" <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("\"id\" >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("\"id\" >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("\"id\" <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("\"id\" <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("\"id\" in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("\"id\" not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("\"id\" between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("\"id\" not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andTipoAnuncioIsNull() {
            addCriterion("\"tipo_anuncio\" is null");
            return (Criteria) this;
        }

        public Criteria andTipoAnuncioIsNotNull() {
            addCriterion("\"tipo_anuncio\" is not null");
            return (Criteria) this;
        }

        public Criteria andTipoAnuncioEqualTo(Integer value) {
            addCriterion("\"tipo_anuncio\" =", value, "tipoAnuncio");
            return (Criteria) this;
        }

        public Criteria andTipoAnuncioNotEqualTo(Integer value) {
            addCriterion("\"tipo_anuncio\" <>", value, "tipoAnuncio");
            return (Criteria) this;
        }

        public Criteria andTipoAnuncioGreaterThan(Integer value) {
            addCriterion("\"tipo_anuncio\" >", value, "tipoAnuncio");
            return (Criteria) this;
        }

        public Criteria andTipoAnuncioGreaterThanOrEqualTo(Integer value) {
            addCriterion("\"tipo_anuncio\" >=", value, "tipoAnuncio");
            return (Criteria) this;
        }

        public Criteria andTipoAnuncioLessThan(Integer value) {
            addCriterion("\"tipo_anuncio\" <", value, "tipoAnuncio");
            return (Criteria) this;
        }

        public Criteria andTipoAnuncioLessThanOrEqualTo(Integer value) {
            addCriterion("\"tipo_anuncio\" <=", value, "tipoAnuncio");
            return (Criteria) this;
        }

        public Criteria andTipoAnuncioIn(List<Integer> values) {
            addCriterion("\"tipo_anuncio\" in", values, "tipoAnuncio");
            return (Criteria) this;
        }

        public Criteria andTipoAnuncioNotIn(List<Integer> values) {
            addCriterion("\"tipo_anuncio\" not in", values, "tipoAnuncio");
            return (Criteria) this;
        }

        public Criteria andTipoAnuncioBetween(Integer value1, Integer value2) {
            addCriterion("\"tipo_anuncio\" between", value1, value2, "tipoAnuncio");
            return (Criteria) this;
        }

        public Criteria andTipoAnuncioNotBetween(Integer value1, Integer value2) {
            addCriterion("\"tipo_anuncio\" not between", value1, value2, "tipoAnuncio");
            return (Criteria) this;
        }

        public Criteria andDescripcionIsNull() {
            addCriterion("\"descripcion\" is null");
            return (Criteria) this;
        }

        public Criteria andDescripcionIsNotNull() {
            addCriterion("\"descripcion\" is not null");
            return (Criteria) this;
        }

        public Criteria andDescripcionEqualTo(String value) {
            addCriterion("\"descripcion\" =", value, "descripcion");
            return (Criteria) this;
        }

        public Criteria andDescripcionNotEqualTo(String value) {
            addCriterion("\"descripcion\" <>", value, "descripcion");
            return (Criteria) this;
        }

        public Criteria andDescripcionGreaterThan(String value) {
            addCriterion("\"descripcion\" >", value, "descripcion");
            return (Criteria) this;
        }

        public Criteria andDescripcionGreaterThanOrEqualTo(String value) {
            addCriterion("\"descripcion\" >=", value, "descripcion");
            return (Criteria) this;
        }

        public Criteria andDescripcionLessThan(String value) {
            addCriterion("\"descripcion\" <", value, "descripcion");
            return (Criteria) this;
        }

        public Criteria andDescripcionLessThanOrEqualTo(String value) {
            addCriterion("\"descripcion\" <=", value, "descripcion");
            return (Criteria) this;
        }

        public Criteria andDescripcionLike(String value) {
            addCriterion("\"descripcion\" like", value, "descripcion");
            return (Criteria) this;
        }

        public Criteria andDescripcionNotLike(String value) {
            addCriterion("\"descripcion\" not like", value, "descripcion");
            return (Criteria) this;
        }

        public Criteria andDescripcionIn(List<String> values) {
            addCriterion("\"descripcion\" in", values, "descripcion");
            return (Criteria) this;
        }

        public Criteria andDescripcionNotIn(List<String> values) {
            addCriterion("\"descripcion\" not in", values, "descripcion");
            return (Criteria) this;
        }

        public Criteria andDescripcionBetween(String value1, String value2) {
            addCriterion("\"descripcion\" between", value1, value2, "descripcion");
            return (Criteria) this;
        }

        public Criteria andDescripcionNotBetween(String value1, String value2) {
            addCriterion("\"descripcion\" not between", value1, value2, "descripcion");
            return (Criteria) this;
        }

        public Criteria andFechaAnuncioIsNull() {
            addCriterion("\"fecha_anuncio\" is null");
            return (Criteria) this;
        }

        public Criteria andFechaAnuncioIsNotNull() {
            addCriterion("\"fecha_anuncio\" is not null");
            return (Criteria) this;
        }

        public Criteria andFechaAnuncioEqualTo(Date value) {
            addCriterion("\"fecha_anuncio\" =", value, "fechaAnuncio");
            return (Criteria) this;
        }

        public Criteria andFechaAnuncioNotEqualTo(Date value) {
            addCriterion("\"fecha_anuncio\" <>", value, "fechaAnuncio");
            return (Criteria) this;
        }

        public Criteria andFechaAnuncioGreaterThan(Date value) {
            addCriterion("\"fecha_anuncio\" >", value, "fechaAnuncio");
            return (Criteria) this;
        }

        public Criteria andFechaAnuncioGreaterThanOrEqualTo(Date value) {
            addCriterion("\"fecha_anuncio\" >=", value, "fechaAnuncio");
            return (Criteria) this;
        }

        public Criteria andFechaAnuncioLessThan(Date value) {
            addCriterion("\"fecha_anuncio\" <", value, "fechaAnuncio");
            return (Criteria) this;
        }

        public Criteria andFechaAnuncioLessThanOrEqualTo(Date value) {
            addCriterion("\"fecha_anuncio\" <=", value, "fechaAnuncio");
            return (Criteria) this;
        }

        public Criteria andFechaAnuncioIn(List<Date> values) {
            addCriterion("\"fecha_anuncio\" in", values, "fechaAnuncio");
            return (Criteria) this;
        }

        public Criteria andFechaAnuncioNotIn(List<Date> values) {
            addCriterion("\"fecha_anuncio\" not in", values, "fechaAnuncio");
            return (Criteria) this;
        }

        public Criteria andFechaAnuncioBetween(Date value1, Date value2) {
            addCriterion("\"fecha_anuncio\" between", value1, value2, "fechaAnuncio");
            return (Criteria) this;
        }

        public Criteria andFechaAnuncioNotBetween(Date value1, Date value2) {
            addCriterion("\"fecha_anuncio\" not between", value1, value2, "fechaAnuncio");
            return (Criteria) this;
        }

        public Criteria andFechaVencimientoIsNull() {
            addCriterion("\"fecha_vencimiento\" is null");
            return (Criteria) this;
        }

        public Criteria andFechaVencimientoIsNotNull() {
            addCriterion("\"fecha_vencimiento\" is not null");
            return (Criteria) this;
        }

        public Criteria andFechaVencimientoEqualTo(Date value) {
            addCriterion("\"fecha_vencimiento\" =", value, "fechaVencimiento");
            return (Criteria) this;
        }

        public Criteria andFechaVencimientoNotEqualTo(Date value) {
            addCriterion("\"fecha_vencimiento\" <>", value, "fechaVencimiento");
            return (Criteria) this;
        }

        public Criteria andFechaVencimientoGreaterThan(Date value) {
            addCriterion("\"fecha_vencimiento\" >", value, "fechaVencimiento");
            return (Criteria) this;
        }

        public Criteria andFechaVencimientoGreaterThanOrEqualTo(Date value) {
            addCriterion("\"fecha_vencimiento\" >=", value, "fechaVencimiento");
            return (Criteria) this;
        }

        public Criteria andFechaVencimientoLessThan(Date value) {
            addCriterion("\"fecha_vencimiento\" <", value, "fechaVencimiento");
            return (Criteria) this;
        }

        public Criteria andFechaVencimientoLessThanOrEqualTo(Date value) {
            addCriterion("\"fecha_vencimiento\" <=", value, "fechaVencimiento");
            return (Criteria) this;
        }

        public Criteria andFechaVencimientoIn(List<Date> values) {
            addCriterion("\"fecha_vencimiento\" in", values, "fechaVencimiento");
            return (Criteria) this;
        }

        public Criteria andFechaVencimientoNotIn(List<Date> values) {
            addCriterion("\"fecha_vencimiento\" not in", values, "fechaVencimiento");
            return (Criteria) this;
        }

        public Criteria andFechaVencimientoBetween(Date value1, Date value2) {
            addCriterion("\"fecha_vencimiento\" between", value1, value2, "fechaVencimiento");
            return (Criteria) this;
        }

        public Criteria andFechaVencimientoNotBetween(Date value1, Date value2) {
            addCriterion("\"fecha_vencimiento\" not between", value1, value2, "fechaVencimiento");
            return (Criteria) this;
        }

        public Criteria andFotoIsNull() {
            addCriterion("\"foto\" is null");
            return (Criteria) this;
        }

        public Criteria andFotoIsNotNull() {
            addCriterion("\"foto\" is not null");
            return (Criteria) this;
        }

        public Criteria andFotoEqualTo(String value) {
            addCriterion("\"foto\" =", value, "foto");
            return (Criteria) this;
        }

        public Criteria andFotoNotEqualTo(String value) {
            addCriterion("\"foto\" <>", value, "foto");
            return (Criteria) this;
        }

        public Criteria andFotoGreaterThan(String value) {
            addCriterion("\"foto\" >", value, "foto");
            return (Criteria) this;
        }

        public Criteria andFotoGreaterThanOrEqualTo(String value) {
            addCriterion("\"foto\" >=", value, "foto");
            return (Criteria) this;
        }

        public Criteria andFotoLessThan(String value) {
            addCriterion("\"foto\" <", value, "foto");
            return (Criteria) this;
        }

        public Criteria andFotoLessThanOrEqualTo(String value) {
            addCriterion("\"foto\" <=", value, "foto");
            return (Criteria) this;
        }

        public Criteria andFotoLike(String value) {
            addCriterion("\"foto\" like", value, "foto");
            return (Criteria) this;
        }

        public Criteria andFotoNotLike(String value) {
            addCriterion("\"foto\" not like", value, "foto");
            return (Criteria) this;
        }

        public Criteria andFotoIn(List<String> values) {
            addCriterion("\"foto\" in", values, "foto");
            return (Criteria) this;
        }

        public Criteria andFotoNotIn(List<String> values) {
            addCriterion("\"foto\" not in", values, "foto");
            return (Criteria) this;
        }

        public Criteria andFotoBetween(String value1, String value2) {
            addCriterion("\"foto\" between", value1, value2, "foto");
            return (Criteria) this;
        }

        public Criteria andFotoNotBetween(String value1, String value2) {
            addCriterion("\"foto\" not between", value1, value2, "foto");
            return (Criteria) this;
        }

        public Criteria andTituloIsNull() {
            addCriterion("\"titulo\" is null");
            return (Criteria) this;
        }

        public Criteria andTituloIsNotNull() {
            addCriterion("\"titulo\" is not null");
            return (Criteria) this;
        }

        public Criteria andTituloEqualTo(String value) {
            addCriterion("\"titulo\" =", value, "titulo");
            return (Criteria) this;
        }

        public Criteria andTituloNotEqualTo(String value) {
            addCriterion("\"titulo\" <>", value, "titulo");
            return (Criteria) this;
        }

        public Criteria andTituloGreaterThan(String value) {
            addCriterion("\"titulo\" >", value, "titulo");
            return (Criteria) this;
        }

        public Criteria andTituloGreaterThanOrEqualTo(String value) {
            addCriterion("\"titulo\" >=", value, "titulo");
            return (Criteria) this;
        }

        public Criteria andTituloLessThan(String value) {
            addCriterion("\"titulo\" <", value, "titulo");
            return (Criteria) this;
        }

        public Criteria andTituloLessThanOrEqualTo(String value) {
            addCriterion("\"titulo\" <=", value, "titulo");
            return (Criteria) this;
        }

        public Criteria andTituloLike(String value) {
            addCriterion("\"titulo\" like", value, "titulo");
            return (Criteria) this;
        }

        public Criteria andTituloNotLike(String value) {
            addCriterion("\"titulo\" not like", value, "titulo");
            return (Criteria) this;
        }

        public Criteria andTituloIn(List<String> values) {
            addCriterion("\"titulo\" in", values, "titulo");
            return (Criteria) this;
        }

        public Criteria andTituloNotIn(List<String> values) {
            addCriterion("\"titulo\" not in", values, "titulo");
            return (Criteria) this;
        }

        public Criteria andTituloBetween(String value1, String value2) {
            addCriterion("\"titulo\" between", value1, value2, "titulo");
            return (Criteria) this;
        }

        public Criteria andTituloNotBetween(String value1, String value2) {
            addCriterion("\"titulo\" not between", value1, value2, "titulo");
            return (Criteria) this;
        }

        public Criteria andEstaooIsNull() {
            addCriterion("\"estaoo\" is null");
            return (Criteria) this;
        }

        public Criteria andEstaooIsNotNull() {
            addCriterion("\"estaoo\" is not null");
            return (Criteria) this;
        }

        public Criteria andEstaooEqualTo(Integer value) {
            addCriterion("\"estaoo\" =", value, "estaoo");
            return (Criteria) this;
        }

        public Criteria andEstaooNotEqualTo(Integer value) {
            addCriterion("\"estaoo\" <>", value, "estaoo");
            return (Criteria) this;
        }

        public Criteria andEstaooGreaterThan(Integer value) {
            addCriterion("\"estaoo\" >", value, "estaoo");
            return (Criteria) this;
        }

        public Criteria andEstaooGreaterThanOrEqualTo(Integer value) {
            addCriterion("\"estaoo\" >=", value, "estaoo");
            return (Criteria) this;
        }

        public Criteria andEstaooLessThan(Integer value) {
            addCriterion("\"estaoo\" <", value, "estaoo");
            return (Criteria) this;
        }

        public Criteria andEstaooLessThanOrEqualTo(Integer value) {
            addCriterion("\"estaoo\" <=", value, "estaoo");
            return (Criteria) this;
        }

        public Criteria andEstaooIn(List<Integer> values) {
            addCriterion("\"estaoo\" in", values, "estaoo");
            return (Criteria) this;
        }

        public Criteria andEstaooNotIn(List<Integer> values) {
            addCriterion("\"estaoo\" not in", values, "estaoo");
            return (Criteria) this;
        }

        public Criteria andEstaooBetween(Integer value1, Integer value2) {
            addCriterion("\"estaoo\" between", value1, value2, "estaoo");
            return (Criteria) this;
        }

        public Criteria andEstaooNotBetween(Integer value1, Integer value2) {
            addCriterion("\"estaoo\" not between", value1, value2, "estaoo");
            return (Criteria) this;
        }

        public Criteria andUsuarioRegistroIsNull() {
            addCriterion("\"usuario_registro\" is null");
            return (Criteria) this;
        }

        public Criteria andUsuarioRegistroIsNotNull() {
            addCriterion("\"usuario_registro\" is not null");
            return (Criteria) this;
        }

        public Criteria andUsuarioRegistroEqualTo(String value) {
            addCriterion("\"usuario_registro\" =", value, "usuarioRegistro");
            return (Criteria) this;
        }

        public Criteria andUsuarioRegistroNotEqualTo(String value) {
            addCriterion("\"usuario_registro\" <>", value, "usuarioRegistro");
            return (Criteria) this;
        }

        public Criteria andUsuarioRegistroGreaterThan(String value) {
            addCriterion("\"usuario_registro\" >", value, "usuarioRegistro");
            return (Criteria) this;
        }

        public Criteria andUsuarioRegistroGreaterThanOrEqualTo(String value) {
            addCriterion("\"usuario_registro\" >=", value, "usuarioRegistro");
            return (Criteria) this;
        }

        public Criteria andUsuarioRegistroLessThan(String value) {
            addCriterion("\"usuario_registro\" <", value, "usuarioRegistro");
            return (Criteria) this;
        }

        public Criteria andUsuarioRegistroLessThanOrEqualTo(String value) {
            addCriterion("\"usuario_registro\" <=", value, "usuarioRegistro");
            return (Criteria) this;
        }

        public Criteria andUsuarioRegistroLike(String value) {
            addCriterion("\"usuario_registro\" like", value, "usuarioRegistro");
            return (Criteria) this;
        }

        public Criteria andUsuarioRegistroNotLike(String value) {
            addCriterion("\"usuario_registro\" not like", value, "usuarioRegistro");
            return (Criteria) this;
        }

        public Criteria andUsuarioRegistroIn(List<String> values) {
            addCriterion("\"usuario_registro\" in", values, "usuarioRegistro");
            return (Criteria) this;
        }

        public Criteria andUsuarioRegistroNotIn(List<String> values) {
            addCriterion("\"usuario_registro\" not in", values, "usuarioRegistro");
            return (Criteria) this;
        }

        public Criteria andUsuarioRegistroBetween(String value1, String value2) {
            addCriterion("\"usuario_registro\" between", value1, value2, "usuarioRegistro");
            return (Criteria) this;
        }

        public Criteria andUsuarioRegistroNotBetween(String value1, String value2) {
            addCriterion("\"usuario_registro\" not between", value1, value2, "usuarioRegistro");
            return (Criteria) this;
        }

        public Criteria andFechaRegistroIsNull() {
            addCriterion("\"fecha_registro\" is null");
            return (Criteria) this;
        }

        public Criteria andFechaRegistroIsNotNull() {
            addCriterion("\"fecha_registro\" is not null");
            return (Criteria) this;
        }

        public Criteria andFechaRegistroEqualTo(Date value) {
            addCriterion("\"fecha_registro\" =", value, "fechaRegistro");
            return (Criteria) this;
        }

        public Criteria andFechaRegistroNotEqualTo(Date value) {
            addCriterion("\"fecha_registro\" <>", value, "fechaRegistro");
            return (Criteria) this;
        }

        public Criteria andFechaRegistroGreaterThan(Date value) {
            addCriterion("\"fecha_registro\" >", value, "fechaRegistro");
            return (Criteria) this;
        }

        public Criteria andFechaRegistroGreaterThanOrEqualTo(Date value) {
            addCriterion("\"fecha_registro\" >=", value, "fechaRegistro");
            return (Criteria) this;
        }

        public Criteria andFechaRegistroLessThan(Date value) {
            addCriterion("\"fecha_registro\" <", value, "fechaRegistro");
            return (Criteria) this;
        }

        public Criteria andFechaRegistroLessThanOrEqualTo(Date value) {
            addCriterion("\"fecha_registro\" <=", value, "fechaRegistro");
            return (Criteria) this;
        }

        public Criteria andFechaRegistroIn(List<Date> values) {
            addCriterion("\"fecha_registro\" in", values, "fechaRegistro");
            return (Criteria) this;
        }

        public Criteria andFechaRegistroNotIn(List<Date> values) {
            addCriterion("\"fecha_registro\" not in", values, "fechaRegistro");
            return (Criteria) this;
        }

        public Criteria andFechaRegistroBetween(Date value1, Date value2) {
            addCriterion("\"fecha_registro\" between", value1, value2, "fechaRegistro");
            return (Criteria) this;
        }

        public Criteria andFechaRegistroNotBetween(Date value1, Date value2) {
            addCriterion("\"fecha_registro\" not between", value1, value2, "fechaRegistro");
            return (Criteria) this;
        }

        public Criteria andUsuarioModificoIsNull() {
            addCriterion("\"usuario_modifico\" is null");
            return (Criteria) this;
        }

        public Criteria andUsuarioModificoIsNotNull() {
            addCriterion("\"usuario_modifico\" is not null");
            return (Criteria) this;
        }

        public Criteria andUsuarioModificoEqualTo(String value) {
            addCriterion("\"usuario_modifico\" =", value, "usuarioModifico");
            return (Criteria) this;
        }

        public Criteria andUsuarioModificoNotEqualTo(String value) {
            addCriterion("\"usuario_modifico\" <>", value, "usuarioModifico");
            return (Criteria) this;
        }

        public Criteria andUsuarioModificoGreaterThan(String value) {
            addCriterion("\"usuario_modifico\" >", value, "usuarioModifico");
            return (Criteria) this;
        }

        public Criteria andUsuarioModificoGreaterThanOrEqualTo(String value) {
            addCriterion("\"usuario_modifico\" >=", value, "usuarioModifico");
            return (Criteria) this;
        }

        public Criteria andUsuarioModificoLessThan(String value) {
            addCriterion("\"usuario_modifico\" <", value, "usuarioModifico");
            return (Criteria) this;
        }

        public Criteria andUsuarioModificoLessThanOrEqualTo(String value) {
            addCriterion("\"usuario_modifico\" <=", value, "usuarioModifico");
            return (Criteria) this;
        }

        public Criteria andUsuarioModificoLike(String value) {
            addCriterion("\"usuario_modifico\" like", value, "usuarioModifico");
            return (Criteria) this;
        }

        public Criteria andUsuarioModificoNotLike(String value) {
            addCriterion("\"usuario_modifico\" not like", value, "usuarioModifico");
            return (Criteria) this;
        }

        public Criteria andUsuarioModificoIn(List<String> values) {
            addCriterion("\"usuario_modifico\" in", values, "usuarioModifico");
            return (Criteria) this;
        }

        public Criteria andUsuarioModificoNotIn(List<String> values) {
            addCriterion("\"usuario_modifico\" not in", values, "usuarioModifico");
            return (Criteria) this;
        }

        public Criteria andUsuarioModificoBetween(String value1, String value2) {
            addCriterion("\"usuario_modifico\" between", value1, value2, "usuarioModifico");
            return (Criteria) this;
        }

        public Criteria andUsuarioModificoNotBetween(String value1, String value2) {
            addCriterion("\"usuario_modifico\" not between", value1, value2, "usuarioModifico");
            return (Criteria) this;
        }

        public Criteria andFechaModificoIsNull() {
            addCriterion("\"fecha_modifico\" is null");
            return (Criteria) this;
        }

        public Criteria andFechaModificoIsNotNull() {
            addCriterion("\"fecha_modifico\" is not null");
            return (Criteria) this;
        }

        public Criteria andFechaModificoEqualTo(Date value) {
            addCriterion("\"fecha_modifico\" =", value, "fechaModifico");
            return (Criteria) this;
        }

        public Criteria andFechaModificoNotEqualTo(Date value) {
            addCriterion("\"fecha_modifico\" <>", value, "fechaModifico");
            return (Criteria) this;
        }

        public Criteria andFechaModificoGreaterThan(Date value) {
            addCriterion("\"fecha_modifico\" >", value, "fechaModifico");
            return (Criteria) this;
        }

        public Criteria andFechaModificoGreaterThanOrEqualTo(Date value) {
            addCriterion("\"fecha_modifico\" >=", value, "fechaModifico");
            return (Criteria) this;
        }

        public Criteria andFechaModificoLessThan(Date value) {
            addCriterion("\"fecha_modifico\" <", value, "fechaModifico");
            return (Criteria) this;
        }

        public Criteria andFechaModificoLessThanOrEqualTo(Date value) {
            addCriterion("\"fecha_modifico\" <=", value, "fechaModifico");
            return (Criteria) this;
        }

        public Criteria andFechaModificoIn(List<Date> values) {
            addCriterion("\"fecha_modifico\" in", values, "fechaModifico");
            return (Criteria) this;
        }

        public Criteria andFechaModificoNotIn(List<Date> values) {
            addCriterion("\"fecha_modifico\" not in", values, "fechaModifico");
            return (Criteria) this;
        }

        public Criteria andFechaModificoBetween(Date value1, Date value2) {
            addCriterion("\"fecha_modifico\" between", value1, value2, "fechaModifico");
            return (Criteria) this;
        }

        public Criteria andFechaModificoNotBetween(Date value1, Date value2) {
            addCriterion("\"fecha_modifico\" not between", value1, value2, "fechaModifico");
            return (Criteria) this;
        }

        public Criteria andDistritoIsNull() {
            addCriterion("\"distrito\" is null");
            return (Criteria) this;
        }

        public Criteria andDistritoIsNotNull() {
            addCriterion("\"distrito\" is not null");
            return (Criteria) this;
        }

        public Criteria andDistritoEqualTo(Integer value) {
            addCriterion("\"distrito\" =", value, "distrito");
            return (Criteria) this;
        }

        public Criteria andDistritoNotEqualTo(Integer value) {
            addCriterion("\"distrito\" <>", value, "distrito");
            return (Criteria) this;
        }

        public Criteria andDistritoGreaterThan(Integer value) {
            addCriterion("\"distrito\" >", value, "distrito");
            return (Criteria) this;
        }

        public Criteria andDistritoGreaterThanOrEqualTo(Integer value) {
            addCriterion("\"distrito\" >=", value, "distrito");
            return (Criteria) this;
        }

        public Criteria andDistritoLessThan(Integer value) {
            addCriterion("\"distrito\" <", value, "distrito");
            return (Criteria) this;
        }

        public Criteria andDistritoLessThanOrEqualTo(Integer value) {
            addCriterion("\"distrito\" <=", value, "distrito");
            return (Criteria) this;
        }

        public Criteria andDistritoIn(List<Integer> values) {
            addCriterion("\"distrito\" in", values, "distrito");
            return (Criteria) this;
        }

        public Criteria andDistritoNotIn(List<Integer> values) {
            addCriterion("\"distrito\" not in", values, "distrito");
            return (Criteria) this;
        }

        public Criteria andDistritoBetween(Integer value1, Integer value2) {
            addCriterion("\"distrito\" between", value1, value2, "distrito");
            return (Criteria) this;
        }

        public Criteria andDistritoNotBetween(Integer value1, Integer value2) {
            addCriterion("\"distrito\" not between", value1, value2, "distrito");
            return (Criteria) this;
        }

        public Criteria andDescripcionLikeInsensitive(String value) {
            addCriterion("upper(\"descripcion\") like", value.toUpperCase(), "descripcion");
            return (Criteria) this;
        }

        public Criteria andFotoLikeInsensitive(String value) {
            addCriterion("upper(\"foto\") like", value.toUpperCase(), "foto");
            return (Criteria) this;
        }

        public Criteria andTituloLikeInsensitive(String value) {
            addCriterion("upper(\"titulo\") like", value.toUpperCase(), "titulo");
            return (Criteria) this;
        }

        public Criteria andUsuarioRegistroLikeInsensitive(String value) {
            addCriterion("upper(\"usuario_registro\") like", value.toUpperCase(), "usuarioRegistro");
            return (Criteria) this;
        }

        public Criteria andUsuarioModificoLikeInsensitive(String value) {
            addCriterion("upper(\"usuario_modifico\") like", value.toUpperCase(), "usuarioModifico");
            return (Criteria) this;
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table pataPerro.tm_anuncio
     *
     * @mbg.generated do_not_delete_during_merge Sun May 07 17:02:54 COT 2017
     */
    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table pataPerro.tm_anuncio
     *
     * @mbg.generated Sun May 07 17:02:54 COT 2017
     */
    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}