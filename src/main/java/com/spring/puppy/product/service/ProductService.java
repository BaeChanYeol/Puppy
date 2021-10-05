package com.spring.puppy.product.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.puppy.command.CartVO;
import com.spring.puppy.command.OrderDetailVO;
import com.spring.puppy.command.OrderVO;
import com.spring.puppy.command.ProductQnaVO;
import com.spring.puppy.command.ProductVO;
import com.spring.puppy.command.ReviewVO;
import com.spring.puppy.command.ZzimVO;
import com.spring.puppy.product.mapper.IProductMapper;
import com.spring.puppy.util.PageVO;

@Service
public class ProductService implements IProductService{
	
	@Autowired
	private IProductMapper mapper;
	
	@Override
	public void pqnaRegist(ProductQnaVO vo) {
		mapper.pqnaRegist(vo);
	}
	
	@Override
	public List<ProductQnaVO> pqnaList(PageVO vo, int pno) {
		return mapper.pqnaList(vo, pno);
	}
	
	@Override
	public int getpqTotal(PageVO vo, int pno) {
		return mapper.getpqTotal(vo, pno);
	}
	
	@Override
	public List<ProductQnaVO> adminPQna(PageVO vo) {
		return mapper.adminPQna(vo);
	}
	
	@Override
	public int getAdminTotal(PageVO vo) {
		return mapper.getAdminTotal(vo);
	}
	
	@Override
	public ProductQnaVO getAdminPqna(int pno) {
		return mapper.getAdminPqna(pno);
	}
	
	@Override
	public void registAnswer(int pno, String writer) {
		mapper.registAnswer(pno, writer);
		
	}
	
	@Override
	public void pqdelete(int pqno) {
		mapper.pqdelete(pqno);
	}
	
	@Override
	public void reviewRegist(ReviewVO vo) {
		mapper.reviewRegist(vo);
		
	}
	@Override
	public int getTotal(PageVO vo, int pno) {
		return mapper.getTotal(vo, pno);
	}
	@Override
	public List<ReviewVO> getList(PageVO vo, int pno) {
		return mapper.getList(vo, pno);
	}
	@Override
	public void delete(int revno) {
		mapper.delete(revno);
		
	}

//	@Override
//	public List<ProductVO> productList() {
//		return mapper.productList();
//	}

	@Override
	public ProductVO getContent(int pno) {
		return mapper.getContent(pno);
		
	}
	@Override
	public void zzimRegist(ZzimVO vo) {
		mapper.zzimRegist(vo);
		
	}
	
	@Override
	public List<ZzimVO> zzimList(String writer) {
		return mapper.zzimList(writer);
	}
	
	@Override
	public void zzimdelete(ZzimVO vo) {
		mapper.zzimdelete(vo);
	}
	
	@Override
	public int zzimCheck(ZzimVO vo) {
		return mapper.zzimCheck(vo);
	}

	@Override
	public void zzimModify(ProductVO vo) {
		mapper.zzimModify(vo);
	}
	
	@Override
	public void regist(CartVO vo) {
		mapper.regist(vo);
		
	}

	@Override
	public List<CartVO> cartList(String writer) {
		return mapper.cartList(writer);
	}

	@Override
	public void delete(CartVO vo) {
		mapper.delete(vo);
		
	}

	@Override
	public int cartCheck(CartVO vo) {
		
		return mapper.cartCheck(vo);
	}

	

	@Override
	public List<CartVO> orderList() {
		return mapper.orderList();
	}

	@Override
	public ProductVO selectByPnum(int pnum) {
		return mapper.selectByPnum(pnum);
	}


	@Override
	public List<ProductVO> productList(PageVO vo, String type) {
		return mapper.productList(vo, type);
	}
	
	@Override
	public int getpTotal(PageVO vo, String type) {
		return mapper.getpTotal(vo, type);
	}


	@Override
	public void productRegist(ProductVO vo) {
		mapper.productRegist(vo);
		
	}
	
	@Override
	public void orderRegist(OrderVO vo) {
		mapper.orderRegist(vo);
		
	}


	@Override
	public void orderDetailRegist(OrderDetailVO vo) {
		mapper.orderDetailRegist(vo);
		
	}


	@Override
	public int getOrderno(OrderVO vo) {
		return mapper.getOrderno(vo);
	}
	
	@Override
	public int getOrderTotal(PageVO vo) {
		return mapper.getOrderTotal(vo);
	}
	@Override
	public List<OrderDetailVO> orderList(PageVO vo) {
		return mapper.orderList(vo);
	}
	
	@Override
	public List<OrderDetailVO> orderDetailList(PageVO vo) {
		return mapper.orderDetailList(vo);
	}
	
	@Override
	public List<OrderVO> orderDateList(PageVO vo) {
		return mapper.orderDateList(vo);
	}
	
	@Override
	public void cartReset(CartVO vo) {
		mapper.cartReset(vo);
	}

}
