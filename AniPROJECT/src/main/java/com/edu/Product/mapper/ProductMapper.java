package com.edu.Product.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.edu.Product.domain.ProductDTO;
import com.edu.board.domain.Pagination;

@Repository("com.edu.Product.mapper.ProductMapper")
public interface ProductMapper {
	
	//게시글의 개수
	public int productCount() throws Exception;

	public int getproductListCnt() throws Exception;
	
	//게시글 목록 보기
	public List<ProductDTO> productList(Pagination pagination) throws Exception;
	
	//게시글 작성
	public int productInsert(ProductDTO product) throws Exception;
	
	//게시글 상제정보
	public ProductDTO productDetail(int productno) throws Exception;
	
	//파일올리기
	public int fileInsert(ProductDTO product) throws Exception;
		
	//파일 상세 정보
	public ProductDTO fileDetail(int Productno) throws Exception;

	//게시글 삭제
	public int productDelete(int Productno) throws Exception;
}
