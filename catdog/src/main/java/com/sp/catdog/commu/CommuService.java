package com.sp.catdog.commu;

import java.util.List;
import java.util.Map;

public interface CommuService {
	public List<Commu> listCommu(Map<String, Object> map);
	public List<Commu> listVideo(Map<String, Object> map);
}
