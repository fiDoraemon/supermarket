package com.jinggege.service.Impl;

import com.jinggege.dao.SupplierManage;
import com.jinggege.domain.Supplier;
import com.jinggege.service.SupplierService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class SupplierServiceImpl implements SupplierService {
    @Resource
    private SupplierManage supplierManage;
    @Override
    public List<Supplier> supplierInfo() {
        List<Supplier> suppliers = supplierManage.selectAll();
        return suppliers;
    }

    @Override
    public int addSupplier(Supplier supplier) {
        int i = supplierManage.insertSupplier(supplier);
        return i;
    }

}
