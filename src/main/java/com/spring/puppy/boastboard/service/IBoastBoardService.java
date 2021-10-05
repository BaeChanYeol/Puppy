package com.spring.puppy.boastboard.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.puppy.command.BoastBoardVO;
import com.spring.puppy.command.FileVO;
import com.spring.puppy.util.PageVO;

public interface IBoastBoardService {
	
	//�� ���
	void boastRegist(BoastBoardVO vo);
	
	//�� ���
	List<BoastBoardVO> getList(PageVO vo);
	
	
	//총 게시물 수
	int getTotal(PageVO vo);
	//�� �󼼺���
	BoastBoardVO getContent(int bbno);
	
	//���ƿ䴩����
	BoastBoardVO getCount(int like_cnt);

	static List<BoastBoardVO> listAll(String search_option, String keyword, Object start, Object end) {
		return null;
	}
	
	//수정
	void update(BoastBoardVO vo);
	//파일 저장
	void fileRegist(FileVO fvo);
	//파일 얻기
	FileVO getFile(int bbno);
	
	//글번호 얻기
	int getBbno();
	
	//내가 쓴글 리스트
	List<BoastBoardVO> getMyList(String id,PageVO page);
		
	//내가 쓴글 개수
	int getMyTotal(String id,PageVO page);

	void delete(int bbno);

//	void delete(BoastBoardVO vo);
	
	//좋아요 업데이트
	void likeup(int bbno);
	void likedown(int bbno);

	//좋아요 정보 저장
	void likeSave(String id,int bbno);
	//좋아요 정보 삭제
	void likeDelete(String id, int bbno);
	//테이블 삭제시 좋아요 정보 삭제
	void likeDelete2(int bbno);
	//좋아요 체크
	int likeCheck(String id,int bbno);
	
	//좋아요 누른 글번호 리스트
	List<Integer> likeList(String id);
	//조회수 올리기
	public int updateView_cnt(int bbno);

	
	
}
