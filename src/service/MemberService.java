package service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.IMemberDao;

@Service
public class MemberService {

	@Autowired
	private IMemberDao mdao;

	public List<HashMap<String, Object>> getMemberList() {

		return mdao.selectAll();
	}

	// public HashMap<String, Object> getOneMember(String id){
	// return mdao.selectOne(id);
	// }
	//
	// 회원 한명의 정보를 가져다주는
	public HashMap<String, Object> getMemberInfo(String id) {
		return mdao.selectOne(id);
	}

	public boolean joinMember(HashMap<String, Object> params) {
		if (params.get("userid") !=null &&params.get("userid") !="" && params.get("pwd").equals(params.get("pwd_CHECK"))) {
			mdao.insertMember(params);
			return true;
		} else
			return false;
	}

	public boolean login(String id, String pwd) {

		HashMap<String, Object> result = mdao.selectOne(id);

		if (result == null)
			return false;

		else {
			String oPwd = (String) result.get("pwd");

			if (oPwd == null)
				return false;

			else {
				if (oPwd.equals(pwd))
					return true;
				else
					return false;
			}
		}

	}

	public boolean memberUpdate(HashMap<String, Object> params) {

		// if (params.get("pwd") == null) {
		// return false;
		// } else if (params.get("pwd_CHECK") == null) {
		// return false;
		// } else {
		// if (params.get("pwd")!=null && params.get("pwd_CHECK") !=null
		// &&params.get("pwd").equals(params.get("pwd_CHECK"))) {
		// // HashMap<String, Object> record = mdao.selectOne((String)
		// // params.get(Constant.Member.USERID));
		// // record.putAll(params); // 원래있던거에 내가 받은걸로 수정
		// // mdao.updateMember(record);
		// mdao.updateMember(params);
		// return true;
		// } else
		// return false;
		// }
		if (params.get("pwd") != null && params.get("pwd_CHECK") != null
				&& params.get("pwd").equals(params.get("pwd_CHECK"))) {
			// HashMap<String, Object> record = mdao.selectOne((String)
			// params.get(Constant.Member.USERID));
			// record.putAll(params); // 원래있던거에 내가 받은걸로 수정
			// mdao.updateMember(record);
			String idchek =(String)params.get("userid");
			params.put("admin", getMemberInfo(idchek).get("admin"));
			mdao.updateMember(params);
			return true;
		} else
			return false;
	}

	public void memberDelete(String id) {
		mdao.deleteMember(id);
	}

}
