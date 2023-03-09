package kh.project.stayfit.security.model.dao;

import java.util.ArrayList;

import kh.project.stayfit.security.model.dto.UserDetailsDto;

public interface Dao {
	public UserDetailsDto selectUser(String username);
	public ArrayList<String> getAuthList(String username);
}
