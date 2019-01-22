package com.spring.bnb.dao;

import java.util.HashMap;
import java.util.List;

import com.spring.bnb.model.MemberVO;
import com.spring.bnb.model.ReportVO;

public interface InterSHDAO {

	// 검색없이 회원목록 보여주기
	List<MemberVO> getMemberList();

	// 검색해서 회원목록 보여주기
	List<MemberVO> getSearchMember(HashMap<String, String> paraMap);

	// 회원 상세페이지(MemberVO)
	MemberVO getMemberDetail(String userid);

	// 회원 상세페이지(예약코드)
	List<HashMap<String, String>> getReservation(String userid);

	// 회원 상세페이지(보유쿠폰)
	List<HashMap<String, String>> getMycoupon(String userid);
	
	// 신고글 가져오기
	List<ReportVO> getReport();

	// 검색조건에 만족하는 회원수를 알아오기
	int getTotalCountWithSearch(HashMap<String, String> paraMap);

	// 검색조건이 없는 회원수를 알아오기
	int getTotalCountNoSearch();

	// 검색조건이 없는것 또는 검색조건이 있는 회원전체목록 가져오기
	List<MemberVO> memberlistPaging(HashMap<String, String> paraMap);
}
