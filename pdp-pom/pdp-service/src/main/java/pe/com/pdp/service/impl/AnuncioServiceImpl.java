package pe.com.pdp.service.impl;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import pe.com.pdp.Constante;
import pe.com.pdp.FileUtil;
import pe.com.pdp.dao.postgres.AnuncioMapper;
import pe.com.pdp.dao.postgres.UbigeoMapper;
import pe.com.pdp.domain.postgres.Anuncio;
import pe.com.pdp.domain.postgres.AnuncioCriteria;
import pe.com.pdp.domain.postgres.AnuncioCriteria.Criteria;
import pe.com.pdp.domain.postgres.Usuario;
import pe.com.pdp.service.AnuncioService;

@Service
public class AnuncioServiceImpl implements AnuncioService {

	@Autowired
	private AnuncioMapper anuncioMapper;
	
	@Autowired
	private UbigeoMapper UbigeoMapper;
	
	
	public List<Anuncio> listarAnuncios(Anuncio anuncio) {
		// TODO Auto-generated method stub
		AnuncioCriteria ac = new AnuncioCriteria();
		
		Criteria criteria = ac.createCriteria();
		
		criteria
				.andEstaooEqualTo(Constante.ESTADO_ACTIVO)
				.andFechaVencimientoGreaterThanOrEqualTo(new Date());
		
		if(anuncio != null && anuncio.getTitulo() != null){
			criteria.andTituloLikeInsensitive("%"+anuncio.getTitulo()+"%");
		}
		
		if(anuncio != null && anuncio.getDistrito() != null){
			criteria.andDistritoEqualTo(anuncio.getDistrito());
		}
		
		ac.setOrderByClause(" \"fecha_anuncio\" desc");
		
		return anuncioMapper.selectByExample(ac);
	}



	
	public List<Map<String, Object>> findListaAnuncion(Anuncio anuncio) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object>parametros=new HashMap<String, Object>();
		
		if(anuncio.getId()!=null ){
			parametros.put("ANUNCIO_ID",  anuncio.getId() );
		}
		if(anuncio.getTitulo()!=null && anuncio.getTitulo().trim().length()>0){
			parametros.put("TITULO", anuncio.getTitulo().toUpperCase());
		}
		
		if(anuncio.getDistrito()!=null ){
			parametros.put("DISTRITO", anuncio.getDistrito());
		}
		
		if(anuncio.getTipoAnuncio()!=null &&  !anuncio.getTipoAnuncio().equals(Constante.NUMERO_CERO)){
			parametros.put("TIPO_ANUNCIO",  anuncio.getTipoAnuncio());
		 }
			 
		if(anuncio.getStart()!=null){
			parametros.put("INICIO_PAG", anuncio.getStart().intValue());
		}else{
			parametros.put("INICIO_PAG", Constante.NUMERO_CERO);
		}
		
		
		return anuncioMapper.selectByAnuncio(parametros);
	}

	
	public int countAnuncios(Anuncio anuncio) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object>parametros=new HashMap<String, Object>();
		if(anuncio.getId()!=null ){
			parametros.put("ANUNCIO_ID",  anuncio.getId() );
		}
		if(anuncio.getTitulo()!=null && anuncio.getTitulo().trim().length()>0){
			parametros.put("TITULO", anuncio.getTitulo().toUpperCase());
		}
		
		if(anuncio.getTipoAnuncio()!=null &&  !anuncio.getTipoAnuncio().equals(Constante.NUMERO_CERO)){
			parametros.put("TIPO_ANUNCIO",  anuncio.getTipoAnuncio());
		 }
			 
		if(anuncio.getDistrito()!=null ){
			parametros.put("DISTRITO", anuncio.getDistrito());
		}
		return anuncioMapper.countAnuncios(parametros);
	}

	
	public int countTotalAnuncios() throws Exception {
		// TODO Auto-generated method stub
		
		AnuncioCriteria anuncioCriteria=new AnuncioCriteria();
		
		Long cantidad=anuncioMapper.countByExample(anuncioCriteria);
		return cantidad.intValue();
	}

	
	public void disabledAnuncio(Integer idAnuncio, Integer idActivacion) throws Exception {
		// TODO Auto-generated method stub
		
	}

	
	public Anuncio findAnuncioByPK(Integer idAnuncio) throws Exception {
		// TODO Auto-generated method stub
		Anuncio anuncio=anuncioMapper.selectByPrimaryKey(idAnuncio);

		anuncio.setUbigeo(UbigeoMapper.selectByPrimaryKey(anuncio.getDistrito()));
		
		return anuncio ;
	}

	
	@Transactional(propagation =Propagation.REQUIRES_NEW,readOnly = false,rollbackFor = Exception.class)
	public Anuncio save(Anuncio anuncio, Usuario usuario) throws Exception {
		
		if(anuncio.getId()!=null){
			anuncio.setFechaModifico(new Date());
			anuncio.setUsuarioModifico(usuario.getUsuario());
			anuncioMapper.updateByPrimaryKeySelective(anuncio);
			
			
		}else{
			anuncio.setFechaRegistro(new Date());
			anuncio.setUsuarioRegistro(usuario.getUsuario());
			
			anuncioMapper.insertSelective(anuncio);
		}
		
		
		if(anuncio.getFileFoto() != null){
			
			String node = "anuncio/"+anuncio.getId();
			
			String path = Constante.PATH_UPLOADS+node+"/";
			
			File directorio = new File(path);
			
			if(!directorio.exists()){
				directorio.mkdirs();
			}
			
			MultipartFile fileFoto = anuncio.getFileFoto();
			
			String fileName = fileFoto.getOriginalFilename();
			if(fileName.trim().length()>1){			
			try{
			 FileUtil.guardarFileInPath(fileFoto.getBytes(), fileName, path);
			}catch (Exception e) {
				// TODO: handle exception
			}
			anuncio.setFoto("images/"+node+"/"+fileName);
			anuncioMapper.updateByPrimaryKeySelective(anuncio);
			}

			anuncio.setFileFoto(null);

		}
		
		return anuncio;
	}

}
