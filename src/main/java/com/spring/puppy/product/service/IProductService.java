package com.spring.puppy.product.service;

import java.util.List;

import com.spring.puppy.command.CartVO;
import com.spring.puppy.command.OrderVO;
import com.spring.puppy.command.ProductVO;

public interface IProductService {

			// 상품 목록
			List<ProductVO> productList(); 
			
			// 상품 정보 얻기
			ProductVO getContent(int pno);
			
			//상품 장바구니 추가
			void regist(CartVO vo);
			
			//장바구니 상품 중복 체크
			int cartCheck(CartVO vo);
			
			//장바구니 목록
			List<CartVO> cartList();
			
			//장바구니 상품 삭제
			void delete(CartVO vo);
			
			//상품 주문 등록
			void orderRegist(OrderVO vo);
			
			//주문서 목록
			List<CartVO> orderList();
			
			//선택 상품 주문하기
			ProductVO selectByPnum(int pnum);
			
}
