package pe.com.pdp.dao.postgres;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import pe.com.pdp.domain.postgres.Opcion;
import pe.com.pdp.domain.postgres.OpcionCriteria;

public interface OpcionMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pataPerro.tm_opcion
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    long countByExample(OpcionCriteria example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pataPerro.tm_opcion
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    int deleteByExample(OpcionCriteria example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pataPerro.tm_opcion
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pataPerro.tm_opcion
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    int insert(Opcion record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pataPerro.tm_opcion
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    int insertSelective(Opcion record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pataPerro.tm_opcion
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    List<Opcion> selectByExample(OpcionCriteria example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pataPerro.tm_opcion
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    Opcion selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pataPerro.tm_opcion
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    int updateByExampleSelective(@Param("record") Opcion record, @Param("example") OpcionCriteria example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pataPerro.tm_opcion
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    int updateByExample(@Param("record") Opcion record, @Param("example") OpcionCriteria example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pataPerro.tm_opcion
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    int updateByPrimaryKeySelective(Opcion record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pataPerro.tm_opcion
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    int updateByPrimaryKey(Opcion record);
    
    /*Metodos Adicionales*/
  	List<Map<String, Object>> selectByOpcion( Map<String, Object>  parametros);
  	int nroMaxOpcion( Map<String, Object>  parametros);
  	int selectCountByOpcion(Map<String, Object>  parametros);
}