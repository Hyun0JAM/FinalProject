package com.spring.bnb.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface InterSWService {

	List<HashMap<String, String>> getBuildList();  // �ǹ�����(��)

	List<String> getOptionList();  // �ɼ�����

	List<String> getRoomType();  // ��������

	List<String> getRoomRule();  // ���� �̿��Ģ

	
}
