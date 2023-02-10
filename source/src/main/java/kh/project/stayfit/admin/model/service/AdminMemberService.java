package kh.project.stayfit.admin.model.service;

import java.util.List;

import kh.project.stayfit.admin.model.vo.AdminMember;

public interface AdminMemberService {
	
	//회원목록조회
	public List<AdminMember> selectMember(String searchword, String sort) throws Exception;

}
