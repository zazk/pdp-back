package pe.com.pdp.dao.postgres;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import pe.com.pdp.domain.postgres.Elemento;
import pe.com.pdp.domain.postgres.ElementoCriteria;

public interface ElementoMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pataPerro.tm_elemento
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    long countByExample(ElementoCriteria example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pataPerro.tm_elemento
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    int deleteByExample(ElementoCriteria example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pataPerro.tm_elemento
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pataPerro.tm_elemento
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    int insert(Elemento record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pataPerro.tm_elemento
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    int insertSelective(Elemento record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pataPerro.tm_elemento
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    List<Elemento> selectByExample(ElementoCriteria example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pataPerro.tm_elemento
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    Elemento selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pataPerro.tm_elemento
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    int updateByExampleSelective(@Param("record") Elemento record, @Param("example") ElementoCriteria example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pataPerro.tm_elemento
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    int updateByExample(@Param("record") Elemento record, @Param("example") ElementoCriteria example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pataPerro.tm_elemento
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    int updateByPrimaryKeySelective(Elemento record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table pataPerro.tm_elemento
     *
     * @mbg.generated Thu Mar 16 14:09:49 COT 2017
     */
    int updateByPrimaryKey(Elemento record);
    
    /**Metodos Adicionales**/
    List<Map<String, Object>> selectByElemento( Map<String, Object>  parametros);
	int countElemento(Map<String, Object>  parametros);
}