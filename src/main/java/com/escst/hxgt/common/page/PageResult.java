package com.escst.hxgt.common.page;
import java.util.Collection;

/**
 * 用于封装分页参数和实现分页标签的类
 * @since jdk1.6
 * @version 1.0
 */
public class PageResult{
	
	/**
	 * 每页记录数
	 */
	private int pageSize;
	
	/**
	 * 总页码
	 */
    private int totalPage;
    
    /**
     * 当前页码
     */
    private int currentPage = 1;
    
    /**
     * 总记录数
     */
    private long totalCount;
    
    /**
     * 查询的form
     */
    private String form;
    

	/**
     * 分页中显示的记录对应的Vo类对象集合
     */
    private Collection<?> vos;              
   

    /**
	 * @return the pageSize
	 */
	public int getPageSize() {
		return pageSize;
	}

	/**
	 * @param pageSize the pageSize to set
	 */
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	/**
	 * @return the totalPage
	 */
	public int getTotalPage() {
		return totalPage;
	}

	/**
	 * @param totalPage the totalPage to set
	 */
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	/**
	 * @return the currentPage
	 */
	public int getCurrentPage() {
		return currentPage;
	}

	/**
	 * @param currentPage the currentPage to set
	 */
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public long getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(long totalCount) {
        this.totalCount = totalCount;
    }

    public Collection<?> getVos() {
        return vos;
    }

    public void setVos(Collection<?> vos) {
        this.vos = vos;
    }

    public String getForm() {
        return form;
    }

    public void setForm(String form) {
        this.form = form;
    }
}
