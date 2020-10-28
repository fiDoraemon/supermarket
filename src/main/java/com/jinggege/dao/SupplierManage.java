package com.jinggege.dao;

import com.jinggege.domain.Supplier;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface SupplierManage {
    public List<Supplier> selectAll();
    public int insertSupplier(Supplier supplier);

}
