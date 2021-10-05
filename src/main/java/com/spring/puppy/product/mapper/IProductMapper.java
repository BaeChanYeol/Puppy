package com.spring.puppy.product.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.puppy.command.CartVO;
import com.spring.puppy.command.OrderDetailVO;
import com.spring.puppy.command.OrderVO;
import com.spring.puppy.command.ProductQnaVO;
import com.spring.puppy.command.ProductVO;
import com.spring.puppy.command.ReserveBoardVO;
import com.spring.puppy.command.ReviewVO;
import com.spring.puppy.command.ZzimVO;
import com.spring.puppy.util.PageVO;

public interface IProductMapper {
	
		//리뷰 등록
		void reviewRegist(ReviewVO vo);
		//리뷰 목록
		List<ReviewVO> getList(@Param("vo") PageVO vo, @Param("pno")int pno);
		//리뷰 개수
		int getTotal(@Param("vo") PageVO vo, @Param("pno") int pno);
		//리뷰 삭제
		void delete(int revno);
		
		//상품 qna 등록
		void pqnaRegist(ProductQnaVO vo);
		//상품 qna 목록
		List<ProductQnaVO> pqnaList(@Param("vo") PageVO vo, @Param("pno")int pno);
		
		List<ProductQnaVO> adminPQna(PageVO vo);
		int getAdminTotal(PageVO vo);
		ProductQnaVO getAdminPqna(int pno);
		void registAnswer(@Param("pno") int pno, @Param("answer") String answer);
		
		
		//상품 qna 개수
		int getpqTotal(@Param("vo") PageVO vo, @Param("pno") int pno);
		//상품 qna 삭제
		void pqdelete(int pqno);
		
		
		//상품 등록하기
		void productRegist(ProductVO vo);
	
		//목록 요청
		List<ProductVO> productList(@Param("vo") PageVO vo, @Param("type") String type); 
		
		//상품 수 카운트
		int getpTotal(@Param("vo") PageVO vo, @Param("type") String type);
		
		// 상품 정보 얻기
		ProductVO getContent(int pno);
		
		//찜 등록하기
		void zzimRegist(ZzimVO vo);
		
		//장바구니 목록
		List<ZzimVO> zzimList(String writer);
		
		//장바구니 상품 삭제
		void zzimdelete(ZzimVO vo);
		
		//찜 상품 중복 체크
		int zzimCheck(ZzimVO vo);
		
		//찜 상태 바꾸기
		void zzimModify(ProductVO vo);
		
		//상품 장바구니 추가
		void regist(CartVO vo);
		
		//장바구니 상품 중복 체크
		int cartCheck(CartVO vo);
		
		//장바구니 목록
		List<CartVO> cartList(String writer);
		
		//장바구니 상품 삭제
		void delete(CartVO vo);

		//주문서 목록
		List<CartVO> orderList();
		
		//선택 상품 주문하기
		ProductVO selectByPnum(int pnum);
		
		//상품 주문 테이블 등록
		void orderRegist(OrderVO vo);
		
		//주문 번호 구하기
		int getOrderno(OrderVO vo);
		
		//상품 주문 상세 테이블 등록
		void orderDetailRegist(OrderDetailVO vo);
		
		//주문 내역 개수 카운트
		int getOrderTotal(PageVO vo);
		
		//구매 내역
		List<OrderDetailVO> orderList(PageVO vo); 
		
		//구매내역 구분제목 부분
		List<OrderVO> orderDateList(PageVO vo); 
		
		//구매 내역
		List<OrderDetailVO> orderDetailList(PageVO vo); 
		
		//구매하면 장바구니에서 상품 삭제하기
		void cartReset(CartVO vo);
		
}
