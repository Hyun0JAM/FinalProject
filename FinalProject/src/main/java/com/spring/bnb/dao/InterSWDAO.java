package com.spring.bnb.dao;

import java.util.HashMap;
import java.util.List;

public interface InterSWDAO {

	List<HashMap<String, String>> getBuildList();  // �ǹ�����(��)

	List<String> getOptionList();  // �ɼ�����

	List<String> getRoomType();  // ��������

	List<String> getRoomRule();  // ���� �̿��Ģ

	
}
