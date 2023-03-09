package kh.project.stayfit.security.model.service;

import java.util.ArrayList;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import kh.project.stayfit.security.model.dao.UserDetailDao;
import kh.project.stayfit.security.model.dto.UserDetailsDto;

//@Service("loginService")
public class LoginService implements UserDetailsService {
//	@Autowired
//	private SqlSessionTemplate sqlSession;
//	
//	@Override
//	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
//		ArrayList<String> authList = new ArrayList<String>();
//		Dao dao = sqlSession.getMapper(Dao.class);
//		
//		UserDetailsDto userDetailsDto = dao.selectUser(username);
//		authList = dao.getAuthList(username);
//		
//		if (userDetailsDto == null) { //User을 찾지 못했을 경우
//			throw new UsernameNotFoundException(username);
//		}
//		else {
//			userDetailsDto.setAuthority(authList);
//		}
//		
//		return userDetailsDto; //완전한 UserDetails 객체
//	}
	
//	@Autowired
//	private UserDetailDao dao;
//	@Autowired
//	private SqlSession sqlSession;
	
	public UserDetails loadUserByUsername(String memail) throws UsernameNotFoundException {
		UserDetailDao dao = new UserDetailDao();
		
		UserDetailsDto userDetailsDto = null;
		ArrayList<String> authList = new ArrayList<String>();
		
		try {
			userDetailsDto = dao.selectUser(memail);
			authList = (ArrayList<String>) dao.getAuthList(memail);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (userDetailsDto == null) { //User을 찾지 못했을 경우
			throw new UsernameNotFoundException(memail);
		}
		else {
			userDetailsDto.setAuthority(authList);
		}
		
		return userDetailsDto; //완전한 UserDetails 객체
	}
	
	
}
