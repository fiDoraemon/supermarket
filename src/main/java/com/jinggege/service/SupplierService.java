package com.jinggege.service;

import com.jinggege.domain.Supplier;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public interface SupplierService {
    public List<Supplier> supplierInfo();
    public int addSupplier(Supplier supplier);

}
