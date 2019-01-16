package com.spring.bnb.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.bnb.model.RoomVO;

@Service
public interface InterSWService {

	List<String> getBuildList();  // �ǹ�����(��)

	List<String> getOptionList();  // �ɼ�����

	List<String> getRoomType();  // ��������

	List<String> getRoomRule();  // ���� �̿��Ģ

	List<String> getBuildDetailList(String buildName1);  // �ǹ�����(��)

	List<RoomVO> getRoomList();  // ���� ����Ʈ �ҷ�����

	
}
