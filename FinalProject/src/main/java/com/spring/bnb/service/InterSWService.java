package com.spring.bnb.service;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface InterSWService {

	List<String> getBuildList();  // �ǹ�����

	List<String> getOptionList();  // �ɼ�����

	List<String> getRoomType();  // ��������

	List<String> getRoomRule();  // ���� �̿��Ģ

}
