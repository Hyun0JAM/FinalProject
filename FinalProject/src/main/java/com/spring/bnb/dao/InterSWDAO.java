package com.spring.bnb.dao;

import java.util.HashMap;
import java.util.List;

public interface InterSWDAO {

	List<String> getBuildList();  // �ǹ�����(��)

	List<String> getOptionList();  // �ɼ�����

	List<String> getRoomType();  // ��������

	List<String> getRoomRule();  // ���� �̿��Ģ

	List<String> getBuildDetailList(String buildName1);  // �ǹ�����(��)

	
}
