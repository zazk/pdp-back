package pe.com.pdp.service.impl;

import java.io.File;
import java.util.ArrayList;
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
import pe.com.pdp.dao.postgres.NegocioCategoriaMapper;
import pe.com.pdp.dao.postgres.NegocioMapper;
import pe.com.pdp.domain.postgres.Negocio;
import pe.com.pdp.domain.postgres.NegocioCategoria;
import pe.com.pdp.domain.postgres.NegocioCategoriaCriteria;
import pe.com.pdp.domain.postgres.NegocioCriteria;
import pe.com.pdp.domain.postgres.Notificacion;
import pe.com.pdp.domain.postgres.Usuario;
import pe.com.pdp.service.NegocioService;
import pe.com.pdp.service.NotificacionService;

@Service
public class NegocioServiceImpl implements NegocioService {

	@Autowired
	private NegocioMapper negocioMapper;
	
	@Autowired
	private NegocioCategoriaMapper negocioCategoriaMapper;
	
	@Autowired
	private NotificacionService notificacionService;
	
	

	public List<Map<String, Object>> findListaNegocio(Negocio negocio) throws Exception {
		// TODO Auto-generated method stub
		
		Map<String, Object>parametros=new HashMap<String, Object>();
		
		if(negocio != null){
			
			if(negocio.getEstado()!=null ){
				parametros.put("ESTADO",  negocio.getEstado() );
			}
			
			
			if(negocio.getId()!=null ){
				parametros.put("NEGOCIO_ID",  negocio.getId() );
			}
			
			if(negocio.getTitulo()!=null && negocio.getTitulo().trim().length()>0){
				parametros.put("TITULO", negocio.getTitulo().toUpperCase());
			}
			
			if(negocio.getListCategoriasNegocio()!=null && negocio.getListCategoriasNegocio().size()>0){
				List<Integer> listIdCategoria=new ArrayList<Integer>();
				
				for (NegocioCategoria negociCategoria : negocio.getListCategoriasNegocio()) {
					listIdCategoria.add(negociCategoria.getCategoriaId());
				}
				parametros.put("TIPOS_NEGOCIO",  listIdCategoria);
			 }
				 
			if(negocio.getStart()!=null){
				parametros.put("INICIO_PAG", negocio.getStart().intValue());
			}
		}
		
		
		List<Map<String, Object>> list = negocioMapper.selectByNegocio(parametros);
		
		if(list!= null){
			NegocioCategoriaCriteria ncc = null;
			Integer id = null;
			for (Map<String, Object> map : list) {
				ncc = new NegocioCategoriaCriteria();
				ncc.clear();
				id = Integer.parseInt(map.get("id").toString());
				ncc.createCriteria().andNegocioIdEqualTo(id);
				map.put("categorias", negocioCategoriaMapper.selectByExample(ncc));
			}
		}
		
		return list;
	}

	
	public int countNegocios(Negocio negocio) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object>parametros=new HashMap<String, Object>();
		
		if(negocio.getId()!=null ){
			parametros.put("NEGOCIO_ID",  negocio.getId() );
		}
		
		if(negocio.getTitulo()!=null && negocio.getTitulo().trim().length()>0){
			parametros.put("TITULO", negocio.getTitulo().toUpperCase());
		}
		
