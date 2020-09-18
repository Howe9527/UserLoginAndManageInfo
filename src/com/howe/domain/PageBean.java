package com.howe.domain;

import java.util.List;

public class PageBean<T> {

    private int totalCount;//总记录数
    private int totalPage;//总页码
    private List<T> pageList;//每页的数据
    private int currentPage;//当前页码
    private int rows;//没页记录数

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public List<T> getPageList() {
        return pageList;
    }

    public void setPageList(List<T> pageList) {
        this.pageList = pageList;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getRows() {
        return rows;
    }

    public void setRows(int rows) {
        this.rows = rows;
    }

    @Override
    public String toString() {
        return "PageBean{" +
                "totalCount=" + totalCount +
                ", totalPage=" + totalPage +
                ", pageList=" + pageList +
                ", currentPage=" + currentPage +
                ", rows=" + rows +
                '}';
    }
}
