package com.spring.bnb.dao;

import java.util.List;

import com.spring.bnb.model.RoomVO;

public interface InterSWDAO {

	List<String> getBuildList();  // �ǹ�����(��)

	List<String> getOptionList();  // �ɼ�����

	List<String> getRoomType();  // ��������

	List<String> getRoomRule();  // ���� �̿��Ģ

	List<String> getBuildDetailList(String buildName1);  // �ǹ�����(��)

	List<RoomVO> getRoomList();  // ���� ����Ʈ �ҷ�����

	
}