		if(negocio.getListCategoriasNegocio()!=null && negocio.getListCategoriasNegocio().size()>0){
			List<Integer> listIdCategoria=new ArrayList<Integer>();
			
			for (NegocioCategoria negociCategoria : negocio.getListCategoriasNegocio()) {
				listIdCategoria.add(negociCategoria.getCategoriaId());
			}
			parametros.put("TIPOS_NEGOCIO",  listIdCategoria);
		 }
		return negocioMapper.countNegocios(parametros);
	}

	
	public int countTotalNegocios() throws Exception {
		// TODO Auto-generated method stub
		NegocioCriteria negocioCriteria=new NegocioCriteria();
		
		Long cantidad=negocioMapper.countByExample(negocioCriteria);
		return cantidad.intValue();
	}

	
	@Transactional(propagation =Propagation.REQUIRES_NEW,readOnly = false,rollbackFor = Exception.class)
	public void disabledNegocio(Integer idNegocio,Integer idActivacion) throws Exception {
		// TODO Auto-generated method stub
		
		Negocio negocio=new Negocio();
		negocio.setId(idNegocio);
		negocio.setEstado(idActivacion);
		negocioMapper.updateByPrimaryKeySelective(negocio);
		
	}

	
	public Negocio findNegocioByPK(Integer idNegocio) throws Exception {
		// TODO Auto-generated method stub
		Negocio negocio= negocioMapper.selectByPrimaryKey(idNegocio);
		NegocioCategoriaCriteria criteriaNegoCat=new NegocioCategoriaCriteria();
		criteriaNegoCat.createCriteria().andNegocioIdEqualTo(negocio.getId());
		List<NegocioCategoria> listNegocioCategoria=negocioCategoriaMapper.selectByExample(criteriaNegoCat);
		negocio.setListCategoriasNegocio(listNegocioCategoria);
		return negocio;
	}

	
	@Transactional(propagation =Propagation.REQUIRES_NEW,readOnly = false,rollbackFor = Exception.class)
	public Negocio save(Negocio negocio,Usuario usuario) throws Exception {
		// TODO Auto-generated method stub
		
		List<Integer> listNegocioCategoria=negocio.getListNegociaCate();
		NegocioCategoria negocioCategoria=null;
		if(negocio.getId()!=null){
			negocio.setFechaModifico(new Date());
			negocio.setUsuarioModifico(usuario.getUsuario());
			negocioMapper.updateByPrimaryKeySelective(negocio);
		}else{
			negocio.setFechaRegistro(new Date());
//			negocio.setEstado(Constante.ESTADO_INACTIVO);
			if(usuario != null){
				negocio.setUsuarioRegistro(usuario.getUsuario());
			}
			negocioMapper.insertSelective(negocio);
			
		}
		
		
		if(listNegocioCategoria!=null && listNegocioCategoria.size()>0){
				NegocioCategoriaCriteria criteriaNegoCat=new NegocioCategoriaCriteria();
				criteriaNegoCat.createCriteria().andNegocioIdEqualTo(negocio.getId());
				negocioCategoriaMapper.deleteByExample(criteriaNegoCat);
				
			
			for (Integer id : listNegocioCategoria) {
				negocioCategoria=new NegocioCategoria();
				negocioCategoria.setNegocioId(negocio.getId());
				negocioCategoria.setCategoriaId(id);
				negocioCategoriaMapper.insertSelective(negocioCategoria);
			}
		}
		
		
		
		
		if(negocio.getFileFoto() != null ){
			
			String node = "negocio/"+negocio.getId();
			
			String path = Constante.PATH_UPLOADS+node+"/";
			
			File directorio = new File(path);
			
			if(!directorio.exists()){
				directorio.mkdirs();
			}
			
			MultipartFile fileFoto = negocio.getFileFoto();
			
			String fileName = fileFoto.getOriginalFilename();
			
			if(fileName.trim().length()>1){
				try{
					 FileUtil.guardarFileInPath(fileFoto.getBytes(), fileName, path);
					}catch (Exception e) {
						// TODO: handle exception
					}
					negocio.setFoto("images/"+node+"/"+fileName);
					negocioMapper.updateByPrimaryKeySelective(negocio);
			}
			

			negocio.setFileFoto(null);
		}
		
		/**Enviar notificacion al ADMINISTRADOR**/
		if(usuario.getRol()!=null &&  !usuario.getRol().getId().equals(Constante.USUARIO_ADMIN_ID)){
			
			Notificacion notificacion=new Notificacion();
			notificacion.setDescripcion("Verificar el registro del negocio "+negocio.getTitulo());
			notificacion.setTipoNotificacion(Constante.AVISO_SERVICIO_NOTIFICACION);
			notificacion.setTipoMedio(Constante.TIPO_MEDIO_MOBIL);
			notificacion.setUsuarioEmisor(usuario.getUsuario());
			notificacion.setUsuarioEmisorId(usuario.getId());
			notificacion.setEstado(Constante.ESTADO_ACTIVO);
			notificacion.setRolId(Constante.USUARIO_ADMIN_ID);
			notificacionService.saveAll(notificacion, usuario);
		}
		
		if(usuario.getRolid()!=null &&  !usuario.getRol().getId().equals(Constante.USUARIO_ADMIN_ID)){
			Notificacion notificacion=new Notificacion();
			notificacion.setDescripcion("Verificar el registro del negocio "+negocio.getTitulo());
			notificacion.setTipoNotificacion(Constante.AVISO_SERVICIO_NOTIFICACION);
			notificacion.setTipoMedio(Constante.TIPO_MEDIO_MOBIL);
			notificacion.setUsuarioEmisor(usuario.getUsuario());
			notificacion.setUsuarioEmisorId(usuario.getId());
			notificacion.setEstado(Constante.ESTADO_ACTIVO);
			notificacion.setRolId(Constante.USUARIO_ADMIN_ID);
			notificacionService.saveAll(notificacion, usuario);
		}
	
		
		return negocio;
	}
	
	

}
