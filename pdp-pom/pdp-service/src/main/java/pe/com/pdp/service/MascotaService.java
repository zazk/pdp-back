package pe.com.pdp.service;

import java.util.List;
import java.util.Map;
import pe.com.pdp.domain.postgres.Mascota;

public interface MascotaService {

	public Mascota obtenerPotID(Integer id);
	
	public List<Mascota> listarMascota(Mascota mascota);
	
	public Mascota save(Mascota mascota) throws Exception ;
	
	public void delete(Integer id);
	
	
	
	public List<Map<String, Object>> findListaMascota(Mascota mascota) throws Exception ;
	public int countMascotas(Mascota mascota)throws Exception;
	public int countTotalMascotas()throws Exception;
	
	
}
