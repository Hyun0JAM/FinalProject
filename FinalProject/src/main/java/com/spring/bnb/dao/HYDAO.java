package com.spring.bnb.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

//===== #32. DAO ����  =====
@Repository
public class HYDAO implements InterHYDAO {
	//===== #33. ������ü �����ϱ�(DI:Dependency Injection)  =====
	@Autowired
	private SqlSessionTemplate sqlsession; // SqlSessionTemplate --> root-context.xml  #15.

}
