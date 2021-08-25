package com.team1.boxfix.validcheck;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team1.boxfix.member.MemberMapper;

@Service
public class ValidCheckDAO {
	
	@Autowired
	SqlSessionTemplate sst;
	private ValidCheckMapper vcm;
	
	public int userIdCheck(String b_id) {
		
	vcm = sst.getMapper(ValidCheckMapper.class);

	return vcm.checkId(b_id);

	}

	public int companyIdCheck(String c_id) {
		
	vcm = sst.getMapper(ValidCheckMapper.class);
	
		return vcm.companyCheckId(c_id);
	}

}
